// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'message_dto_use_case.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MessageDtoUseCase _$MessageDtoUseCaseFromJson(Map<String, dynamic> json) {
  return _MessageDtoUseCase.fromJson(json);
}

/// @nodoc
class _$MessageDtoUseCaseTearOff {
  const _$MessageDtoUseCaseTearOff();

  _MessageDtoUseCase call({String? Text, String? ShowType}) {
    return _MessageDtoUseCase(
      Text: Text,
      ShowType: ShowType,
    );
  }

  MessageDtoUseCase fromJson(Map<String, Object?> json) {
    return MessageDtoUseCase.fromJson(json);
  }
}

/// @nodoc
const $MessageDtoUseCase = _$MessageDtoUseCaseTearOff();

/// @nodoc
mixin _$MessageDtoUseCase {
  String? get Text => throw _privateConstructorUsedError;
  String? get ShowType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageDtoUseCaseCopyWith<MessageDtoUseCase> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageDtoUseCaseCopyWith<$Res> {
  factory $MessageDtoUseCaseCopyWith(
          MessageDtoUseCase value, $Res Function(MessageDtoUseCase) then) =
      _$MessageDtoUseCaseCopyWithImpl<$Res>;
  $Res call({String? Text, String? ShowType});
}

/// @nodoc
class _$MessageDtoUseCaseCopyWithImpl<$Res>
    implements $MessageDtoUseCaseCopyWith<$Res> {
  _$MessageDtoUseCaseCopyWithImpl(this._value, this._then);

  final MessageDtoUseCase _value;
  // ignore: unused_field
  final $Res Function(MessageDtoUseCase) _then;

  @override
  $Res call({
    Object? Text = freezed,
    Object? ShowType = freezed,
  }) {
    return _then(_value.copyWith(
      Text: Text == freezed
          ? _value.Text
          : Text // ignore: cast_nullable_to_non_nullable
              as String?,
      ShowType: ShowType == freezed
          ? _value.ShowType
          : ShowType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$MessageDtoUseCaseCopyWith<$Res>
    implements $MessageDtoUseCaseCopyWith<$Res> {
  factory _$MessageDtoUseCaseCopyWith(
          _MessageDtoUseCase value, $Res Function(_MessageDtoUseCase) then) =
      __$MessageDtoUseCaseCopyWithImpl<$Res>;
  @override
  $Res call({String? Text, String? ShowType});
}

/// @nodoc
class __$MessageDtoUseCaseCopyWithImpl<$Res>
    extends _$MessageDtoUseCaseCopyWithImpl<$Res>
    implements _$MessageDtoUseCaseCopyWith<$Res> {
  __$MessageDtoUseCaseCopyWithImpl(
      _MessageDtoUseCase _value, $Res Function(_MessageDtoUseCase) _then)
      : super(_value, (v) => _then(v as _MessageDtoUseCase));

  @override
  _MessageDtoUseCase get _value => super._value as _MessageDtoUseCase;

  @override
  $Res call({
    Object? Text = freezed,
    Object? ShowType = freezed,
  }) {
    return _then(_MessageDtoUseCase(
      Text: Text == freezed
          ? _value.Text
          : Text // ignore: cast_nullable_to_non_nullable
              as String?,
      ShowType: ShowType == freezed
          ? _value.ShowType
          : ShowType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MessageDtoUseCase implements _MessageDtoUseCase {
  _$_MessageDtoUseCase({this.Text, this.ShowType});

  factory _$_MessageDtoUseCase.fromJson(Map<String, dynamic> json) =>
      _$$_MessageDtoUseCaseFromJson(json);

  @override
  final String? Text;
  @override
  final String? ShowType;

  @override
  String toString() {
    return 'MessageDtoUseCase(Text: $Text, ShowType: $ShowType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MessageDtoUseCase &&
            const DeepCollectionEquality().equals(other.Text, Text) &&
            const DeepCollectionEquality().equals(other.ShowType, ShowType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(Text),
      const DeepCollectionEquality().hash(ShowType));

  @JsonKey(ignore: true)
  @override
  _$MessageDtoUseCaseCopyWith<_MessageDtoUseCase> get copyWith =>
      __$MessageDtoUseCaseCopyWithImpl<_MessageDtoUseCase>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MessageDtoUseCaseToJson(this);
  }
}

abstract class _MessageDtoUseCase implements MessageDtoUseCase {
  factory _MessageDtoUseCase({String? Text, String? ShowType}) =
      _$_MessageDtoUseCase;

  factory _MessageDtoUseCase.fromJson(Map<String, dynamic> json) =
      _$_MessageDtoUseCase.fromJson;

  @override
  String? get Text;
  @override
  String? get ShowType;
  @override
  @JsonKey(ignore: true)
  _$MessageDtoUseCaseCopyWith<_MessageDtoUseCase> get copyWith =>
      throw _privateConstructorUsedError;
}