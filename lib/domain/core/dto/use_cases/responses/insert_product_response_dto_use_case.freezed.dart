// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'insert_product_response_dto_use_case.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

InsertProductResponseDtoUseCase _$InsertProductResponseDtoUseCaseFromJson(
    Map<String, dynamic> json) {
  return _InsertProductResponseDtoUseCase.fromJson(json);
}

/// @nodoc
mixin _$InsertProductResponseDtoUseCase {
  String? get ProductId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InsertProductResponseDtoUseCaseCopyWith<InsertProductResponseDtoUseCase>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InsertProductResponseDtoUseCaseCopyWith<$Res> {
  factory $InsertProductResponseDtoUseCaseCopyWith(
          InsertProductResponseDtoUseCase value,
          $Res Function(InsertProductResponseDtoUseCase) then) =
      _$InsertProductResponseDtoUseCaseCopyWithImpl<$Res>;
  $Res call({String? ProductId});
}

/// @nodoc
class _$InsertProductResponseDtoUseCaseCopyWithImpl<$Res>
    implements $InsertProductResponseDtoUseCaseCopyWith<$Res> {
  _$InsertProductResponseDtoUseCaseCopyWithImpl(this._value, this._then);

  final InsertProductResponseDtoUseCase _value;
  // ignore: unused_field
  final $Res Function(InsertProductResponseDtoUseCase) _then;

  @override
  $Res call({
    Object? ProductId = freezed,
  }) {
    return _then(_value.copyWith(
      ProductId: ProductId == freezed
          ? _value.ProductId
          : ProductId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_InsertProductResponseDtoUseCaseCopyWith<$Res>
    implements $InsertProductResponseDtoUseCaseCopyWith<$Res> {
  factory _$$_InsertProductResponseDtoUseCaseCopyWith(
          _$_InsertProductResponseDtoUseCase value,
          $Res Function(_$_InsertProductResponseDtoUseCase) then) =
      __$$_InsertProductResponseDtoUseCaseCopyWithImpl<$Res>;
  @override
  $Res call({String? ProductId});
}

/// @nodoc
class __$$_InsertProductResponseDtoUseCaseCopyWithImpl<$Res>
    extends _$InsertProductResponseDtoUseCaseCopyWithImpl<$Res>
    implements _$$_InsertProductResponseDtoUseCaseCopyWith<$Res> {
  __$$_InsertProductResponseDtoUseCaseCopyWithImpl(
      _$_InsertProductResponseDtoUseCase _value,
      $Res Function(_$_InsertProductResponseDtoUseCase) _then)
      : super(_value, (v) => _then(v as _$_InsertProductResponseDtoUseCase));

  @override
  _$_InsertProductResponseDtoUseCase get _value =>
      super._value as _$_InsertProductResponseDtoUseCase;

  @override
  $Res call({
    Object? ProductId = freezed,
  }) {
    return _then(_$_InsertProductResponseDtoUseCase(
      ProductId: ProductId == freezed
          ? _value.ProductId
          : ProductId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_InsertProductResponseDtoUseCase
    implements _InsertProductResponseDtoUseCase {
  _$_InsertProductResponseDtoUseCase({this.ProductId});

  factory _$_InsertProductResponseDtoUseCase.fromJson(
          Map<String, dynamic> json) =>
      _$$_InsertProductResponseDtoUseCaseFromJson(json);

  @override
  final String? ProductId;

  @override
  String toString() {
    return 'InsertProductResponseDtoUseCase(ProductId: $ProductId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InsertProductResponseDtoUseCase &&
            const DeepCollectionEquality().equals(other.ProductId, ProductId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(ProductId));

  @JsonKey(ignore: true)
  @override
  _$$_InsertProductResponseDtoUseCaseCopyWith<
          _$_InsertProductResponseDtoUseCase>
      get copyWith => __$$_InsertProductResponseDtoUseCaseCopyWithImpl<
          _$_InsertProductResponseDtoUseCase>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InsertProductResponseDtoUseCaseToJson(this);
  }
}

abstract class _InsertProductResponseDtoUseCase
    implements InsertProductResponseDtoUseCase {
  factory _InsertProductResponseDtoUseCase({final String? ProductId}) =
      _$_InsertProductResponseDtoUseCase;

  factory _InsertProductResponseDtoUseCase.fromJson(Map<String, dynamic> json) =
      _$_InsertProductResponseDtoUseCase.fromJson;

  @override
  String? get ProductId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_InsertProductResponseDtoUseCaseCopyWith<
          _$_InsertProductResponseDtoUseCase>
      get copyWith => throw _privateConstructorUsedError;
}
