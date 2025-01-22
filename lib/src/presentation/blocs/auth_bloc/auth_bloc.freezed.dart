// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() googleLogin,
    required TResult Function(String phoneNumber) phoneSendOtp,
    required TResult Function(String verificationId, String otp) phoneVerifyOtp,
    required TResult Function() logout,
    required TResult Function() checkAuth,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? googleLogin,
    TResult? Function(String phoneNumber)? phoneSendOtp,
    TResult? Function(String verificationId, String otp)? phoneVerifyOtp,
    TResult? Function()? logout,
    TResult? Function()? checkAuth,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? googleLogin,
    TResult Function(String phoneNumber)? phoneSendOtp,
    TResult Function(String verificationId, String otp)? phoneVerifyOtp,
    TResult Function()? logout,
    TResult Function()? checkAuth,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GoogleLogin value) googleLogin,
    required TResult Function(_PhoneSendOtp value) phoneSendOtp,
    required TResult Function(_PhoneVerifyOtp value) phoneVerifyOtp,
    required TResult Function(_Logout value) logout,
    required TResult Function(_CheckAuth value) checkAuth,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GoogleLogin value)? googleLogin,
    TResult? Function(_PhoneSendOtp value)? phoneSendOtp,
    TResult? Function(_PhoneVerifyOtp value)? phoneVerifyOtp,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_CheckAuth value)? checkAuth,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GoogleLogin value)? googleLogin,
    TResult Function(_PhoneSendOtp value)? phoneSendOtp,
    TResult Function(_PhoneVerifyOtp value)? phoneVerifyOtp,
    TResult Function(_Logout value)? logout,
    TResult Function(_CheckAuth value)? checkAuth,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GoogleLoginImplCopyWith<$Res> {
  factory _$$GoogleLoginImplCopyWith(
          _$GoogleLoginImpl value, $Res Function(_$GoogleLoginImpl) then) =
      __$$GoogleLoginImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GoogleLoginImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$GoogleLoginImpl>
    implements _$$GoogleLoginImplCopyWith<$Res> {
  __$$GoogleLoginImplCopyWithImpl(
      _$GoogleLoginImpl _value, $Res Function(_$GoogleLoginImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GoogleLoginImpl implements _GoogleLogin {
  const _$GoogleLoginImpl();

  @override
  String toString() {
    return 'AuthEvent.googleLogin()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GoogleLoginImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() googleLogin,
    required TResult Function(String phoneNumber) phoneSendOtp,
    required TResult Function(String verificationId, String otp) phoneVerifyOtp,
    required TResult Function() logout,
    required TResult Function() checkAuth,
  }) {
    return googleLogin();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? googleLogin,
    TResult? Function(String phoneNumber)? phoneSendOtp,
    TResult? Function(String verificationId, String otp)? phoneVerifyOtp,
    TResult? Function()? logout,
    TResult? Function()? checkAuth,
  }) {
    return googleLogin?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? googleLogin,
    TResult Function(String phoneNumber)? phoneSendOtp,
    TResult Function(String verificationId, String otp)? phoneVerifyOtp,
    TResult Function()? logout,
    TResult Function()? checkAuth,
    required TResult orElse(),
  }) {
    if (googleLogin != null) {
      return googleLogin();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GoogleLogin value) googleLogin,
    required TResult Function(_PhoneSendOtp value) phoneSendOtp,
    required TResult Function(_PhoneVerifyOtp value) phoneVerifyOtp,
    required TResult Function(_Logout value) logout,
    required TResult Function(_CheckAuth value) checkAuth,
  }) {
    return googleLogin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GoogleLogin value)? googleLogin,
    TResult? Function(_PhoneSendOtp value)? phoneSendOtp,
    TResult? Function(_PhoneVerifyOtp value)? phoneVerifyOtp,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_CheckAuth value)? checkAuth,
  }) {
    return googleLogin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GoogleLogin value)? googleLogin,
    TResult Function(_PhoneSendOtp value)? phoneSendOtp,
    TResult Function(_PhoneVerifyOtp value)? phoneVerifyOtp,
    TResult Function(_Logout value)? logout,
    TResult Function(_CheckAuth value)? checkAuth,
    required TResult orElse(),
  }) {
    if (googleLogin != null) {
      return googleLogin(this);
    }
    return orElse();
  }
}

abstract class _GoogleLogin implements AuthEvent {
  const factory _GoogleLogin() = _$GoogleLoginImpl;
}

/// @nodoc
abstract class _$$PhoneSendOtpImplCopyWith<$Res> {
  factory _$$PhoneSendOtpImplCopyWith(
          _$PhoneSendOtpImpl value, $Res Function(_$PhoneSendOtpImpl) then) =
      __$$PhoneSendOtpImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String phoneNumber});
}

/// @nodoc
class __$$PhoneSendOtpImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$PhoneSendOtpImpl>
    implements _$$PhoneSendOtpImplCopyWith<$Res> {
  __$$PhoneSendOtpImplCopyWithImpl(
      _$PhoneSendOtpImpl _value, $Res Function(_$PhoneSendOtpImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
  }) {
    return _then(_$PhoneSendOtpImpl(
      null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PhoneSendOtpImpl implements _PhoneSendOtp {
  const _$PhoneSendOtpImpl(this.phoneNumber);

  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'AuthEvent.phoneSendOtp(phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhoneSendOtpImpl &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PhoneSendOtpImplCopyWith<_$PhoneSendOtpImpl> get copyWith =>
      __$$PhoneSendOtpImplCopyWithImpl<_$PhoneSendOtpImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() googleLogin,
    required TResult Function(String phoneNumber) phoneSendOtp,
    required TResult Function(String verificationId, String otp) phoneVerifyOtp,
    required TResult Function() logout,
    required TResult Function() checkAuth,
  }) {
    return phoneSendOtp(phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? googleLogin,
    TResult? Function(String phoneNumber)? phoneSendOtp,
    TResult? Function(String verificationId, String otp)? phoneVerifyOtp,
    TResult? Function()? logout,
    TResult? Function()? checkAuth,
  }) {
    return phoneSendOtp?.call(phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? googleLogin,
    TResult Function(String phoneNumber)? phoneSendOtp,
    TResult Function(String verificationId, String otp)? phoneVerifyOtp,
    TResult Function()? logout,
    TResult Function()? checkAuth,
    required TResult orElse(),
  }) {
    if (phoneSendOtp != null) {
      return phoneSendOtp(phoneNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GoogleLogin value) googleLogin,
    required TResult Function(_PhoneSendOtp value) phoneSendOtp,
    required TResult Function(_PhoneVerifyOtp value) phoneVerifyOtp,
    required TResult Function(_Logout value) logout,
    required TResult Function(_CheckAuth value) checkAuth,
  }) {
    return phoneSendOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GoogleLogin value)? googleLogin,
    TResult? Function(_PhoneSendOtp value)? phoneSendOtp,
    TResult? Function(_PhoneVerifyOtp value)? phoneVerifyOtp,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_CheckAuth value)? checkAuth,
  }) {
    return phoneSendOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GoogleLogin value)? googleLogin,
    TResult Function(_PhoneSendOtp value)? phoneSendOtp,
    TResult Function(_PhoneVerifyOtp value)? phoneVerifyOtp,
    TResult Function(_Logout value)? logout,
    TResult Function(_CheckAuth value)? checkAuth,
    required TResult orElse(),
  }) {
    if (phoneSendOtp != null) {
      return phoneSendOtp(this);
    }
    return orElse();
  }
}

abstract class _PhoneSendOtp implements AuthEvent {
  const factory _PhoneSendOtp(final String phoneNumber) = _$PhoneSendOtpImpl;

  String get phoneNumber;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PhoneSendOtpImplCopyWith<_$PhoneSendOtpImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PhoneVerifyOtpImplCopyWith<$Res> {
  factory _$$PhoneVerifyOtpImplCopyWith(_$PhoneVerifyOtpImpl value,
          $Res Function(_$PhoneVerifyOtpImpl) then) =
      __$$PhoneVerifyOtpImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String verificationId, String otp});
}

/// @nodoc
class __$$PhoneVerifyOtpImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$PhoneVerifyOtpImpl>
    implements _$$PhoneVerifyOtpImplCopyWith<$Res> {
  __$$PhoneVerifyOtpImplCopyWithImpl(
      _$PhoneVerifyOtpImpl _value, $Res Function(_$PhoneVerifyOtpImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verificationId = null,
    Object? otp = null,
  }) {
    return _then(_$PhoneVerifyOtpImpl(
      verificationId: null == verificationId
          ? _value.verificationId
          : verificationId // ignore: cast_nullable_to_non_nullable
              as String,
      otp: null == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PhoneVerifyOtpImpl implements _PhoneVerifyOtp {
  const _$PhoneVerifyOtpImpl({required this.verificationId, required this.otp});

  @override
  final String verificationId;
  @override
  final String otp;

  @override
  String toString() {
    return 'AuthEvent.phoneVerifyOtp(verificationId: $verificationId, otp: $otp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhoneVerifyOtpImpl &&
            (identical(other.verificationId, verificationId) ||
                other.verificationId == verificationId) &&
            (identical(other.otp, otp) || other.otp == otp));
  }

  @override
  int get hashCode => Object.hash(runtimeType, verificationId, otp);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PhoneVerifyOtpImplCopyWith<_$PhoneVerifyOtpImpl> get copyWith =>
      __$$PhoneVerifyOtpImplCopyWithImpl<_$PhoneVerifyOtpImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() googleLogin,
    required TResult Function(String phoneNumber) phoneSendOtp,
    required TResult Function(String verificationId, String otp) phoneVerifyOtp,
    required TResult Function() logout,
    required TResult Function() checkAuth,
  }) {
    return phoneVerifyOtp(verificationId, otp);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? googleLogin,
    TResult? Function(String phoneNumber)? phoneSendOtp,
    TResult? Function(String verificationId, String otp)? phoneVerifyOtp,
    TResult? Function()? logout,
    TResult? Function()? checkAuth,
  }) {
    return phoneVerifyOtp?.call(verificationId, otp);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? googleLogin,
    TResult Function(String phoneNumber)? phoneSendOtp,
    TResult Function(String verificationId, String otp)? phoneVerifyOtp,
    TResult Function()? logout,
    TResult Function()? checkAuth,
    required TResult orElse(),
  }) {
    if (phoneVerifyOtp != null) {
      return phoneVerifyOtp(verificationId, otp);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GoogleLogin value) googleLogin,
    required TResult Function(_PhoneSendOtp value) phoneSendOtp,
    required TResult Function(_PhoneVerifyOtp value) phoneVerifyOtp,
    required TResult Function(_Logout value) logout,
    required TResult Function(_CheckAuth value) checkAuth,
  }) {
    return phoneVerifyOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GoogleLogin value)? googleLogin,
    TResult? Function(_PhoneSendOtp value)? phoneSendOtp,
    TResult? Function(_PhoneVerifyOtp value)? phoneVerifyOtp,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_CheckAuth value)? checkAuth,
  }) {
    return phoneVerifyOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GoogleLogin value)? googleLogin,
    TResult Function(_PhoneSendOtp value)? phoneSendOtp,
    TResult Function(_PhoneVerifyOtp value)? phoneVerifyOtp,
    TResult Function(_Logout value)? logout,
    TResult Function(_CheckAuth value)? checkAuth,
    required TResult orElse(),
  }) {
    if (phoneVerifyOtp != null) {
      return phoneVerifyOtp(this);
    }
    return orElse();
  }
}

abstract class _PhoneVerifyOtp implements AuthEvent {
  const factory _PhoneVerifyOtp(
      {required final String verificationId,
      required final String otp}) = _$PhoneVerifyOtpImpl;

  String get verificationId;
  String get otp;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PhoneVerifyOtpImplCopyWith<_$PhoneVerifyOtpImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LogoutImplCopyWith<$Res> {
  factory _$$LogoutImplCopyWith(
          _$LogoutImpl value, $Res Function(_$LogoutImpl) then) =
      __$$LogoutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogoutImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$LogoutImpl>
    implements _$$LogoutImplCopyWith<$Res> {
  __$$LogoutImplCopyWithImpl(
      _$LogoutImpl _value, $Res Function(_$LogoutImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LogoutImpl implements _Logout {
  const _$LogoutImpl();

  @override
  String toString() {
    return 'AuthEvent.logout()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogoutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() googleLogin,
    required TResult Function(String phoneNumber) phoneSendOtp,
    required TResult Function(String verificationId, String otp) phoneVerifyOtp,
    required TResult Function() logout,
    required TResult Function() checkAuth,
  }) {
    return logout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? googleLogin,
    TResult? Function(String phoneNumber)? phoneSendOtp,
    TResult? Function(String verificationId, String otp)? phoneVerifyOtp,
    TResult? Function()? logout,
    TResult? Function()? checkAuth,
  }) {
    return logout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? googleLogin,
    TResult Function(String phoneNumber)? phoneSendOtp,
    TResult Function(String verificationId, String otp)? phoneVerifyOtp,
    TResult Function()? logout,
    TResult Function()? checkAuth,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GoogleLogin value) googleLogin,
    required TResult Function(_PhoneSendOtp value) phoneSendOtp,
    required TResult Function(_PhoneVerifyOtp value) phoneVerifyOtp,
    required TResult Function(_Logout value) logout,
    required TResult Function(_CheckAuth value) checkAuth,
  }) {
    return logout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GoogleLogin value)? googleLogin,
    TResult? Function(_PhoneSendOtp value)? phoneSendOtp,
    TResult? Function(_PhoneVerifyOtp value)? phoneVerifyOtp,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_CheckAuth value)? checkAuth,
  }) {
    return logout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GoogleLogin value)? googleLogin,
    TResult Function(_PhoneSendOtp value)? phoneSendOtp,
    TResult Function(_PhoneVerifyOtp value)? phoneVerifyOtp,
    TResult Function(_Logout value)? logout,
    TResult Function(_CheckAuth value)? checkAuth,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(this);
    }
    return orElse();
  }
}

abstract class _Logout implements AuthEvent {
  const factory _Logout() = _$LogoutImpl;
}

/// @nodoc
abstract class _$$CheckAuthImplCopyWith<$Res> {
  factory _$$CheckAuthImplCopyWith(
          _$CheckAuthImpl value, $Res Function(_$CheckAuthImpl) then) =
      __$$CheckAuthImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckAuthImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$CheckAuthImpl>
    implements _$$CheckAuthImplCopyWith<$Res> {
  __$$CheckAuthImplCopyWithImpl(
      _$CheckAuthImpl _value, $Res Function(_$CheckAuthImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CheckAuthImpl implements _CheckAuth {
  const _$CheckAuthImpl();

  @override
  String toString() {
    return 'AuthEvent.checkAuth()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CheckAuthImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() googleLogin,
    required TResult Function(String phoneNumber) phoneSendOtp,
    required TResult Function(String verificationId, String otp) phoneVerifyOtp,
    required TResult Function() logout,
    required TResult Function() checkAuth,
  }) {
    return checkAuth();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? googleLogin,
    TResult? Function(String phoneNumber)? phoneSendOtp,
    TResult? Function(String verificationId, String otp)? phoneVerifyOtp,
    TResult? Function()? logout,
    TResult? Function()? checkAuth,
  }) {
    return checkAuth?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? googleLogin,
    TResult Function(String phoneNumber)? phoneSendOtp,
    TResult Function(String verificationId, String otp)? phoneVerifyOtp,
    TResult Function()? logout,
    TResult Function()? checkAuth,
    required TResult orElse(),
  }) {
    if (checkAuth != null) {
      return checkAuth();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GoogleLogin value) googleLogin,
    required TResult Function(_PhoneSendOtp value) phoneSendOtp,
    required TResult Function(_PhoneVerifyOtp value) phoneVerifyOtp,
    required TResult Function(_Logout value) logout,
    required TResult Function(_CheckAuth value) checkAuth,
  }) {
    return checkAuth(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GoogleLogin value)? googleLogin,
    TResult? Function(_PhoneSendOtp value)? phoneSendOtp,
    TResult? Function(_PhoneVerifyOtp value)? phoneVerifyOtp,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_CheckAuth value)? checkAuth,
  }) {
    return checkAuth?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GoogleLogin value)? googleLogin,
    TResult Function(_PhoneSendOtp value)? phoneSendOtp,
    TResult Function(_PhoneVerifyOtp value)? phoneVerifyOtp,
    TResult Function(_Logout value)? logout,
    TResult Function(_CheckAuth value)? checkAuth,
    required TResult orElse(),
  }) {
    if (checkAuth != null) {
      return checkAuth(this);
    }
    return orElse();
  }
}

abstract class _CheckAuth implements AuthEvent {
  const factory _CheckAuth() = _$CheckAuthImpl;
}

/// @nodoc
mixin _$AuthState {
  Status get phoneSendOtpStatus => throw _privateConstructorUsedError;
  Status get phoneVerifyOtpStatus => throw _privateConstructorUsedError;
  Status get checkAuthStatus => throw _privateConstructorUsedError;
  Status get googleLoginStatus => throw _privateConstructorUsedError;
  Status get logoutStatus => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  String get verificationId => throw _privateConstructorUsedError;
  String get resendToken => throw _privateConstructorUsedError;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
  @useResult
  $Res call(
      {Status phoneSendOtpStatus,
      Status phoneVerifyOtpStatus,
      Status checkAuthStatus,
      Status googleLoginStatus,
      Status logoutStatus,
      User? user,
      String verificationId,
      String resendToken});

  $StatusCopyWith<$Res> get phoneSendOtpStatus;
  $StatusCopyWith<$Res> get phoneVerifyOtpStatus;
  $StatusCopyWith<$Res> get checkAuthStatus;
  $StatusCopyWith<$Res> get googleLoginStatus;
  $StatusCopyWith<$Res> get logoutStatus;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneSendOtpStatus = null,
    Object? phoneVerifyOtpStatus = null,
    Object? checkAuthStatus = null,
    Object? googleLoginStatus = null,
    Object? logoutStatus = null,
    Object? user = freezed,
    Object? verificationId = null,
    Object? resendToken = null,
  }) {
    return _then(_value.copyWith(
      phoneSendOtpStatus: null == phoneSendOtpStatus
          ? _value.phoneSendOtpStatus
          : phoneSendOtpStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      phoneVerifyOtpStatus: null == phoneVerifyOtpStatus
          ? _value.phoneVerifyOtpStatus
          : phoneVerifyOtpStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      checkAuthStatus: null == checkAuthStatus
          ? _value.checkAuthStatus
          : checkAuthStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      googleLoginStatus: null == googleLoginStatus
          ? _value.googleLoginStatus
          : googleLoginStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      logoutStatus: null == logoutStatus
          ? _value.logoutStatus
          : logoutStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      verificationId: null == verificationId
          ? _value.verificationId
          : verificationId // ignore: cast_nullable_to_non_nullable
              as String,
      resendToken: null == resendToken
          ? _value.resendToken
          : resendToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StatusCopyWith<$Res> get phoneSendOtpStatus {
    return $StatusCopyWith<$Res>(_value.phoneSendOtpStatus, (value) {
      return _then(_value.copyWith(phoneSendOtpStatus: value) as $Val);
    });
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StatusCopyWith<$Res> get phoneVerifyOtpStatus {
    return $StatusCopyWith<$Res>(_value.phoneVerifyOtpStatus, (value) {
      return _then(_value.copyWith(phoneVerifyOtpStatus: value) as $Val);
    });
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StatusCopyWith<$Res> get checkAuthStatus {
    return $StatusCopyWith<$Res>(_value.checkAuthStatus, (value) {
      return _then(_value.copyWith(checkAuthStatus: value) as $Val);
    });
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StatusCopyWith<$Res> get googleLoginStatus {
    return $StatusCopyWith<$Res>(_value.googleLoginStatus, (value) {
      return _then(_value.copyWith(googleLoginStatus: value) as $Val);
    });
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StatusCopyWith<$Res> get logoutStatus {
    return $StatusCopyWith<$Res>(_value.logoutStatus, (value) {
      return _then(_value.copyWith(logoutStatus: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AuthStateImplCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$AuthStateImplCopyWith(
          _$AuthStateImpl value, $Res Function(_$AuthStateImpl) then) =
      __$$AuthStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status phoneSendOtpStatus,
      Status phoneVerifyOtpStatus,
      Status checkAuthStatus,
      Status googleLoginStatus,
      Status logoutStatus,
      User? user,
      String verificationId,
      String resendToken});

  @override
  $StatusCopyWith<$Res> get phoneSendOtpStatus;
  @override
  $StatusCopyWith<$Res> get phoneVerifyOtpStatus;
  @override
  $StatusCopyWith<$Res> get checkAuthStatus;
  @override
  $StatusCopyWith<$Res> get googleLoginStatus;
  @override
  $StatusCopyWith<$Res> get logoutStatus;
}

/// @nodoc
class __$$AuthStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateImpl>
    implements _$$AuthStateImplCopyWith<$Res> {
  __$$AuthStateImplCopyWithImpl(
      _$AuthStateImpl _value, $Res Function(_$AuthStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneSendOtpStatus = null,
    Object? phoneVerifyOtpStatus = null,
    Object? checkAuthStatus = null,
    Object? googleLoginStatus = null,
    Object? logoutStatus = null,
    Object? user = freezed,
    Object? verificationId = null,
    Object? resendToken = null,
  }) {
    return _then(_$AuthStateImpl(
      phoneSendOtpStatus: null == phoneSendOtpStatus
          ? _value.phoneSendOtpStatus
          : phoneSendOtpStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      phoneVerifyOtpStatus: null == phoneVerifyOtpStatus
          ? _value.phoneVerifyOtpStatus
          : phoneVerifyOtpStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      checkAuthStatus: null == checkAuthStatus
          ? _value.checkAuthStatus
          : checkAuthStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      googleLoginStatus: null == googleLoginStatus
          ? _value.googleLoginStatus
          : googleLoginStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      logoutStatus: null == logoutStatus
          ? _value.logoutStatus
          : logoutStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      verificationId: null == verificationId
          ? _value.verificationId
          : verificationId // ignore: cast_nullable_to_non_nullable
              as String,
      resendToken: null == resendToken
          ? _value.resendToken
          : resendToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthStateImpl implements _AuthState {
  const _$AuthStateImpl(
      {required this.phoneSendOtpStatus,
      required this.phoneVerifyOtpStatus,
      required this.checkAuthStatus,
      required this.googleLoginStatus,
      required this.logoutStatus,
      required this.user,
      required this.verificationId,
      required this.resendToken});

  @override
  final Status phoneSendOtpStatus;
  @override
  final Status phoneVerifyOtpStatus;
  @override
  final Status checkAuthStatus;
  @override
  final Status googleLoginStatus;
  @override
  final Status logoutStatus;
  @override
  final User? user;
  @override
  final String verificationId;
  @override
  final String resendToken;

  @override
  String toString() {
    return 'AuthState(phoneSendOtpStatus: $phoneSendOtpStatus, phoneVerifyOtpStatus: $phoneVerifyOtpStatus, checkAuthStatus: $checkAuthStatus, googleLoginStatus: $googleLoginStatus, logoutStatus: $logoutStatus, user: $user, verificationId: $verificationId, resendToken: $resendToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateImpl &&
            (identical(other.phoneSendOtpStatus, phoneSendOtpStatus) ||
                other.phoneSendOtpStatus == phoneSendOtpStatus) &&
            (identical(other.phoneVerifyOtpStatus, phoneVerifyOtpStatus) ||
                other.phoneVerifyOtpStatus == phoneVerifyOtpStatus) &&
            (identical(other.checkAuthStatus, checkAuthStatus) ||
                other.checkAuthStatus == checkAuthStatus) &&
            (identical(other.googleLoginStatus, googleLoginStatus) ||
                other.googleLoginStatus == googleLoginStatus) &&
            (identical(other.logoutStatus, logoutStatus) ||
                other.logoutStatus == logoutStatus) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.verificationId, verificationId) ||
                other.verificationId == verificationId) &&
            (identical(other.resendToken, resendToken) ||
                other.resendToken == resendToken));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      phoneSendOtpStatus,
      phoneVerifyOtpStatus,
      checkAuthStatus,
      googleLoginStatus,
      logoutStatus,
      user,
      verificationId,
      resendToken);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      __$$AuthStateImplCopyWithImpl<_$AuthStateImpl>(this, _$identity);
}

abstract class _AuthState implements AuthState {
  const factory _AuthState(
      {required final Status phoneSendOtpStatus,
      required final Status phoneVerifyOtpStatus,
      required final Status checkAuthStatus,
      required final Status googleLoginStatus,
      required final Status logoutStatus,
      required final User? user,
      required final String verificationId,
      required final String resendToken}) = _$AuthStateImpl;

  @override
  Status get phoneSendOtpStatus;
  @override
  Status get phoneVerifyOtpStatus;
  @override
  Status get checkAuthStatus;
  @override
  Status get googleLoginStatus;
  @override
  Status get logoutStatus;
  @override
  User? get user;
  @override
  String get verificationId;
  @override
  String get resendToken;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
