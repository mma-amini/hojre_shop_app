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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductGroupsResponseDtoUseCase _$ProductGroupsResponseDtoUseCaseFromJson(
    Map<String, dynamic> json) {
  return _ProductGroupsResponseDtoUseCase.fromJson(json);
}

/// @nodoc
class _$ProductGroupsResponseDtoUseCaseTearOff {
  const _$ProductGroupsResponseDtoUseCaseTearOff();

  _ProductGroupsResponseDtoUseCase call(
      {String? CategoryID,
      String? ParentID,
      String? CategoryName,
      String? Picture}) {
    return _ProductGroupsResponseDtoUseCase(
      CategoryID: CategoryID,
      ParentID: ParentID,
      CategoryName: CategoryName,
      Picture: Picture,
    );
  }

  ProductGroupsResponseDtoUseCase fromJson(Map<String, Object?> json) {
    return ProductGroupsResponseDtoUseCase.fromJson(json);
  }
}

/// @nodoc
const $ProductGroupsResponseDtoUseCase =
    _$ProductGroupsResponseDtoUseCaseTearOff();

/// @nodoc
mixin _$ProductGroupsResponseDtoUseCase {
  String? get CategoryID => throw _privateConstructorUsedError;
  String? get ParentID => throw _privateConstructorUsedError;
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
      {String? CategoryID,
      String? ParentID,
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
    Object? CategoryID = freezed,
    Object? ParentID = freezed,
    Object? CategoryName = freezed,
    Object? Picture = freezed,
  }) {
    return _then(_value.copyWith(
      CategoryID: CategoryID == freezed
          ? _value.CategoryID
          : CategoryID // ignore: cast_nullable_to_non_nullable
              as String?,
      ParentID: ParentID == freezed
          ? _value.ParentID
          : ParentID // ignore: cast_nullable_to_non_nullable
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
abstract class _$ProductGroupsResponseDtoUseCaseCopyWith<$Res>
    implements $ProductGroupsResponseDtoUseCaseCopyWith<$Res> {
  factory _$ProductGroupsResponseDtoUseCaseCopyWith(
          _ProductGroupsResponseDtoUseCase value,
          $Res Function(_ProductGroupsResponseDtoUseCase) then) =
      __$ProductGroupsResponseDtoUseCaseCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? CategoryID,
      String? ParentID,
      String? CategoryName,
      String? Picture});
}

/// @nodoc
class __$ProductGroupsResponseDtoUseCaseCopyWithImpl<$Res>
    extends _$ProductGroupsResponseDtoUseCaseCopyWithImpl<$Res>
    implements _$ProductGroupsResponseDtoUseCaseCopyWith<$Res> {
  __$ProductGroupsResponseDtoUseCaseCopyWithImpl(
      _ProductGroupsResponseDtoUseCase _value,
      $Res Function(_ProductGroupsResponseDtoUseCase) _then)
      : super(_value, (v) => _then(v as _ProductGroupsResponseDtoUseCase));

  @override
  _ProductGroupsResponseDtoUseCase get _value =>
      super._value as _ProductGroupsResponseDtoUseCase;

  @override
  $Res call({
    Object? CategoryID = freezed,
    Object? ParentID = freezed,
    Object? CategoryName = freezed,
    Object? Picture = freezed,
  }) {
    return _then(_ProductGroupsResponseDtoUseCase(
      CategoryID: CategoryID == freezed
          ? _value.CategoryID
          : CategoryID // ignore: cast_nullable_to_non_nullable
              as String?,
      ParentID: ParentID == freezed
          ? _value.ParentID
          : ParentID // ignore: cast_nullable_to_non_nullable
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
      {this.CategoryID, this.ParentID, this.CategoryName, this.Picture});

  factory _$_ProductGroupsResponseDtoUseCase.fromJson(
          Map<String, dynamic> json) =>
      _$$_ProductGroupsResponseDtoUseCaseFromJson(json);

  @override
  final String? CategoryID;
  @override
  final String? ParentID;
  @override
  final String? CategoryName;
  @override
  final String? Picture;

  @override
  String toString() {
    return 'ProductGroupsResponseDtoUseCase(CategoryID: $CategoryID, ParentID: $ParentID, CategoryName: $CategoryName, Picture: $Picture)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProductGroupsResponseDtoUseCase &&
            const DeepCollectionEquality()
                .equals(other.CategoryID, CategoryID) &&
            const DeepCollectionEquality().equals(other.ParentID, ParentID) &&
            const DeepCollectionEquality()
                .equals(other.CategoryName, CategoryName) &&
            const DeepCollectionEquality().equals(other.Picture, Picture));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(CategoryID),
      const DeepCollectionEquality().hash(ParentID),
      const DeepCollectionEquality().hash(CategoryName),
      const DeepCollectionEquality().hash(Picture));

  @JsonKey(ignore: true)
  @override
  _$ProductGroupsResponseDtoUseCaseCopyWith<_ProductGroupsResponseDtoUseCase>
      get copyWith => __$ProductGroupsResponseDtoUseCaseCopyWithImpl<
          _ProductGroupsResponseDtoUseCase>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductGroupsResponseDtoUseCaseToJson(this);
  }
}

abstract class _ProductGroupsResponseDtoUseCase
    implements ProductGroupsResponseDtoUseCase {
  factory _ProductGroupsResponseDtoUseCase(
      {String? CategoryID,
      String? ParentID,
      String? CategoryName,
      String? Picture}) = _$_ProductGroupsResponseDtoUseCase;

  factory _ProductGroupsResponseDtoUseCase.fromJson(Map<String, dynamic> json) =
      _$_ProductGroupsResponseDtoUseCase.fromJson;

  @override
  String? get CategoryID;
  @override
  String? get ParentID;
  @override
  String? get CategoryName;
  @override
  String? get Picture;
  @override
  @JsonKey(ignore: true)
  _$ProductGroupsResponseDtoUseCaseCopyWith<_ProductGroupsResponseDtoUseCase>
      get copyWith => throw _privateConstructorUsedError;
}
