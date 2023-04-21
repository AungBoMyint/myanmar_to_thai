import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/lesson_ui_model.dart';
import '../../model/remote/auth_user.dart';
import '../../model/remote/content.dart';
import '../../model/remote/lesson.dart';

CollectionReference<AuthUser> userCollection() =>
    FirebaseFirestore.instance.collection("users").withConverter<AuthUser>(
          fromFirestore: (snap, __) => AuthUser.fromJson(snap.data()!),
          toFirestore: (auth, __) => auth.toJson(),
        );

DocumentReference<AuthUser> userDocument(String id) => userCollection().doc(id);

CollectionReference<Lesson> lessonCollection() =>
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
