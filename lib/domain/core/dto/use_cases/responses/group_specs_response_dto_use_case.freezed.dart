// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'group_specs_response_dto_use_case.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GroupSpecsResponseDtoUseCase _$GroupSpecsResponseDtoUseCaseFromJson(
    Map<String, dynamic> json) {
  return _GroupSpecsResponseDtoUseCase.fromJson(json);
}

/// @nodoc
mixin _$GroupSpecsResponseDtoUseCase {
  List<ItemOfGroupSpecsResponseDtoUseCase>? get Items =>
      throw _privateConstructorUsedError;
  String? get Name => throw _privateConstructorUsedError;
  String? get SpecId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GroupSpecsResponseDtoUseCaseCopyWith<GroupSpecsResponseDtoUseCase>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupSpecsResponseDtoUseCaseCopyWith<$Res> {
  factory $GroupSpecsResponseDtoUseCaseCopyWith(
          GroupSpecsResponseDtoUseCase value,
          $Res Function(GroupSpecsResponseDtoUseCase) then) =
      _$GroupSpecsResponseDtoUseCaseCopyWithImpl<$Res>;
  $Res call(
      {List<ItemOfGroupSpecsResponseDtoUseCase>? Items,
      String? Name,
      String? SpecId});
}

/// @nodoc
class _$GroupSpecsResponseDtoUseCaseCopyWithImpl<$Res>
    implements $GroupSpecsResponseDtoUseCaseCopyWith<$Res> {
  _$GroupSpecsResponseDtoUseCaseCopyWithImpl(this._value, this._then);

  final GroupSpecsResponseDtoUseCase _value;
  // ignore: unused_field
  final $Res Function(GroupSpecsResponseDtoUseCase) _then;

  @override
  $Res call({
    Object? Items = freezed,
    Object? Name = freezed,
    Object? SpecId = freezed,
  }) {
    return _then(_value.copyWith(
      Items: Items == freezed
          ? _value.Items
          : Items // ignore: cast_nullable_to_non_nullable
              as List<ItemOfGroupSpecsResponseDtoUseCase>?,
      Name: Name == freezed
          ? _value.Name
          : Name // ignore: cast_nullable_to_non_nullable
              as String?,
      SpecId: SpecId == freezed
          ? _value.SpecId
          : SpecId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_GroupSpecsResponseDtoUseCaseCopyWith<$Res>
    implements $GroupSpecsResponseDtoUseCaseCopyWith<$Res> {
  factory _$$_GroupSpecsResponseDtoUseCaseCopyWith(
          _$_GroupSpecsResponseDtoUseCase value,
          $Res Function(_$_GroupSpecsResponseDtoUseCase) then) =
      __$$_GroupSpecsResponseDtoUseCaseCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<ItemOfGroupSpecsResponseDtoUseCase>? Items,
      String? Name,
      String? SpecId});
}

/// @nodoc
class __$$_GroupSpecsResponseDtoUseCaseCopyWithImpl<$Res>
    extends _$GroupSpecsResponseDtoUseCaseCopyWithImpl<$Res>
    implements _$$_GroupSpecsResponseDtoUseCaseCopyWith<$Res> {
  __$$_GroupSpecsResponseDtoUseCaseCopyWithImpl(
      _$_GroupSpecsResponseDtoUseCase _value,
      $Res Function(_$_GroupSpecsResponseDtoUseCase) _then)
      : super(_value, (v) => _then(v as _$_GroupSpecsResponseDtoUseCase));

  @override
  _$_GroupSpecsResponseDtoUseCase get _value =>
      super._value as _$_GroupSpecsResponseDtoUseCase;

  @override
  $Res call({
    Object? Items = freezed,
    Object? Name = freezed,
    Object? SpecId = freezed,
  }) {
    return _then(_$_GroupSpecsResponseDtoUseCase(
      Items: Items == freezed
          ? _value._Items
          : Items // ignore: cast_nullable_to_non_nullable
              as List<ItemOfGroupSpecsResponseDtoUseCase>?,
      Name: Name == freezed
          ? _value.Name
          : Name // ignore: cast_nullable_to_non_nullable
              as String?,
      SpecId: SpecId == freezed
          ? _value.SpecId
          : SpecId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GroupSpecsResponseDtoUseCase implements _GroupSpecsResponseDtoUseCase {
  _$_GroupSpecsResponseDtoUseCase(
      {final List<ItemOfGroupSpecsResponseDtoUseCase>? Items,
      this.Name,
      this.SpecId})
      : _Items = Items;

  factory _$_GroupSpecsResponseDtoUseCase.fromJson(Map<String, dynamic> json) =>
      _$$_GroupSpecsResponseDtoUseCaseFromJson(json);

  final List<ItemOfGroupSpecsResponseDtoUseCase>? _Items;
  @override
  List<ItemOfGroupSpecsResponseDtoUseCase>? get Items {
    final value = _Items;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? Name;
  @override
  final String? SpecId;

  @override
  String toString() {
    return 'GroupSpecsResponseDtoUseCase(Items: $Items, Name: $Name, SpecId: $SpecId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GroupSpecsResponseDtoUseCase &&
            const DeepCollectionEquality().equals(other._Items, _Items) &&
            const DeepCollectionEquality().equals(other.Name, Name) &&
            const DeepCollectionEquality().equals(other.SpecId, SpecId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_Items),
      const DeepCollectionEquality().hash(Name),
      const DeepCollectionEquality().hash(SpecId));

  @JsonKey(ignore: true)
  @override
  _$$_GroupSpecsResponseDtoUseCaseCopyWith<_$_GroupSpecsResponseDtoUseCase>
      get copyWith => __$$_GroupSpecsResponseDtoUseCaseCopyWithImpl<
          _$_GroupSpecsResponseDtoUseCase>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GroupSpecsResponseDtoUseCaseToJson(this);
  }
}

abstract class _GroupSpecsResponseDtoUseCase
    implements GroupSpecsResponseDtoUseCase {
  factory _GroupSpecsResponseDtoUseCase(
      {final List<ItemOfGroupSpecsResponseDtoUseCase>? Items,
      final String? Name,
      final String? SpecId}) = _$_GroupSpecsResponseDtoUseCase;

  factory _GroupSpecsResponseDtoUseCase.fromJson(Map<String, dynamic> json) =
      _$_GroupSpecsResponseDtoUseCase.fromJson;

  @override
  List<ItemOfGroupSpecsResponseDtoUseCase>? get Items =>
      throw _privateConstructorUsedError;
  @override
  String? get Name => throw _privateConstructorUsedError;
  @override
  String? get SpecId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_GroupSpecsResponseDtoUseCaseCopyWith<_$_GroupSpecsResponseDtoUseCase>
      get copyWith => throw _privateConstructorUsedError;
}

ItemOfGroupSpecsResponseDtoUseCase _$ItemOfGroupSpecsResponseDtoUseCaseFromJson(
    Map<String, dynamic> json) {
  return _ItemOfGroupSpecsResponseDtoUseCase.fromJson(json);
}

/// @nodoc
mixin _$ItemOfGroupSpecsResponseDtoUseCase {
  String? get InputName => throw _privateConstructorUsedError;
  String? get InputTitle => throw _privateConstructorUsedError;
  String? get Name => throw _privateConstructorUsedError;
  String? get SpecItemId => throw _privateConstructorUsedError;
  List<ValueOfItemOfGroupSpecsResponseDtoUseCase>? get Values =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemOfGroupSpecsResponseDtoUseCaseCopyWith<
          ItemOfGroupSpecsResponseDtoUseCase>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemOfGroupSpecsResponseDtoUseCaseCopyWith<$Res> {
  factory $ItemOfGroupSpecsResponseDtoUseCaseCopyWith(
          ItemOfGroupSpecsResponseDtoUseCase value,
          $Res Function(ItemOfGroupSpecsResponseDtoUseCase) then) =
      _$ItemOfGroupSpecsResponseDtoUseCaseCopyWithImpl<$Res>;
  $Res call(
      {String? InputName,
      String? InputTitle,
      String? Name,
      String? SpecItemId,
      List<ValueOfItemOfGroupSpecsResponseDtoUseCase>? Values});
}

/// @nodoc
class _$ItemOfGroupSpecsResponseDtoUseCaseCopyWithImpl<$Res>
    implements $ItemOfGroupSpecsResponseDtoUseCaseCopyWith<$Res> {
  _$ItemOfGroupSpecsResponseDtoUseCaseCopyWithImpl(this._value, this._then);

  final ItemOfGroupSpecsResponseDtoUseCase _value;
  // ignore: unused_field
  final $Res Function(ItemOfGroupSpecsResponseDtoUseCase) _then;

  @override
  $Res call({
    Object? InputName = freezed,
    Object? InputTitle = freezed,
    Object? Name = freezed,
    Object? SpecItemId = freezed,
    Object? Values = freezed,
  }) {
    return _then(_value.copyWith(
      InputName: InputName == freezed
          ? _value.InputName
          : InputName // ignore: cast_nullable_to_non_nullable
              as String?,
      InputTitle: InputTitle == freezed
          ? _value.InputTitle
          : InputTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      Name: Name == freezed
          ? _value.Name
          : Name // ignore: cast_nullable_to_non_nullable
              as String?,
      SpecItemId: SpecItemId == freezed
          ? _value.SpecItemId
          : SpecItemId // ignore: cast_nullable_to_non_nullable
              as String?,
      Values: Values == freezed
          ? _value.Values
          : Values // ignore: cast_nullable_to_non_nullable
              as List<ValueOfItemOfGroupSpecsResponseDtoUseCase>?,
    ));
  }
}

/// @nodoc
abstract class _$$_ItemOfGroupSpecsResponseDtoUseCaseCopyWith<$Res>
    implements $ItemOfGroupSpecsResponseDtoUseCaseCopyWith<$Res> {
  factory _$$_ItemOfGroupSpecsResponseDtoUseCaseCopyWith(
          _$_ItemOfGroupSpecsResponseDtoUseCase value,
          $Res Function(_$_ItemOfGroupSpecsResponseDtoUseCase) then) =
      __$$_ItemOfGroupSpecsResponseDtoUseCaseCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? InputName,
      String? InputTitle,
      String? Name,
      String? SpecItemId,
      List<ValueOfItemOfGroupSpecsResponseDtoUseCase>? Values});
}

/// @nodoc
class __$$_ItemOfGroupSpecsResponseDtoUseCaseCopyWithImpl<$Res>
    extends _$ItemOfGroupSpecsResponseDtoUseCaseCopyWithImpl<$Res>
    implements _$$_ItemOfGroupSpecsResponseDtoUseCaseCopyWith<$Res> {
  __$$_ItemOfGroupSpecsResponseDtoUseCaseCopyWithImpl(
      _$_ItemOfGroupSpecsResponseDtoUseCase _value,
      $Res Function(_$_ItemOfGroupSpecsResponseDtoUseCase) _then)
      : super(_value, (v) => _then(v as _$_ItemOfGroupSpecsResponseDtoUseCase));

  @override
  _$_ItemOfGroupSpecsResponseDtoUseCase get _value =>
      super._value as _$_ItemOfGroupSpecsResponseDtoUseCase;

  @override
  $Res call({
    Object? InputName = freezed,
    Object? InputTitle = freezed,
    Object? Name = freezed,
    Object? SpecItemId = freezed,
    Object? Values = freezed,
  }) {
    return _then(_$_ItemOfGroupSpecsResponseDtoUseCase(
      InputName: InputName == freezed
          ? _value.InputName
          : InputName // ignore: cast_nullable_to_non_nullable
              as String?,
      InputTitle: InputTitle == freezed
          ? _value.InputTitle
          : InputTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      Name: Name == freezed
          ? _value.Name
          : Name // ignore: cast_nullable_to_non_nullable
              as String?,
      SpecItemId: SpecItemId == freezed
          ? _value.SpecItemId
          : SpecItemId // ignore: cast_nullable_to_non_nullable
              as String?,
      Values: Values == freezed
          ? _value._Values
          : Values // ignore: cast_nullable_to_non_nullable
              as List<ValueOfItemOfGroupSpecsResponseDtoUseCase>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ItemOfGroupSpecsResponseDtoUseCase
    implements _ItemOfGroupSpecsResponseDtoUseCase {
  _$_ItemOfGroupSpecsResponseDtoUseCase(
      {this.InputName,
      this.InputTitle,
      this.Name,
      this.SpecItemId,
      final List<ValueOfItemOfGroupSpecsResponseDtoUseCase>? Values})
      : _Values = Values;

  factory _$_ItemOfGroupSpecsResponseDtoUseCase.fromJson(
          Map<String, dynamic> json) =>
      _$$_ItemOfGroupSpecsResponseDtoUseCaseFromJson(json);

  @override
  final String? InputName;
  @override
  final String? InputTitle;
  @override
  final String? Name;
  @override
  final String? SpecItemId;
  final List<ValueOfItemOfGroupSpecsResponseDtoUseCase>? _Values;
  @override
  List<ValueOfItemOfGroupSpecsResponseDtoUseCase>? get Values {
    final value = _Values;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ItemOfGroupSpecsResponseDtoUseCase(InputName: $InputName, InputTitle: $InputTitle, Name: $Name, SpecItemId: $SpecItemId, Values: $Values)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ItemOfGroupSpecsResponseDtoUseCase &&
            const DeepCollectionEquality().equals(other.InputName, InputName) &&
            const DeepCollectionEquality()
                .equals(other.InputTitle, InputTitle) &&
            const DeepCollectionEquality().equals(other.Name, Name) &&
            const DeepCollectionEquality()
                .equals(other.SpecItemId, SpecItemId) &&
            const DeepCollectionEquality().equals(other._Values, _Values));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(InputName),
      const DeepCollectionEquality().hash(InputTitle),
      const DeepCollectionEquality().hash(Name),
      const DeepCollectionEquality().hash(SpecItemId),
      const DeepCollectionEquality().hash(_Values));

  @JsonKey(ignore: true)
  @override
  _$$_ItemOfGroupSpecsResponseDtoUseCaseCopyWith<
          _$_ItemOfGroupSpecsResponseDtoUseCase>
      get copyWith => __$$_ItemOfGroupSpecsResponseDtoUseCaseCopyWithImpl<
          _$_ItemOfGroupSpecsResponseDtoUseCase>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ItemOfGroupSpecsResponseDtoUseCaseToJson(this);
  }
}

abstract class _ItemOfGroupSpecsResponseDtoUseCase
    implements ItemOfGroupSpecsResponseDtoUseCase {
  factory _ItemOfGroupSpecsResponseDtoUseCase(
          {final String? InputName,
          final String? InputTitle,
          final String? Name,
          final String? SpecItemId,
          final List<ValueOfItemOfGroupSpecsResponseDtoUseCase>? Values}) =
      _$_ItemOfGroupSpecsResponseDtoUseCase;

  factory _ItemOfGroupSpecsResponseDtoUseCase.fromJson(
          Map<String, dynamic> json) =
      _$_ItemOfGroupSpecsResponseDtoUseCase.fromJson;

  @override
  String? get InputName => throw _privateConstructorUsedError;
  @override
  String? get InputTitle => throw _privateConstructorUsedError;
  @override
  String? get Name => throw _privateConstructorUsedError;
  @override
  String? get SpecItemId => throw _privateConstructorUsedError;
  @override
  List<ValueOfItemOfGroupSpecsResponseDtoUseCase>? get Values =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ItemOfGroupSpecsResponseDtoUseCaseCopyWith<
          _$_ItemOfGroupSpecsResponseDtoUseCase>
      get copyWith => throw _privateConstructorUsedError;
}

ValueOfItemOfGroupSpecsResponseDtoUseCase
    _$ValueOfItemOfGroupSpecsResponseDtoUseCaseFromJson(
        Map<String, dynamic> json) {
  return _ValueOfItemOfGroupSpecsResponseDtoUseCase.fromJson(json);
}

/// @nodoc
mixin _$ValueOfItemOfGroupSpecsResponseDtoUseCase {
  String? get SpecValueId => throw _privateConstructorUsedError;
  String? get Title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ValueOfItemOfGroupSpecsResponseDtoUseCaseCopyWith<
          ValueOfItemOfGroupSpecsResponseDtoUseCase>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValueOfItemOfGroupSpecsResponseDtoUseCaseCopyWith<$Res> {
  factory $ValueOfItemOfGroupSpecsResponseDtoUseCaseCopyWith(
          ValueOfItemOfGroupSpecsResponseDtoUseCase value,
          $Res Function(ValueOfItemOfGroupSpecsResponseDtoUseCase) then) =
      _$ValueOfItemOfGroupSpecsResponseDtoUseCaseCopyWithImpl<$Res>;
  $Res call({String? SpecValueId, String? Title});
}

/// @nodoc
class _$ValueOfItemOfGroupSpecsResponseDtoUseCaseCopyWithImpl<$Res>
    implements $ValueOfItemOfGroupSpecsResponseDtoUseCaseCopyWith<$Res> {
  _$ValueOfItemOfGroupSpecsResponseDtoUseCaseCopyWithImpl(
      this._value, this._then);

  final ValueOfItemOfGroupSpecsResponseDtoUseCase _value;
  // ignore: unused_field
  final $Res Function(ValueOfItemOfGroupSpecsResponseDtoUseCase) _then;

  @override
  $Res call({
    Object? SpecValueId = freezed,
    Object? Title = freezed,
  }) {
    return _then(_value.copyWith(
      SpecValueId: SpecValueId == freezed
          ? _value.SpecValueId
          : SpecValueId // ignore: cast_nullable_to_non_nullable
              as String?,
      Title: Title == freezed
          ? _value.Title
          : Title // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_ValueOfItemOfGroupSpecsResponseDtoUseCaseCopyWith<$Res>
    implements $ValueOfItemOfGroupSpecsResponseDtoUseCaseCopyWith<$Res> {
  factory _$$_ValueOfItemOfGroupSpecsResponseDtoUseCaseCopyWith(
          _$_ValueOfItemOfGroupSpecsResponseDtoUseCase value,
          $Res Function(_$_ValueOfItemOfGroupSpecsResponseDtoUseCase) then) =
      __$$_ValueOfItemOfGroupSpecsResponseDtoUseCaseCopyWithImpl<$Res>;
  @override
  $Res call({String? SpecValueId, String? Title});
}

/// @nodoc
class __$$_ValueOfItemOfGroupSpecsResponseDtoUseCaseCopyWithImpl<$Res>
    extends _$ValueOfItemOfGroupSpecsResponseDtoUseCaseCopyWithImpl<$Res>
    implements _$$_ValueOfItemOfGroupSpecsResponseDtoUseCaseCopyWith<$Res> {
  __$$_ValueOfItemOfGroupSpecsResponseDtoUseCaseCopyWithImpl(
      _$_ValueOfItemOfGroupSpecsResponseDtoUseCase _value,
      $Res Function(_$_ValueOfItemOfGroupSpecsResponseDtoUseCase) _then)
      : super(_value,
            (v) => _then(v as _$_ValueOfItemOfGroupSpecsResponseDtoUseCase));

  @override
  _$_ValueOfItemOfGroupSpecsResponseDtoUseCase get _value =>
      super._value as _$_ValueOfItemOfGroupSpecsResponseDtoUseCase;

  @override
  $Res call({
    Object? SpecValueId = freezed,
    Object? Title = freezed,
  }) {
    return _then(_$_ValueOfItemOfGroupSpecsResponseDtoUseCase(
      SpecValueId: SpecValueId == freezed
          ? _value.SpecValueId
          : SpecValueId // ignore: cast_nullable_to_non_nullable
              as String?,
      Title: Title == freezed
          ? _value.Title
          : Title // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ValueOfItemOfGroupSpecsResponseDtoUseCase
    implements _ValueOfItemOfGroupSpecsResponseDtoUseCase {
  _$_ValueOfItemOfGroupSpecsResponseDtoUseCase({this.SpecValueId, this.Title});

  factory _$_ValueOfItemOfGroupSpecsResponseDtoUseCase.fromJson(
          Map<String, dynamic> json) =>
      _$$_ValueOfItemOfGroupSpecsResponseDtoUseCaseFromJson(json);

  @override
  final String? SpecValueId;
  @override
  final String? Title;

  @override
  String toString() {
    return 'ValueOfItemOfGroupSpecsResponseDtoUseCase(SpecValueId: $SpecValueId, Title: $Title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ValueOfItemOfGroupSpecsResponseDtoUseCase &&
            const DeepCollectionEquality()
                .equals(other.SpecValueId, SpecValueId) &&
            const DeepCollectionEquality().equals(other.Title, Title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(SpecValueId),
      const DeepCollectionEquality().hash(Title));

  @JsonKey(ignore: true)
  @override
  _$$_ValueOfItemOfGroupSpecsResponseDtoUseCaseCopyWith<
          _$_ValueOfItemOfGroupSpecsResponseDtoUseCase>
      get copyWith =>
          __$$_ValueOfItemOfGroupSpecsResponseDtoUseCaseCopyWithImpl<
              _$_ValueOfItemOfGroupSpecsResponseDtoUseCase>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ValueOfItemOfGroupSpecsResponseDtoUseCaseToJson(this);
  }
}

abstract class _ValueOfItemOfGroupSpecsResponseDtoUseCase
    implements ValueOfItemOfGroupSpecsResponseDtoUseCase {
  factory _ValueOfItemOfGroupSpecsResponseDtoUseCase(
      {final String? SpecValueId,
      final String? Title}) = _$_ValueOfItemOfGroupSpecsResponseDtoUseCase;

  factory _ValueOfItemOfGroupSpecsResponseDtoUseCase.fromJson(
          Map<String, dynamic> json) =
      _$_ValueOfItemOfGroupSpecsResponseDtoUseCase.fromJson;

  @override
  String? get SpecValueId => throw _privateConstructorUsedError;
  @override
  String? get Title => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ValueOfItemOfGroupSpecsResponseDtoUseCaseCopyWith<
          _$_ValueOfItemOfGroupSpecsResponseDtoUseCase>
      get copyWith => throw _privateConstructorUsedError;
}
