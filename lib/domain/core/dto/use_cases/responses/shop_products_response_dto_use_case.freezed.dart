// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'shop_products_response_dto_use_case.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ShopProductsResponseDtoUseCase _$ShopProductsResponseDtoUseCaseFromJson(
    Map<String, dynamic> json) {
  return _ShopProductsResponseDtoUseCase.fromJson(json);
}

/// @nodoc
mixin _$ShopProductsResponseDtoUseCase {
  int? get approvedProductDesignsCount => throw _privateConstructorUsedError;
  BrandOfShopProductsResponseDtoUseCase? get brand =>
      throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  bool? get isActive => throw _privateConstructorUsedError;
  bool? get isOriginal => throw _privateConstructorUsedError;
  int? get notApprovedProductDesignsCount => throw _privateConstructorUsedError;
  String? get packingDimensions => throw _privateConstructorUsedError;
  double? get packingWeight => throw _privateConstructorUsedError;
  List<PictureOfShopProductsResponseDtoUseCase>? get pictures =>
      throw _privateConstructorUsedError;
  String? get picture => throw _privateConstructorUsedError;
  String? get productDimensions => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  String? get productName => throw _privateConstructorUsedError;
  double? get productWeight => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShopProductsResponseDtoUseCaseCopyWith<ShopProductsResponseDtoUseCase>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopProductsResponseDtoUseCaseCopyWith<$Res> {
  factory $ShopProductsResponseDtoUseCaseCopyWith(
          ShopProductsResponseDtoUseCase value,
          $Res Function(ShopProductsResponseDtoUseCase) then) =
      _$ShopProductsResponseDtoUseCaseCopyWithImpl<$Res>;
  $Res call(
      {int? approvedProductDesignsCount,
      BrandOfShopProductsResponseDtoUseCase? brand,
      String? description,
      bool? isActive,
      bool? isOriginal,
      int? notApprovedProductDesignsCount,
      String? packingDimensions,
      double? packingWeight,
      List<PictureOfShopProductsResponseDtoUseCase>? pictures,
      String? picture,
      String? productDimensions,
      String? id,
      String? productName,
      double? productWeight});

  $BrandOfShopProductsResponseDtoUseCaseCopyWith<$Res>? get brand;
}

/// @nodoc
class _$ShopProductsResponseDtoUseCaseCopyWithImpl<$Res>
    implements $ShopProductsResponseDtoUseCaseCopyWith<$Res> {
  _$ShopProductsResponseDtoUseCaseCopyWithImpl(this._value, this._then);

  final ShopProductsResponseDtoUseCase _value;
  // ignore: unused_field
  final $Res Function(ShopProductsResponseDtoUseCase) _then;

  @override
  $Res call({
    Object? approvedProductDesignsCount = freezed,
    Object? brand = freezed,
    Object? description = freezed,
    Object? isActive = freezed,
    Object? isOriginal = freezed,
    Object? notApprovedProductDesignsCount = freezed,
    Object? packingDimensions = freezed,
    Object? packingWeight = freezed,
    Object? pictures = freezed,
    Object? picture = freezed,
    Object? productDimensions = freezed,
    Object? id = freezed,
    Object? productName = freezed,
    Object? productWeight = freezed,
  }) {
    return _then(_value.copyWith(
      approvedProductDesignsCount: approvedProductDesignsCount == freezed
          ? _value.approvedProductDesignsCount
          : approvedProductDesignsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      brand: brand == freezed
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as BrandOfShopProductsResponseDtoUseCase?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: isActive == freezed
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      isOriginal: isOriginal == freezed
          ? _value.isOriginal
          : isOriginal // ignore: cast_nullable_to_non_nullable
              as bool?,
      notApprovedProductDesignsCount: notApprovedProductDesignsCount == freezed
          ? _value.notApprovedProductDesignsCount
          : notApprovedProductDesignsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      packingDimensions: packingDimensions == freezed
          ? _value.packingDimensions
          : packingDimensions // ignore: cast_nullable_to_non_nullable
              as String?,
      packingWeight: packingWeight == freezed
          ? _value.packingWeight
          : packingWeight // ignore: cast_nullable_to_non_nullable
              as double?,
      pictures: pictures == freezed
          ? _value.pictures
          : pictures // ignore: cast_nullable_to_non_nullable
              as List<PictureOfShopProductsResponseDtoUseCase>?,
      picture: picture == freezed
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String?,
      productDimensions: productDimensions == freezed
          ? _value.productDimensions
          : productDimensions // ignore: cast_nullable_to_non_nullable
              as String?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      productName: productName == freezed
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      productWeight: productWeight == freezed
          ? _value.productWeight
          : productWeight // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }

  @override
  $BrandOfShopProductsResponseDtoUseCaseCopyWith<$Res>? get brand {
    if (_value.brand == null) {
      return null;
    }

    return $BrandOfShopProductsResponseDtoUseCaseCopyWith<$Res>(_value.brand!,
        (value) {
      return _then(_value.copyWith(brand: value));
    });
  }
}

/// @nodoc
abstract class _$$_ShopProductsResponseDtoUseCaseCopyWith<$Res>
    implements $ShopProductsResponseDtoUseCaseCopyWith<$Res> {
  factory _$$_ShopProductsResponseDtoUseCaseCopyWith(
          _$_ShopProductsResponseDtoUseCase value,
          $Res Function(_$_ShopProductsResponseDtoUseCase) then) =
      __$$_ShopProductsResponseDtoUseCaseCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? approvedProductDesignsCount,
      BrandOfShopProductsResponseDtoUseCase? brand,
      String? description,
      bool? isActive,
      bool? isOriginal,
      int? notApprovedProductDesignsCount,
      String? packingDimensions,
      double? packingWeight,
      List<PictureOfShopProductsResponseDtoUseCase>? pictures,
      String? picture,
      String? productDimensions,
      String? id,
      String? productName,
      double? productWeight});

  @override
  $BrandOfShopProductsResponseDtoUseCaseCopyWith<$Res>? get brand;
}

/// @nodoc
class __$$_ShopProductsResponseDtoUseCaseCopyWithImpl<$Res>
    extends _$ShopProductsResponseDtoUseCaseCopyWithImpl<$Res>
    implements _$$_ShopProductsResponseDtoUseCaseCopyWith<$Res> {
  __$$_ShopProductsResponseDtoUseCaseCopyWithImpl(
      _$_ShopProductsResponseDtoUseCase _value,
      $Res Function(_$_ShopProductsResponseDtoUseCase) _then)
      : super(_value, (v) => _then(v as _$_ShopProductsResponseDtoUseCase));

  @override
  _$_ShopProductsResponseDtoUseCase get _value =>
      super._value as _$_ShopProductsResponseDtoUseCase;

  @override
  $Res call({
    Object? approvedProductDesignsCount = freezed,
    Object? brand = freezed,
    Object? description = freezed,
    Object? isActive = freezed,
    Object? isOriginal = freezed,
    Object? notApprovedProductDesignsCount = freezed,
    Object? packingDimensions = freezed,
    Object? packingWeight = freezed,
    Object? pictures = freezed,
    Object? picture = freezed,
    Object? productDimensions = freezed,
    Object? id = freezed,
    Object? productName = freezed,
    Object? productWeight = freezed,
  }) {
    return _then(_$_ShopProductsResponseDtoUseCase(
      approvedProductDesignsCount: approvedProductDesignsCount == freezed
          ? _value.approvedProductDesignsCount
          : approvedProductDesignsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      brand: brand == freezed
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as BrandOfShopProductsResponseDtoUseCase?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: isActive == freezed
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      isOriginal: isOriginal == freezed
          ? _value.isOriginal
          : isOriginal // ignore: cast_nullable_to_non_nullable
              as bool?,
      notApprovedProductDesignsCount: notApprovedProductDesignsCount == freezed
          ? _value.notApprovedProductDesignsCount
          : notApprovedProductDesignsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      packingDimensions: packingDimensions == freezed
          ? _value.packingDimensions
          : packingDimensions // ignore: cast_nullable_to_non_nullable
              as String?,
      packingWeight: packingWeight == freezed
          ? _value.packingWeight
          : packingWeight // ignore: cast_nullable_to_non_nullable
              as double?,
      pictures: pictures == freezed
          ? _value._pictures
          : pictures // ignore: cast_nullable_to_non_nullable
              as List<PictureOfShopProductsResponseDtoUseCase>?,
      picture: picture == freezed
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String?,
      productDimensions: productDimensions == freezed
          ? _value.productDimensions
          : productDimensions // ignore: cast_nullable_to_non_nullable
              as String?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      productName: productName == freezed
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      productWeight: productWeight == freezed
          ? _value.productWeight
          : productWeight // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ShopProductsResponseDtoUseCase
    implements _ShopProductsResponseDtoUseCase {
  _$_ShopProductsResponseDtoUseCase(
      {this.approvedProductDesignsCount,
      this.brand,
      this.description,
      this.isActive,
      this.isOriginal,
      this.notApprovedProductDesignsCount,
      this.packingDimensions,
      this.packingWeight,
      final List<PictureOfShopProductsResponseDtoUseCase>? pictures,
      this.picture,
      this.productDimensions,
      this.id,
      this.productName,
      this.productWeight})
      : _pictures = pictures;

  factory _$_ShopProductsResponseDtoUseCase.fromJson(
          Map<String, dynamic> json) =>
      _$$_ShopProductsResponseDtoUseCaseFromJson(json);

  @override
  final int? approvedProductDesignsCount;
  @override
  final BrandOfShopProductsResponseDtoUseCase? brand;
  @override
  final String? description;
  @override
  final bool? isActive;
  @override
  final bool? isOriginal;
  @override
  final int? notApprovedProductDesignsCount;
  @override
  final String? packingDimensions;
  @override
  final double? packingWeight;
  final List<PictureOfShopProductsResponseDtoUseCase>? _pictures;
  @override
  List<PictureOfShopProductsResponseDtoUseCase>? get pictures {
    final value = _pictures;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? picture;
  @override
  final String? productDimensions;
  @override
  final String? id;
  @override
  final String? productName;
  @override
  final double? productWeight;

  @override
  String toString() {
    return 'ShopProductsResponseDtoUseCase(approvedProductDesignsCount: $approvedProductDesignsCount, brand: $brand, description: $description, isActive: $isActive, isOriginal: $isOriginal, notApprovedProductDesignsCount: $notApprovedProductDesignsCount, packingDimensions: $packingDimensions, packingWeight: $packingWeight, pictures: $pictures, picture: $picture, productDimensions: $productDimensions, id: $id, productName: $productName, productWeight: $productWeight)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShopProductsResponseDtoUseCase &&
            const DeepCollectionEquality().equals(
                other.approvedProductDesignsCount,
                approvedProductDesignsCount) &&
            const DeepCollectionEquality().equals(other.brand, brand) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.isActive, isActive) &&
            const DeepCollectionEquality()
                .equals(other.isOriginal, isOriginal) &&
            const DeepCollectionEquality().equals(
                other.notApprovedProductDesignsCount,
                notApprovedProductDesignsCount) &&
            const DeepCollectionEquality()
                .equals(other.packingDimensions, packingDimensions) &&
            const DeepCollectionEquality()
                .equals(other.packingWeight, packingWeight) &&
            const DeepCollectionEquality().equals(other._pictures, _pictures) &&
            const DeepCollectionEquality().equals(other.picture, picture) &&
            const DeepCollectionEquality()
                .equals(other.productDimensions, productDimensions) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.productName, productName) &&
            const DeepCollectionEquality()
                .equals(other.productWeight, productWeight));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(approvedProductDesignsCount),
      const DeepCollectionEquality().hash(brand),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(isActive),
      const DeepCollectionEquality().hash(isOriginal),
      const DeepCollectionEquality().hash(notApprovedProductDesignsCount),
      const DeepCollectionEquality().hash(packingDimensions),
      const DeepCollectionEquality().hash(packingWeight),
      const DeepCollectionEquality().hash(_pictures),
      const DeepCollectionEquality().hash(picture),
      const DeepCollectionEquality().hash(productDimensions),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(productName),
      const DeepCollectionEquality().hash(productWeight));

  @JsonKey(ignore: true)
  @override
  _$$_ShopProductsResponseDtoUseCaseCopyWith<_$_ShopProductsResponseDtoUseCase>
      get copyWith => __$$_ShopProductsResponseDtoUseCaseCopyWithImpl<
          _$_ShopProductsResponseDtoUseCase>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ShopProductsResponseDtoUseCaseToJson(this);
  }
}

abstract class _ShopProductsResponseDtoUseCase
    implements ShopProductsResponseDtoUseCase {
  factory _ShopProductsResponseDtoUseCase(
      {final int? approvedProductDesignsCount,
      final BrandOfShopProductsResponseDtoUseCase? brand,
      final String? description,
      final bool? isActive,
      final bool? isOriginal,
      final int? notApprovedProductDesignsCount,
      final String? packingDimensions,
      final double? packingWeight,
      final List<PictureOfShopProductsResponseDtoUseCase>? pictures,
      final String? picture,
      final String? productDimensions,
      final String? id,
      final String? productName,
      final double? productWeight}) = _$_ShopProductsResponseDtoUseCase;

  factory _ShopProductsResponseDtoUseCase.fromJson(Map<String, dynamic> json) =
      _$_ShopProductsResponseDtoUseCase.fromJson;

  @override
  int? get approvedProductDesignsCount;
  @override
  BrandOfShopProductsResponseDtoUseCase? get brand;
  @override
  String? get description;
  @override
  bool? get isActive;
  @override
  bool? get isOriginal;
  @override
  int? get notApprovedProductDesignsCount;
  @override
  String? get packingDimensions;
  @override
  double? get packingWeight;
  @override
  List<PictureOfShopProductsResponseDtoUseCase>? get pictures;
  @override
  String? get picture;
  @override
  String? get productDimensions;
  @override
  String? get id;
  @override
  String? get productName;
  @override
  double? get productWeight;
  @override
  @JsonKey(ignore: true)
  _$$_ShopProductsResponseDtoUseCaseCopyWith<_$_ShopProductsResponseDtoUseCase>
      get copyWith => throw _privateConstructorUsedError;
}

BrandOfShopProductsResponseDtoUseCase
    _$BrandOfShopProductsResponseDtoUseCaseFromJson(Map<String, dynamic> json) {
  return _BrandOfShopProductsResponseDtoUseCase.fromJson(json);
}

/// @nodoc
mixin _$BrandOfShopProductsResponseDtoUseCase {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get picture => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BrandOfShopProductsResponseDtoUseCaseCopyWith<
          BrandOfShopProductsResponseDtoUseCase>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BrandOfShopProductsResponseDtoUseCaseCopyWith<$Res> {
  factory $BrandOfShopProductsResponseDtoUseCaseCopyWith(
          BrandOfShopProductsResponseDtoUseCase value,
          $Res Function(BrandOfShopProductsResponseDtoUseCase) then) =
      _$BrandOfShopProductsResponseDtoUseCaseCopyWithImpl<$Res>;
  $Res call({String? id, String? name, String? picture});
}

/// @nodoc
class _$BrandOfShopProductsResponseDtoUseCaseCopyWithImpl<$Res>
    implements $BrandOfShopProductsResponseDtoUseCaseCopyWith<$Res> {
  _$BrandOfShopProductsResponseDtoUseCaseCopyWithImpl(this._value, this._then);

  final BrandOfShopProductsResponseDtoUseCase _value;
  // ignore: unused_field
  final $Res Function(BrandOfShopProductsResponseDtoUseCase) _then;

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
abstract class _$$_BrandOfShopProductsResponseDtoUseCaseCopyWith<$Res>
    implements $BrandOfShopProductsResponseDtoUseCaseCopyWith<$Res> {
  factory _$$_BrandOfShopProductsResponseDtoUseCaseCopyWith(
          _$_BrandOfShopProductsResponseDtoUseCase value,
          $Res Function(_$_BrandOfShopProductsResponseDtoUseCase) then) =
      __$$_BrandOfShopProductsResponseDtoUseCaseCopyWithImpl<$Res>;
  @override
  $Res call({String? id, String? name, String? picture});
}

/// @nodoc
class __$$_BrandOfShopProductsResponseDtoUseCaseCopyWithImpl<$Res>
    extends _$BrandOfShopProductsResponseDtoUseCaseCopyWithImpl<$Res>
    implements _$$_BrandOfShopProductsResponseDtoUseCaseCopyWith<$Res> {
  __$$_BrandOfShopProductsResponseDtoUseCaseCopyWithImpl(
      _$_BrandOfShopProductsResponseDtoUseCase _value,
      $Res Function(_$_BrandOfShopProductsResponseDtoUseCase) _then)
      : super(_value,
            (v) => _then(v as _$_BrandOfShopProductsResponseDtoUseCase));

  @override
  _$_BrandOfShopProductsResponseDtoUseCase get _value =>
      super._value as _$_BrandOfShopProductsResponseDtoUseCase;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? picture = freezed,
  }) {
    return _then(_$_BrandOfShopProductsResponseDtoUseCase(
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
class _$_BrandOfShopProductsResponseDtoUseCase
    implements _BrandOfShopProductsResponseDtoUseCase {
  _$_BrandOfShopProductsResponseDtoUseCase({this.id, this.name, this.picture});

  factory _$_BrandOfShopProductsResponseDtoUseCase.fromJson(
          Map<String, dynamic> json) =>
      _$$_BrandOfShopProductsResponseDtoUseCaseFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? picture;

  @override
  String toString() {
    return 'BrandOfShopProductsResponseDtoUseCase(id: $id, name: $name, picture: $picture)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BrandOfShopProductsResponseDtoUseCase &&
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
  _$$_BrandOfShopProductsResponseDtoUseCaseCopyWith<
          _$_BrandOfShopProductsResponseDtoUseCase>
      get copyWith => __$$_BrandOfShopProductsResponseDtoUseCaseCopyWithImpl<
          _$_BrandOfShopProductsResponseDtoUseCase>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BrandOfShopProductsResponseDtoUseCaseToJson(this);
  }
}

abstract class _BrandOfShopProductsResponseDtoUseCase
    implements BrandOfShopProductsResponseDtoUseCase {
  factory _BrandOfShopProductsResponseDtoUseCase(
      {final String? id,
      final String? name,
      final String? picture}) = _$_BrandOfShopProductsResponseDtoUseCase;

  factory _BrandOfShopProductsResponseDtoUseCase.fromJson(
          Map<String, dynamic> json) =
      _$_BrandOfShopProductsResponseDtoUseCase.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get picture;
  @override
  @JsonKey(ignore: true)
  _$$_BrandOfShopProductsResponseDtoUseCaseCopyWith<
          _$_BrandOfShopProductsResponseDtoUseCase>
      get copyWith => throw _privateConstructorUsedError;
}

PictureOfShopProductsResponseDtoUseCase
    _$PictureOfShopProductsResponseDtoUseCaseFromJson(
        Map<String, dynamic> json) {
  return _PictureOfShopProductsResponseDtoUseCase.fromJson(json);
}

/// @nodoc
mixin _$PictureOfShopProductsResponseDtoUseCase {
  bool? get isMain => throw _privateConstructorUsedError;
  String? get picture => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PictureOfShopProductsResponseDtoUseCaseCopyWith<
          PictureOfShopProductsResponseDtoUseCase>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PictureOfShopProductsResponseDtoUseCaseCopyWith<$Res> {
  factory $PictureOfShopProductsResponseDtoUseCaseCopyWith(
          PictureOfShopProductsResponseDtoUseCase value,
          $Res Function(PictureOfShopProductsResponseDtoUseCase) then) =
      _$PictureOfShopProductsResponseDtoUseCaseCopyWithImpl<$Res>;
  $Res call({bool? isMain, String? picture});
}

/// @nodoc
class _$PictureOfShopProductsResponseDtoUseCaseCopyWithImpl<$Res>
    implements $PictureOfShopProductsResponseDtoUseCaseCopyWith<$Res> {
  _$PictureOfShopProductsResponseDtoUseCaseCopyWithImpl(
      this._value, this._then);

  final PictureOfShopProductsResponseDtoUseCase _value;
  // ignore: unused_field
  final $Res Function(PictureOfShopProductsResponseDtoUseCase) _then;

  @override
  $Res call({
    Object? isMain = freezed,
    Object? picture = freezed,
  }) {
    return _then(_value.copyWith(
      isMain: isMain == freezed
          ? _value.isMain
          : isMain // ignore: cast_nullable_to_non_nullable
              as bool?,
      picture: picture == freezed
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_PictureOfShopProductsResponseDtoUseCaseCopyWith<$Res>
    implements $PictureOfShopProductsResponseDtoUseCaseCopyWith<$Res> {
  factory _$$_PictureOfShopProductsResponseDtoUseCaseCopyWith(
          _$_PictureOfShopProductsResponseDtoUseCase value,
          $Res Function(_$_PictureOfShopProductsResponseDtoUseCase) then) =
      __$$_PictureOfShopProductsResponseDtoUseCaseCopyWithImpl<$Res>;
  @override
  $Res call({bool? isMain, String? picture});
}

/// @nodoc
class __$$_PictureOfShopProductsResponseDtoUseCaseCopyWithImpl<$Res>
    extends _$PictureOfShopProductsResponseDtoUseCaseCopyWithImpl<$Res>
    implements _$$_PictureOfShopProductsResponseDtoUseCaseCopyWith<$Res> {
  __$$_PictureOfShopProductsResponseDtoUseCaseCopyWithImpl(
      _$_PictureOfShopProductsResponseDtoUseCase _value,
      $Res Function(_$_PictureOfShopProductsResponseDtoUseCase) _then)
      : super(_value,
            (v) => _then(v as _$_PictureOfShopProductsResponseDtoUseCase));

  @override
  _$_PictureOfShopProductsResponseDtoUseCase get _value =>
      super._value as _$_PictureOfShopProductsResponseDtoUseCase;

  @override
  $Res call({
    Object? isMain = freezed,
    Object? picture = freezed,
  }) {
    return _then(_$_PictureOfShopProductsResponseDtoUseCase(
      isMain: isMain == freezed
          ? _value.isMain
          : isMain // ignore: cast_nullable_to_non_nullable
              as bool?,
      picture: picture == freezed
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PictureOfShopProductsResponseDtoUseCase
    implements _PictureOfShopProductsResponseDtoUseCase {
  _$_PictureOfShopProductsResponseDtoUseCase({this.isMain, this.picture});

  factory _$_PictureOfShopProductsResponseDtoUseCase.fromJson(
          Map<String, dynamic> json) =>
      _$$_PictureOfShopProductsResponseDtoUseCaseFromJson(json);

  @override
  final bool? isMain;
  @override
  final String? picture;

  @override
  String toString() {
    return 'PictureOfShopProductsResponseDtoUseCase(isMain: $isMain, picture: $picture)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PictureOfShopProductsResponseDtoUseCase &&
            const DeepCollectionEquality().equals(other.isMain, isMain) &&
            const DeepCollectionEquality().equals(other.picture, picture));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isMain),
      const DeepCollectionEquality().hash(picture));

  @JsonKey(ignore: true)
  @override
  _$$_PictureOfShopProductsResponseDtoUseCaseCopyWith<
          _$_PictureOfShopProductsResponseDtoUseCase>
      get copyWith => __$$_PictureOfShopProductsResponseDtoUseCaseCopyWithImpl<
          _$_PictureOfShopProductsResponseDtoUseCase>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PictureOfShopProductsResponseDtoUseCaseToJson(this);
  }
}

abstract class _PictureOfShopProductsResponseDtoUseCase
    implements PictureOfShopProductsResponseDtoUseCase {
  factory _PictureOfShopProductsResponseDtoUseCase(
      {final bool? isMain,
      final String? picture}) = _$_PictureOfShopProductsResponseDtoUseCase;

  factory _PictureOfShopProductsResponseDtoUseCase.fromJson(
          Map<String, dynamic> json) =
      _$_PictureOfShopProductsResponseDtoUseCase.fromJson;

  @override
  bool? get isMain;
  @override
  String? get picture;
  @override
  @JsonKey(ignore: true)
  _$$_PictureOfShopProductsResponseDtoUseCaseCopyWith<
          _$_PictureOfShopProductsResponseDtoUseCase>
      get copyWith => throw _privateConstructorUsedError;
}
