// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'firebase_auth_exception_app.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FirebaseAuthExceptionApp {
  String get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) operationNotAllowed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String message)? operationNotAllowed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? operationNotAllowed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OperationNotAllowed value) operationNotAllowed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OperationNotAllowed value)? operationNotAllowed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OperationNotAllowed value)? operationNotAllowed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FirebaseAuthExceptionAppCopyWith<FirebaseAuthExceptionApp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FirebaseAuthExceptionAppCopyWith<$Res> {
  factory $FirebaseAuthExceptionAppCopyWith(FirebaseAuthExceptionApp value,
          $Res Function(FirebaseAuthExceptionApp) then) =
      _$FirebaseAuthExceptionAppCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class _$FirebaseAuthExceptionAppCopyWithImpl<$Res>
    implements $FirebaseAuthExceptionAppCopyWith<$Res> {
  _$FirebaseAuthExceptionAppCopyWithImpl(this._value, this._then);

  final FirebaseAuthExceptionApp _value;
  // ignore: unused_field
  final $Res Function(FirebaseAuthExceptionApp) _then;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$OperationNotAllowedCopyWith<$Res>
    implements $FirebaseAuthExceptionAppCopyWith<$Res> {
  factory _$$OperationNotAllowedCopyWith(_$OperationNotAllowed value,
          $Res Function(_$OperationNotAllowed) then) =
      __$$OperationNotAllowedCopyWithImpl<$Res>;
  @override
  $Res call({String message});
}

/// @nodoc
class __$$OperationNotAllowedCopyWithImpl<$Res>
    extends _$FirebaseAuthExceptionAppCopyWithImpl<$Res>
    implements _$$OperationNotAllowedCopyWith<$Res> {
  __$$OperationNotAllowedCopyWithImpl(
      _$OperationNotAllowed _value, $Res Function(_$OperationNotAllowed) _then)
      : super(_value, (v) => _then(v as _$OperationNotAllowed));

  @override
  _$OperationNotAllowed get _value => super._value as _$OperationNotAllowed;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$OperationNotAllowed(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OperationNotAllowed implements OperationNotAllowed {
  _$OperationNotAllowed({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'FirebaseAuthExceptionApp.operationNotAllowed(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OperationNotAllowed &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$OperationNotAllowedCopyWith<_$OperationNotAllowed> get copyWith =>
      __$$OperationNotAllowedCopyWithImpl<_$OperationNotAllowed>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) operationNotAllowed,
  }) {
    return operationNotAllowed(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String message)? operationNotAllowed,
  }) {
    return operationNotAllowed?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? operationNotAllowed,
    required TResult orElse(),
  }) {
    if (operationNotAllowed != null) {
      return operationNotAllowed(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OperationNotAllowed value) operationNotAllowed,
  }) {
    return operationNotAllowed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OperationNotAllowed value)? operationNotAllowed,
  }) {
    return operationNotAllowed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OperationNotAllowed value)? operationNotAllowed,
    required TResult orElse(),
  }) {
    if (operationNotAllowed != null) {
      return operationNotAllowed(this);
    }
    return orElse();
  }
}

abstract class OperationNotAllowed implements FirebaseAuthExceptionApp {
  factory OperationNotAllowed({required final String message}) =
      _$OperationNotAllowed;

  @override
  String get message => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$OperationNotAllowedCopyWith<_$OperationNotAllowed> get copyWith =>
      throw _privateConstructorUsedError;
}
