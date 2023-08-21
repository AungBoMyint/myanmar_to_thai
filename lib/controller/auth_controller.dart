import 'dart:async';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:myanmar_to_thai/core/other/loading.dart';
import 'package:myanmar_to_thai/core/other/references.dart';
import 'package:myanmar_to_thai/model/api/app_user.dart';

class AuthController extends GetxController {
  Rxn<AppUser?> authUser = Rxn<AppUser>(null);
  final _firebaseAuth = FirebaseAuth.instance;
  StreamSubscription? userDocScubscription;

  bool checkUserAuth() => !(_firebaseAuth.currentUser == null);

  Future<void> signInWithGoogle(String redirectRouteName) async {
    showLoading();
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      await FirebaseAuth.instance.signInWithCredential(credential);
      hideLoading();
      Get.toNamed(redirectRouteName);
      //Get.offNamed(redirectRouteUrl);
    } catch (e) {
      log("Sign in with google error: $e");
      hideLoading();
    }
  }

  Future<void> anonymousSignIn() async {
    try {
      await FirebaseAuth.instance.signInAnonymously();

      log("Signed in with temporary account.");
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          log("Anonymous auth hasn't been enabled for this project.");
          break;
        default:
          log("Unknown error.");
      }
    }
  }

  listenAuthStateChange() {
    _firebaseAuth.authStateChanges().listen((User? user) async {
      log("User Auth State Change: $user");
      if (user == null || (user.displayName == null || user.photoURL == null)) {
        authUser.value = null;
      } else {
        if (!(userDocScubscription == null)) userDocScubscription!.cancel();
        userDocScubscription =
            userDocument(user.uid).snapshots().listen((event) {
          if (event.exists) {
            authUser.value = event.data()!;
          }
        });
        //create new user if document does not exist
        final userRef = await userDocument(user.uid).get();
        final isExist = userRef.exists;
        if (isExist) {
          log("User is exist:$isExist");
          authUser.value = userRef.data()!;
        } else {
          log("User is not exist:$isExist");
          //if not exist nee to write new
          /*  authUser.value = AppUser(
            id: user.uid,
            userName: user.displayName ?? "Guest",
            email: user.email ?? "guest@gmail.com",
            photo: user.photoURL ?? "error",
            status: 0,
          ); */
          await userDocument(user.uid).set(authUser.value!);
        }
        log('User is signed in!');
      }
    });
  }

  @override
  void onInit() {
    listenAuthStateChange();
    super.onInit();
  }
}
