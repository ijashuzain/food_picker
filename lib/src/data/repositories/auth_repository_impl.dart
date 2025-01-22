import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_picker/src/domain/repositories/auth_repository.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<UserCredential> googleLogin() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Future<(String verificationId, int? resendToken)> phoneSendOtp(
      String phoneNumber) async {
    final Completer<(String, int?)> completer = Completer();

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {},
      verificationFailed: (FirebaseAuthException e) {
        completer.completeError("Verification failed: ${e.message}");
      },
      codeSent: (String verificationId, int? resendToken) {
        completer.complete((verificationId, resendToken));
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
      timeout: const Duration(seconds: 60),
    );

    return completer.future;
  }

  @override
  Future<UserCredential> phoneVerifyOtp({
    required String verificationId,
    required String otp,
  }) async {
    try {
      final PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: otp);
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      throw "OTP verification failed: $e";
    }
  }

  @override
  Future<void> logout() async {
    return await FirebaseAuth.instance.signOut();
  }

  @override
  Future<User> checkAuth() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw Exception('User not logged in');
    } else {
      return user;
    }
  }
}
