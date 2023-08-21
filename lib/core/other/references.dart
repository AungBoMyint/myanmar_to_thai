import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myanmar_to_thai/model/api/app_user.dart';

CollectionReference<AppUser> userCollection() =>
    FirebaseFirestore.instance.collection("users").withConverter<AppUser>(
          fromFirestore: (snap, __) => AppUser.fromJson(snap.data()!),
          toFirestore: (auth, __) => auth.toJson(),
        );

DocumentReference<AppUser> userDocument(String id) => userCollection().doc(id);

/* CollectionReference<Lesson> lessonCollection() =>
    FirebaseFirestore.instance.collection("lessons").withConverter<Lesson>(
          fromFirestore: (snap, __) => Lesson.fromJson(snap.data()!),
          toFirestore: (lesson, __) => lesson.toJson(),
        );

DocumentReference<Lesson> lessonDocument(String id) =>
    lessonCollection().doc(id);

CollectionReference<Content> contentCollection() =>
    FirebaseFirestore.instance.collection("contents").withConverter<Content>(
          fromFirestore: (snap, __) => Content.fromJson(snap.data()!),
          toFirestore: (content, __) => content.toJson(),
        );

DocumentReference<Content> contentDocument(String id) =>
    contentCollection().doc(id);
 */