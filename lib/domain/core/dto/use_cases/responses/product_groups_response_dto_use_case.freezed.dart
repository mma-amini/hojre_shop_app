// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'product_groups_response_dto_use_case.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductGroupsResponseDtoUseCase _$ProductGroupsResponseDtoUseCaseFromJson(
    Map<String, dynamic> json) {
  return _ProductGroupsResponseDtoUseCase.fromJson(json);
}

/// @nodoc
mixin _$ProductGroupsResponseDtoUseCase {
  String? get categoryId => throw _privateConstructorUsedError;
  String? get parentId => throw _privateConstructorUsedError;
  String? get categoryName => throw _privateConstructorUsedError;
  String? get picture => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductGroupsResponseDtoUseCaseCopyWith<ProductGroupsResponseDtoUseCase>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductGroupsResponseDtoUseCaseCopyWith<$Res> {
  factory $ProductGroupsResponseDtoUseCaseCopyWith(
          ProductGroupsResponseDtoUseCase value,
          $Res Function(ProductGroupsResponseDtoUseCase) then) =
      _$ProductGroupsResponseDtoUseCaseCopyWithImpl<$Res>;
  $Res call(
      {String? categoryId,
      String? parentId,
      String? categoryName,
      String? picture});
}

/// @nodoc
class _$ProductGroupsResponseDtoUseCaseCopyWithImpl<$Res>
    implements $ProductGroupsResponseDtoUseCaseCopyWith<$Res> {
  _$ProductGroupsResponseDtoUseCaseCopyWithImpl(this._value, this._then);

  final ProductGroupsResponseDtoUseCase _value;
  // ignore: unused_field
  final $Res Function(ProductGroupsResponseDtoUseCase) _then;

  @override
  $Res call({
    Object? categoryId = freezed,
    Object? parentId = freezed,
    Object? categoryName = freezed,
    Object? picture = freezed,
  }) {
    return _then(_value.copyWith(
      categoryId: categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      parentId: parentId == freezed
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: categoryName == freezed
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      picture: picture == freezed
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_ProductGroupsResponseDtoUseCaseCopyWith<$Res>
    implements $ProductGroupsResponseDtoUseCaseCopyWith<$Res> {
  factory _$$_ProductGroupsResponseDtoUseCaseCopyWith(
          _$_ProductGroupsResponseDtoUseCase value,
          $Res Function(_$_ProductGroupsResponseDtoUseCase) then) =
      __$$_ProductGroupsResponseDtoUseCaseCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? categoryId,
      String? parentId,
      String? categoryName,
      String? picture});
}

/// @nodoc
class __$$_ProductGroupsResponseDtoUseCaseCopyWithImpl<$Res>
    extends _$ProductGroupsResponseDtoUseCaseCopyWithImpl<$Res>
    implements _$$_ProductGroupsResponseDtoUseCaseCopyWith<$Res> {
  __$$_ProductGroupsResponseDtoUseCaseCopyWithImpl(
      _$_ProductGroupsResponseDtoUseCase _value,
      $Res Function(_$_ProductGroupsResponseDtoUseCase) _then)
      : super(_value, (v) => _then(v as _$_ProductGroupsResponseDtoUseCase));

  @override
  _$_ProductGroupsResponseDtoUseCase get _value =>
      super._value as _$_ProductGroupsResponseDtoUseCase;

  @override
  $Res call({
    Object? categoryId = freezed,
    Object? parentId = freezed,
    Object? categoryName = freezed,
    Object? picture = freezed,
  }) {
    return _then(_$_ProductGroupsResponseDtoUseCase(
      categoryId: categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      parentId: parentId == freezed
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: categoryName == freezed
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
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
class _$_ProductGroupsResponseDtoUseCase
    implements _ProductGroupsResponseDtoUseCase {
  _$_ProductGroupsResponseDtoUseCase(
      {this.categoryId, this.parentId, this.categoryName, this.picture});

  factory _$_ProductGroupsResponseDtoUseCase.fromJson(
          Map<String, dynamic> json) =>
      _$$_ProductGroupsResponseDtoUseCaseFromJson(json);

  @override
  final String? categoryId;
  @override
  final String? parentId;
  @override
  final String? categoryName;
  @override
  final String? picture;

  @override
  String toString() {
    return 'ProductGroupsResponseDtoUseCase(categoryId: $categoryId, parentId: $parentId, categoryName: $categoryName, picture: $picture)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductGroupsResponseDtoUseCase &&
            const DeepCollectionEquality()
                .equals(other.categoryId, categoryId) &&
            const DeepCollectionEquality().equals(other.parentId, parentId) &&
            const DeepCollectionEquality()
                .equals(other.categoryName, categoryName) &&
            const DeepCollectionEquality().equals(other.picture, picture));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(categoryId),
      const DeepCollectionEquality().hash(parentId),
      const DeepCollectionEquality().hash(categoryName),
      const DeepCollectionEquality().hash(picture));

  @JsonKey(ignore: true)
  @override
  _$$_ProductGroupsResponseDtoUseCaseCopyWith<
          _$_ProductGroupsResponseDtoUseCase>
      get copyWith => __$$_ProductGroupsResponseDtoUseCaseCopyWithImpl<
          _$_ProductGroupsResponseDtoUseCase>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductGroupsResponseDtoUseCaseToJson(this);
  }
}

abstract class _ProductGroupsResponseDtoUseCase
    implements ProductGroupsResponseDtoUseCase {
  factory _ProductGroupsResponseDtoUseCase(
      {final String? categoryId,
      final String? parentId,
      final String? categoryName,
      final String? picture}) = _$_ProductGroupsResponseDtoUseCase;

  factory _ProductGroupsResponseDtoUseCase.fromJson(Map<String, dynamic> json) =
      _$_ProductGroupsResponseDtoUseCase.fromJson;

  @override
  String? get categoryId;
  @override
  String? get parentId;
  @override
  String? get categoryName;
  @override
  String? get picture;
  @override
  @JsonKey(ignore: true)
  _$$_ProductGroupsResponseDtoUseCaseCopyWith<
          _$_ProductGroupsResponseDtoUseCase>
      get copyWith => throw _privateConstructorUsedError;
}
