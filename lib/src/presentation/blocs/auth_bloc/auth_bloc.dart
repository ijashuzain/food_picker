import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_picker/src/domain/repositories/auth_repository.dart';
import 'package:food_picker/src/presentation/core/status/status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc(this.authRepository) : super(AuthState.initial()) {
    on<_GoogleLogin>(_googleLogin);
    on<_PhoneSendOtp>(_phoneSendOtp);
    on<_PhoneVerifyOtp>(_phoneVerifyOtp);
    on<_Logout>(_logout);
    on<_CheckAuth>(_checkAuth);
  }

  _googleLogin(_GoogleLogin event, Emitter<AuthState> emit) async {
    try {
      emit(state.copyWith(googleLoginStatus: StatusLoading()));
      var response = await authRepository.googleLogin();
      emit(state.copyWith(
          googleLoginStatus: StatusSuccess(), user: response.user));
    } catch (e) {
      log(e.toString());
      emit(state.copyWith(googleLoginStatus: StatusFailure(e.toString())));
    }
  }

  _checkAuth(_CheckAuth event, Emitter<AuthState> emit) async {
    try {
      emit(state.copyWith(checkAuthStatus: StatusLoading()));
      var response = await authRepository.checkAuth();
      emit(state.copyWith(
          checkAuthStatus: StatusSuccess(), user: response));
    } catch (e) {
      emit(state.copyWith(checkAuthStatus: StatusFailure(e.toString())));
    }
  }

  _phoneSendOtp(_PhoneSendOtp event, Emitter<AuthState> emit) async {
    try {
      emit(state.copyWith(phoneSendOtpStatus: StatusLoading()));
      var response = await authRepository.phoneSendOtp(event.phoneNumber);
      emit(state.copyWith(
          phoneSendOtpStatus: StatusSuccess(),
          verificationId: response.$1,
          resendToken: response.$2.toString()));
    } catch (e) {
      emit(state.copyWith(phoneSendOtpStatus: StatusFailure(e.toString())));
    }
  }

  _phoneVerifyOtp(_PhoneVerifyOtp event, Emitter<AuthState> emit) async {
    try {
      emit(state.copyWith(phoneVerifyOtpStatus: StatusLoading()));
      var response = await authRepository.phoneVerifyOtp(
          verificationId: event.verificationId, otp: event.otp);
      emit(state.copyWith(
          phoneVerifyOtpStatus: StatusSuccess(), user: response.user));
    } catch (e) {
      emit(state.copyWith(phoneVerifyOtpStatus: StatusFailure(e.toString())));
    }
  }

  _logout(_Logout event, Emitter<AuthState> emit) async {
    try {
      emit(state.copyWith(logoutStatus: StatusLoading()));
      await authRepository.logout();
      emit(state.copyWith(
          logoutStatus: StatusSuccess(),
          user: null,
          verificationId: "",
          resendToken: ""));
    } catch (e) {
      emit(state.copyWith(logoutStatus: StatusFailure(e.toString())));
    }
  }
}
