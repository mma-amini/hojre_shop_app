// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'brand_response_dto_use_case.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BrandResponseDtoUseCase _$BrandResponseDtoUseCaseFromJson(
    Map<String, dynamic> json) {
  return _BrandResponseDtoUseCase.fromJson(json);
}

/// @nodoc
mixin _$BrandResponseDtoUseCase {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get picture => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BrandResponseDtoUseCaseCopyWith<BrandResponseDtoUseCase> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BrandResponseDtoUseCaseCopyWith<$Res> {
  factory $BrandResponseDtoUseCaseCopyWith(BrandResponseDtoUseCase value,
          $Res Function(BrandResponseDtoUseCase) then) =
      _$BrandResponseDtoUseCaseCopyWithImpl<$Res>;
  $Res call({String? id, String? name, String? picture});
}

/// @nodoc
class _$BrandResponseDtoUseCaseCopyWithImpl<$Res>
    implements $BrandResponseDtoUseCaseCopyWith<$Res> {
  _$BrandResponseDtoUseCaseCopyWithImpl(this._value, this._then);

  final BrandResponseDtoUseCase _value;
  // ignore: unused_field
  final $Res Function(BrandResponseDtoUseCase) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? picture = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      picture: picture == freezed
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_BrandResponseDtoUseCaseCopyWith<$Res>
    implements $BrandResponseDtoUseCaseCopyWith<$Res> {
  factory _$$_BrandResponseDtoUseCaseCopyWith(_$_BrandResponseDtoUseCase value,
          $Res Function(_$_BrandResponseDtoUseCase) then) =
      __$$_BrandResponseDtoUseCaseCopyWithImpl<$Res>;
  @override
  $Res call({String? id, String? name, String? picture});
}

/// @nodoc
class __$$_BrandResponseDtoUseCaseCopyWithImpl<$Res>
    extends _$BrandResponseDtoUseCaseCopyWithImpl<$Res>
    implements _$$_BrandResponseDtoUseCaseCopyWith<$Res> {
  __$$_BrandResponseDtoUseCaseCopyWithImpl(_$_BrandResponseDtoUseCase _value,
      $Res Function(_$_BrandResponseDtoUseCase) _then)
      : super(_value, (v) => _then(v as _$_BrandResponseDtoUseCase));

  @override
  _$_BrandResponseDtoUseCase get _value =>
      super._value as _$_BrandResponseDtoUseCase;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? picture = freezed,
  }) {
    return _then(_$_BrandResponseDtoUseCase(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      picture: picture == freezed
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BrandResponseDtoUseCase implements _BrandResponseDtoUseCase {
  _$_BrandResponseDtoUseCase({this.id, this.name, this.picture});

  factory _$_BrandResponseDtoUseCase.fromJson(Map<String, dynamic> json) =>
      _$$_BrandResponseDtoUseCaseFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? picture;

  @override
  String toString() {
    return 'BrandResponseDtoUseCase(id: $id, name: $name, picture: $picture)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BrandResponseDtoUseCase &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.picture, picture));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(picture));

  @JsonKey(ignore: true)
  @override
  _$$_BrandResponseDtoUseCaseCopyWith<_$_BrandResponseDtoUseCase>
      get copyWith =>
          __$$_BrandResponseDtoUseCaseCopyWithImpl<_$_BrandResponseDtoUseCase>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BrandResponseDtoUseCaseToJson(this);
  }
}

abstract class _BrandResponseDtoUseCase implements BrandResponseDtoUseCase {
  factory _BrandResponseDtoUseCase(
      {final String? id,
      final String? name,
      final String? picture}) = _$_BrandResponseDtoUseCase;

  factory _BrandResponseDtoUseCase.fromJson(Map<String, dynamic> json) =
      _$_BrandResponseDtoUseCase.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get picture;
  @override
  @JsonKey(ignore: true)
  _$$_BrandResponseDtoUseCaseCopyWith<_$_BrandResponseDtoUseCase>
      get copyWith => throw _privateConstructorUsedError;
}
