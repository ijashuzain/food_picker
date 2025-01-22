part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.googleLogin() = _GoogleLogin;
  const factory AuthEvent.phoneSendOtp(String phoneNumber) = _PhoneSendOtp;
  const factory AuthEvent.phoneVerifyOtp({required String verificationId, required String otp}) = _PhoneVerifyOtp;
  const factory AuthEvent.logout() = _Logout;
  const factory AuthEvent.checkAuth() = _CheckAuth;
}
