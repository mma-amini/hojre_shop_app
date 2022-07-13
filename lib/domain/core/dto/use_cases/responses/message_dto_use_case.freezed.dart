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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MessageDtoUseCase _$MessageDtoUseCaseFromJson(Map<String, dynamic> json) {
  return _MessageDtoUseCase.fromJson(json);
}

/// @nodoc
mixin _$MessageDtoUseCase {
  String? get text => throw _privateConstructorUsedError;
  String? get showType => throw _privateConstructorUsedError;

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
  $Res call({String? text, String? showType});
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
    Object? text = freezed,
    Object? showType = freezed,
  }) {
    return _then(_value.copyWith(
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      showType: showType == freezed
          ? _value.showType
          : showType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_MessageDtoUseCaseCopyWith<$Res>
    implements $MessageDtoUseCaseCopyWith<$Res> {
  factory _$$_MessageDtoUseCaseCopyWith(_$_MessageDtoUseCase value,
          $Res Function(_$_MessageDtoUseCase) then) =
      __$$_MessageDtoUseCaseCopyWithImpl<$Res>;
  @override
  $Res call({String? text, String? showType});
}

/// @nodoc
class __$$_MessageDtoUseCaseCopyWithImpl<$Res>
    extends _$MessageDtoUseCaseCopyWithImpl<$Res>
    implements _$$_MessageDtoUseCaseCopyWith<$Res> {
  __$$_MessageDtoUseCaseCopyWithImpl(
      _$_MessageDtoUseCase _value, $Res Function(_$_MessageDtoUseCase) _then)
      : super(_value, (v) => _then(v as _$_MessageDtoUseCase));

  @override
  _$_MessageDtoUseCase get _value => super._value as _$_MessageDtoUseCase;

  @override
  $Res call({
    Object? text = freezed,
    Object? showType = freezed,
  }) {
    return _then(_$_MessageDtoUseCase(
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      showType: showType == freezed
          ? _value.showType
          : showType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MessageDtoUseCase implements _MessageDtoUseCase {
  _$_MessageDtoUseCase({this.text, this.showType});

  factory _$_MessageDtoUseCase.fromJson(Map<String, dynamic> json) =>
      _$$_MessageDtoUseCaseFromJson(json);

  @override
  final String? text;
  @override
  final String? showType;

  @override
  String toString() {
    return 'MessageDtoUseCase(text: $text, showType: $showType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MessageDtoUseCase &&
            const DeepCollectionEquality().equals(other.text, text) &&
            const DeepCollectionEquality().equals(other.showType, showType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(text),
      const DeepCollectionEquality().hash(showType));

  @JsonKey(ignore: true)
  @override
  _$$_MessageDtoUseCaseCopyWith<_$_MessageDtoUseCase> get copyWith =>
      __$$_MessageDtoUseCaseCopyWithImpl<_$_MessageDtoUseCase>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MessageDtoUseCaseToJson(this);
  }
}

abstract class _MessageDtoUseCase implements MessageDtoUseCase {
  factory _MessageDtoUseCase({final String? text, final String? showType}) =
      _$_MessageDtoUseCase;

  factory _MessageDtoUseCase.fromJson(Map<String, dynamic> json) =
      _$_MessageDtoUseCase.fromJson;

  @override
  String? get text;
  @override
  String? get showType;
  @override
  @JsonKey(ignore: true)
  _$$_MessageDtoUseCaseCopyWith<_$_MessageDtoUseCase> get copyWith =>
      throw _privateConstructorUsedError;
}
