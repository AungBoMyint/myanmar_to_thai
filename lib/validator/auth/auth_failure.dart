import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

@freezed
class AuthFailure with _$AuthFailure {
  const factory AuthFailure.googleSignInFailure() = _GoogleSignInFailure;
  const factory AuthFailure.annonymousSignInFailure() =
      _AnnonymousSignInFailure;
}
