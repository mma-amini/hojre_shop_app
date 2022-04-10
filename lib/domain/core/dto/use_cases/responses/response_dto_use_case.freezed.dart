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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ResponseDtoUseCase _$ResponseDtoUseCaseFromJson(Map<String, dynamic> json) {
  return _ResponseDtoUseCase.fromJson(json);
}

/// @nodoc
class _$ResponseDtoUseCaseTearOff {
  const _$ResponseDtoUseCaseTearOff();

  _ResponseDtoUseCase call(
      {int? StatusCode, MessageDtoUseCase? Message, dynamic? Content}) {
    return _ResponseDtoUseCase(
      StatusCode: StatusCode,
      Message: Message,
      Content: Content,
    );
  }

  ResponseDtoUseCase fromJson(Map<String, Object?> json) {
    return ResponseDtoUseCase.fromJson(json);
  }
}

/// @nodoc
const $ResponseDtoUseCase = _$ResponseDtoUseCaseTearOff();

/// @nodoc
mixin _$ResponseDtoUseCase {
  int? get StatusCode => throw _privateConstructorUsedError;
  MessageDtoUseCase? get Message => throw _privateConstructorUsedError;
  dynamic? get Content => throw _privateConstructorUsedError;

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
  $Res call({int? StatusCode, MessageDtoUseCase? Message, dynamic? Content});

  $MessageDtoUseCaseCopyWith<$Res>? get Message;
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
    Object? StatusCode = freezed,
    Object? Message = freezed,
    Object? Content = freezed,
  }) {
    return _then(_value.copyWith(
      StatusCode: StatusCode == freezed
          ? _value.StatusCode
          : StatusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      Message: Message == freezed
          ? _value.Message
          : Message // ignore: cast_nullable_to_non_nullable
              as MessageDtoUseCase?,
      Content: Content == freezed
          ? _value.Content
          : Content // ignore: cast_nullable_to_non_nullable
              as dynamic?,
    ));
  }

  @override
  $MessageDtoUseCaseCopyWith<$Res>? get Message {
    if (_value.Message == null) {
      return null;
    }

    return $MessageDtoUseCaseCopyWith<$Res>(_value.Message!, (value) {
      return _then(_value.copyWith(Message: value));
    });
  }
}

/// @nodoc
abstract class _$ResponseDtoUseCaseCopyWith<$Res>
    implements $ResponseDtoUseCaseCopyWith<$Res> {
  factory _$ResponseDtoUseCaseCopyWith(
          _ResponseDtoUseCase value, $Res Function(_ResponseDtoUseCase) then) =
      __$ResponseDtoUseCaseCopyWithImpl<$Res>;
  @override
  $Res call({int? StatusCode, MessageDtoUseCase? Message, dynamic? Content});

  @override
  $MessageDtoUseCaseCopyWith<$Res>? get Message;
}

/// @nodoc
class __$ResponseDtoUseCaseCopyWithImpl<$Res>
    extends _$ResponseDtoUseCaseCopyWithImpl<$Res>
    implements _$ResponseDtoUseCaseCopyWith<$Res> {
  __$ResponseDtoUseCaseCopyWithImpl(
      _ResponseDtoUseCase _value, $Res Function(_ResponseDtoUseCase) _then)
      : super(_value, (v) => _then(v as _ResponseDtoUseCase));

  @override
  _ResponseDtoUseCase get _value => super._value as _ResponseDtoUseCase;

  @override
  $Res call({
    Object? StatusCode = freezed,
    Object? Message = freezed,
    Object? Content = freezed,
  }) {
    return _then(_ResponseDtoUseCase(
      StatusCode: StatusCode == freezed
          ? _value.StatusCode
          : StatusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      Message: Message == freezed
          ? _value.Message
          : Message // ignore: cast_nullable_to_non_nullable
              as MessageDtoUseCase?,
      Content: Content == freezed
          ? _value.Content
          : Content // ignore: cast_nullable_to_non_nullable
              as dynamic?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ResponseDtoUseCase implements _ResponseDtoUseCase {
  _$_ResponseDtoUseCase({this.StatusCode, this.Message, this.Content});

  factory _$_ResponseDtoUseCase.fromJson(Map<String, dynamic> json) =>
      _$$_ResponseDtoUseCaseFromJson(json);

  @override
  final int? StatusCode;
  @override
  final MessageDtoUseCase? Message;
  @override
  final dynamic? Content;

  @override
  String toString() {
    return 'ResponseDtoUseCase(StatusCode: $StatusCode, Message: $Message, Content: $Content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ResponseDtoUseCase &&
            const DeepCollectionEquality()
                .equals(other.StatusCode, StatusCode) &&
            const DeepCollectionEquality().equals(other.Message, Message) &&
            const DeepCollectionEquality().equals(other.Content, Content));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(StatusCode),
      const DeepCollectionEquality().hash(Message),
      const DeepCollectionEquality().hash(Content));

  @JsonKey(ignore: true)
  @override
  _$ResponseDtoUseCaseCopyWith<_ResponseDtoUseCase> get copyWith =>
      __$ResponseDtoUseCaseCopyWithImpl<_ResponseDtoUseCase>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResponseDtoUseCaseToJson(this);
  }
}

abstract class _ResponseDtoUseCase implements ResponseDtoUseCase {
  factory _ResponseDtoUseCase(
      {int? StatusCode,
      MessageDtoUseCase? Message,
      dynamic? Content}) = _$_ResponseDtoUseCase;

  factory _ResponseDtoUseCase.fromJson(Map<String, dynamic> json) =
      _$_ResponseDtoUseCase.fromJson;

  @override
  int? get StatusCode;
  @override
  MessageDtoUseCase? get Message;
  @override
  dynamic? get Content;
  @override
  @JsonKey(ignore: true)
  _$ResponseDtoUseCaseCopyWith<_ResponseDtoUseCase> get copyWith =>
      throw _privateConstructorUsedError;
}
