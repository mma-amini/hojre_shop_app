// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'check_user_response_dto_use_case.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CheckUserResponseDtoUseCase _$CheckUserResponseDtoUseCaseFromJson(
    Map<String, dynamic> json) {
  return _CheckUserResponseDtoUseCase.fromJson(json);
}

/// @nodoc
mixin _$CheckUserResponseDtoUseCase {
  String? get ClientSecret => throw _privateConstructorUsedError;
  String? get Code => throw _privateConstructorUsedError;
  int? get Minutes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CheckUserResponseDtoUseCaseCopyWith<CheckUserResponseDtoUseCase>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckUserResponseDtoUseCaseCopyWith<$Res> {
  factory $CheckUserResponseDtoUseCaseCopyWith(
          CheckUserResponseDtoUseCase value,
          $Res Function(CheckUserResponseDtoUseCase) then) =
      _$CheckUserResponseDtoUseCaseCopyWithImpl<$Res>;
  $Res call({String? ClientSecret, String? Code, int? Minutes});
}

/// @nodoc
class _$CheckUserResponseDtoUseCaseCopyWithImpl<$Res>
    implements $CheckUserResponseDtoUseCaseCopyWith<$Res> {
  _$CheckUserResponseDtoUseCaseCopyWithImpl(this._value, this._then);

  final CheckUserResponseDtoUseCase _value;
  // ignore: unused_field
  final $Res Function(CheckUserResponseDtoUseCase) _then;

  @override
  $Res call({
    Object? ClientSecret = freezed,
    Object? Code = freezed,
    Object? Minutes = freezed,
  }) {
    return _then(_value.copyWith(
      ClientSecret: ClientSecret == freezed
          ? _value.ClientSecret
          : ClientSecret // ignore: cast_nullable_to_non_nullable
              as String?,
      Code: Code == freezed
          ? _value.Code
          : Code // ignore: cast_nullable_to_non_nullable
              as String?,
      Minutes: Minutes == freezed
          ? _value.Minutes
          : Minutes // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_CheckUserResponseDtoUseCaseCopyWith<$Res>
    implements $CheckUserResponseDtoUseCaseCopyWith<$Res> {
  factory _$$_CheckUserResponseDtoUseCaseCopyWith(
          _$_CheckUserResponseDtoUseCase value,
          $Res Function(_$_CheckUserResponseDtoUseCase) then) =
      __$$_CheckUserResponseDtoUseCaseCopyWithImpl<$Res>;
  @override
  $Res call({String? ClientSecret, String? Code, int? Minutes});
}

/// @nodoc
class __$$_CheckUserResponseDtoUseCaseCopyWithImpl<$Res>
    extends _$CheckUserResponseDtoUseCaseCopyWithImpl<$Res>
    implements _$$_CheckUserResponseDtoUseCaseCopyWith<$Res> {
  __$$_CheckUserResponseDtoUseCaseCopyWithImpl(
      _$_CheckUserResponseDtoUseCase _value,
      $Res Function(_$_CheckUserResponseDtoUseCase) _then)
      : super(_value, (v) => _then(v as _$_CheckUserResponseDtoUseCase));

  @override
  _$_CheckUserResponseDtoUseCase get _value =>
      super._value as _$_CheckUserResponseDtoUseCase;

  @override
  $Res call({
    Object? ClientSecret = freezed,
    Object? Code = freezed,
    Object? Minutes = freezed,
  }) {
    return _then(_$_CheckUserResponseDtoUseCase(
      ClientSecret: ClientSecret == freezed
          ? _value.ClientSecret
          : ClientSecret // ignore: cast_nullable_to_non_nullable
              as String?,
      Code: Code == freezed
          ? _value.Code
          : Code // ignore: cast_nullable_to_non_nullable
              as String?,
      Minutes: Minutes == freezed
          ? _value.Minutes
          : Minutes // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CheckUserResponseDtoUseCase implements _CheckUserResponseDtoUseCase {
  _$_CheckUserResponseDtoUseCase({this.ClientSecret, this.Code, this.Minutes});

  factory _$_CheckUserResponseDtoUseCase.fromJson(Map<String, dynamic> json) =>
      _$$_CheckUserResponseDtoUseCaseFromJson(json);

  @override
  final String? ClientSecret;
  @override
  final String? Code;
  @override
  final int? Minutes;

  @override
  String toString() {
    return 'CheckUserResponseDtoUseCase(ClientSecret: $ClientSecret, Code: $Code, Minutes: $Minutes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CheckUserResponseDtoUseCase &&
            const DeepCollectionEquality()
                .equals(other.ClientSecret, ClientSecret) &&
            const DeepCollectionEquality().equals(other.Code, Code) &&
            const DeepCollectionEquality().equals(other.Minutes, Minutes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(ClientSecret),
      const DeepCollectionEquality().hash(Code),
      const DeepCollectionEquality().hash(Minutes));

  @JsonKey(ignore: true)
  @override
  _$$_CheckUserResponseDtoUseCaseCopyWith<_$_CheckUserResponseDtoUseCase>
      get copyWith => __$$_CheckUserResponseDtoUseCaseCopyWithImpl<
          _$_CheckUserResponseDtoUseCase>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CheckUserResponseDtoUseCaseToJson(this);
  }
}

abstract class _CheckUserResponseDtoUseCase
    implements CheckUserResponseDtoUseCase {
  factory _CheckUserResponseDtoUseCase(
      {final String? ClientSecret,
      final String? Code,
      final int? Minutes}) = _$_CheckUserResponseDtoUseCase;

  factory _CheckUserResponseDtoUseCase.fromJson(Map<String, dynamic> json) =
      _$_CheckUserResponseDtoUseCase.fromJson;

  @override
  String? get ClientSecret => throw _privateConstructorUsedError;
  @override
  String? get Code => throw _privateConstructorUsedError;
  @override
  int? get Minutes => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_CheckUserResponseDtoUseCaseCopyWith<_$_CheckUserResponseDtoUseCase>
      get copyWith => throw _privateConstructorUsedError;
}
