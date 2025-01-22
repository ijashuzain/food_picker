part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    required Status phoneSendOtpStatus,
    required Status phoneVerifyOtpStatus,
    required Status checkAuthStatus,
    required Status googleLoginStatus,
    required Status logoutStatus,
    required User? user,
    required String verificationId,
    required String resendToken,
  }) = _AuthState;

  factory AuthState.initial() => AuthState(
        phoneSendOtpStatus: Status.initial(),
        phoneVerifyOtpStatus: Status.initial(),
        googleLoginStatus: Status.initial(),
        checkAuthStatus: Status.initial(),
        logoutStatus: Status.initial(),
        user: null,
        verificationId: "",
        resendToken: "",
      );
}
