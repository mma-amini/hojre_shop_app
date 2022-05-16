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
  String? get CategoryId => throw _privateConstructorUsedError;
  String? get ParentId => throw _privateConstructorUsedError;
  String? get CategoryName => throw _privateConstructorUsedError;
  String? get Picture => throw _privateConstructorUsedError;

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
      {String? CategoryId,
      String? ParentId,
      String? CategoryName,
      String? Picture});
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
    Object? CategoryId = freezed,
    Object? ParentId = freezed,
    Object? CategoryName = freezed,
    Object? Picture = freezed,
  }) {
    return _then(_value.copyWith(
      CategoryId: CategoryId == freezed
          ? _value.CategoryId
          : CategoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      ParentId: ParentId == freezed
          ? _value.ParentId
          : ParentId // ignore: cast_nullable_to_non_nullable
              as String?,
      CategoryName: CategoryName == freezed
          ? _value.CategoryName
          : CategoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      Picture: Picture == freezed
          ? _value.Picture
          : Picture // ignore: cast_nullable_to_non_nullable
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
      {String? CategoryId,
      String? ParentId,
      String? CategoryName,
      String? Picture});
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
    Object? CategoryId = freezed,
    Object? ParentId = freezed,
    Object? CategoryName = freezed,
    Object? Picture = freezed,
  }) {
    return _then(_$_ProductGroupsResponseDtoUseCase(
      CategoryId: CategoryId == freezed
          ? _value.CategoryId
          : CategoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      ParentId: ParentId == freezed
          ? _value.ParentId
          : ParentId // ignore: cast_nullable_to_non_nullable
              as String?,
      CategoryName: CategoryName == freezed
          ? _value.CategoryName
          : CategoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      Picture: Picture == freezed
          ? _value.Picture
          : Picture // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductGroupsResponseDtoUseCase
    implements _ProductGroupsResponseDtoUseCase {
  _$_ProductGroupsResponseDtoUseCase(
      {this.CategoryId, this.ParentId, this.CategoryName, this.Picture});

  factory _$_ProductGroupsResponseDtoUseCase.fromJson(
          Map<String, dynamic> json) =>
      _$$_ProductGroupsResponseDtoUseCaseFromJson(json);

  @override
  final String? CategoryId;
  @override
  final String? ParentId;
  @override
  final String? CategoryName;
  @override
  final String? Picture;

  @override
  String toString() {
    return 'ProductGroupsResponseDtoUseCase(CategoryId: $CategoryId, ParentId: $ParentId, CategoryName: $CategoryName, Picture: $Picture)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductGroupsResponseDtoUseCase &&
            const DeepCollectionEquality()
                .equals(other.CategoryId, CategoryId) &&
            const DeepCollectionEquality().equals(other.ParentId, ParentId) &&
            const DeepCollectionEquality()
                .equals(other.CategoryName, CategoryName) &&
            const DeepCollectionEquality().equals(other.Picture, Picture));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(CategoryId),
      const DeepCollectionEquality().hash(ParentId),
      const DeepCollectionEquality().hash(CategoryName),
      const DeepCollectionEquality().hash(Picture));

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
      {final String? CategoryId,
      final String? ParentId,
      final String? CategoryName,
      final String? Picture}) = _$_ProductGroupsResponseDtoUseCase;

  factory _ProductGroupsResponseDtoUseCase.fromJson(Map<String, dynamic> json) =
      _$_ProductGroupsResponseDtoUseCase.fromJson;

  @override
  String? get CategoryId => throw _privateConstructorUsedError;
  @override
  String? get ParentId => throw _privateConstructorUsedError;
  @override
  String? get CategoryName => throw _privateConstructorUsedError;
  @override
  String? get Picture => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ProductGroupsResponseDtoUseCaseCopyWith<
          _$_ProductGroupsResponseDtoUseCase>
      get copyWith => throw _privateConstructorUsedError;
}
