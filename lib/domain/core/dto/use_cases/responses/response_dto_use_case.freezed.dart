// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'response_dto_use_case.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ResponseDtoUseCase _$ResponseDtoUseCaseFromJson(Map<String, dynamic> json) {
  return _ResponseDtoUseCase.fromJson(json);
}

/// @nodoc
mixin _$ResponseDtoUseCase {
  int? get statusCode => throw _privateConstructorUsedError;
  MessageDtoUseCase? get message => throw _privateConstructorUsedError;
  dynamic? get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResponseDtoUseCaseCopyWith<ResponseDtoUseCase> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseDtoUseCaseCopyWith<$Res> {
  factory $ResponseDtoUseCaseCopyWith(
          ResponseDtoUseCase value, $Res Function(ResponseDtoUseCase) then) =
      _$ResponseDtoUseCaseCopyWithImpl<$Res>;
  $Res call({int? statusCode, MessageDtoUseCase? message, dynamic? content});

  $MessageDtoUseCaseCopyWith<$Res>? get message;
}

/// @nodoc
class _$ResponseDtoUseCaseCopyWithImpl<$Res>
    implements $ResponseDtoUseCaseCopyWith<$Res> {
  _$ResponseDtoUseCaseCopyWithImpl(this._value, this._then);

  final ResponseDtoUseCase _value;
  // ignore: unused_field
  final $Res Function(ResponseDtoUseCase) _then;

  @override
  $Res call({
    Object? statusCode = freezed,
    Object? message = freezed,
    Object? content = freezed,
  }) {
    return _then(_value.copyWith(
      statusCode: statusCode == freezed
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as MessageDtoUseCase?,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as dynamic?,
    ));
  }

  @override
  $MessageDtoUseCaseCopyWith<$Res>? get message {
    if (_value.message == null) {
      return null;
    }

    return $MessageDtoUseCaseCopyWith<$Res>(_value.message!, (value) {
      return _then(_value.copyWith(message: value));
    });
  }
}

/// @nodoc
abstract class _$$_ResponseDtoUseCaseCopyWith<$Res>
    implements $ResponseDtoUseCaseCopyWith<$Res> {
  factory _$$_ResponseDtoUseCaseCopyWith(_$_ResponseDtoUseCase value,
          $Res Function(_$_ResponseDtoUseCase) then) =
      __$$_ResponseDtoUseCaseCopyWithImpl<$Res>;
  @override
  $Res call({int? statusCode, MessageDtoUseCase? message, dynamic? content});

  @override
  $MessageDtoUseCaseCopyWith<$Res>? get message;
}

/// @nodoc
class __$$_ResponseDtoUseCaseCopyWithImpl<$Res>
    extends _$ResponseDtoUseCaseCopyWithImpl<$Res>
    implements _$$_ResponseDtoUseCaseCopyWith<$Res> {
  __$$_ResponseDtoUseCaseCopyWithImpl(
      _$_ResponseDtoUseCase _value, $Res Function(_$_ResponseDtoUseCase) _then)
      : super(_value, (v) => _then(v as _$_ResponseDtoUseCase));

  @override
  _$_ResponseDtoUseCase get _value => super._value as _$_ResponseDtoUseCase;

  @override
  $Res call({
    Object? statusCode = freezed,
    Object? message = freezed,
    Object? content = freezed,
  }) {
    return _then(_$_ResponseDtoUseCase(
      statusCode: statusCode == freezed
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as MessageDtoUseCase?,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as dynamic?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ResponseDtoUseCase implements _ResponseDtoUseCase {
  _$_ResponseDtoUseCase({this.statusCode, this.message, this.content});

  factory _$_ResponseDtoUseCase.fromJson(Map<String, dynamic> json) =>
      _$$_ResponseDtoUseCaseFromJson(json);

  @override
  final int? statusCode;
  @override
  final MessageDtoUseCase? message;
  @override
  final dynamic? content;

  @override
  String toString() {
    return 'ResponseDtoUseCase(statusCode: $statusCode, message: $message, content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResponseDtoUseCase &&
            const DeepCollectionEquality()
                .equals(other.statusCode, statusCode) &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality().equals(other.content, content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(statusCode),
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(content));

  @JsonKey(ignore: true)
  @override
  _$$_ResponseDtoUseCaseCopyWith<_$_ResponseDtoUseCase> get copyWith =>
      __$$_ResponseDtoUseCaseCopyWithImpl<_$_ResponseDtoUseCase>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResponseDtoUseCaseToJson(this);
  }
}

abstract class _ResponseDtoUseCase implements ResponseDtoUseCase {
  factory _ResponseDtoUseCase(
      {final int? statusCode,
      final MessageDtoUseCase? message,
      final dynamic? content}) = _$_ResponseDtoUseCase;

  factory _ResponseDtoUseCase.fromJson(Map<String, dynamic> json) =
      _$_ResponseDtoUseCase.fromJson;

  @override
  int? get statusCode;
  @override
  MessageDtoUseCase? get message;
  @override
  dynamic? get content;
  @override
  @JsonKey(ignore: true)
  _$$_ResponseDtoUseCaseCopyWith<_$_ResponseDtoUseCase> get copyWith =>
      throw _privateConstructorUsedError;
}
