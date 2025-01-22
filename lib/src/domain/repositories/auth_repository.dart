import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<User> checkAuth();
  Future<UserCredential> googleLogin();
  Future<(String, int?)> phoneSendOtp(String phoneNumber);
  Future<UserCredential> phoneVerifyOtp(
      {required String verificationId, required String otp});
  Future<void> logout();
}
