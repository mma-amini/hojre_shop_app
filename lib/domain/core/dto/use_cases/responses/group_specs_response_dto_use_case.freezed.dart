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
  List<ItemOfGroupSpecsResponseDtoUseCase>? get items =>
      throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get specId => throw _privateConstructorUsedError;

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
      {List<ItemOfGroupSpecsResponseDtoUseCase>? items,
      String? name,
      String? specId});
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
    Object? items = freezed,
    Object? name = freezed,
    Object? specId = freezed,
  }) {
    return _then(_value.copyWith(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ItemOfGroupSpecsResponseDtoUseCase>?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      specId: specId == freezed
          ? _value.specId
          : specId // ignore: cast_nullable_to_non_nullable
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
      {List<ItemOfGroupSpecsResponseDtoUseCase>? items,
      String? name,
      String? specId});
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
    Object? items = freezed,
    Object? name = freezed,
    Object? specId = freezed,
  }) {
    return _then(_$_GroupSpecsResponseDtoUseCase(
      items: items == freezed
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ItemOfGroupSpecsResponseDtoUseCase>?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      specId: specId == freezed
          ? _value.specId
          : specId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GroupSpecsResponseDtoUseCase implements _GroupSpecsResponseDtoUseCase {
  _$_GroupSpecsResponseDtoUseCase(
      {final List<ItemOfGroupSpecsResponseDtoUseCase>? items,
      this.name,
      this.specId})
      : _items = items;

  factory _$_GroupSpecsResponseDtoUseCase.fromJson(Map<String, dynamic> json) =>
      _$$_GroupSpecsResponseDtoUseCaseFromJson(json);

  final List<ItemOfGroupSpecsResponseDtoUseCase>? _items;
  @override
  List<ItemOfGroupSpecsResponseDtoUseCase>? get items {
    final value = _items;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? name;
  @override
  final String? specId;

  @override
  String toString() {
    return 'GroupSpecsResponseDtoUseCase(items: $items, name: $name, specId: $specId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GroupSpecsResponseDtoUseCase &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.specId, specId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(specId));

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
      {final List<ItemOfGroupSpecsResponseDtoUseCase>? items,
      final String? name,
      final String? specId}) = _$_GroupSpecsResponseDtoUseCase;

  factory _GroupSpecsResponseDtoUseCase.fromJson(Map<String, dynamic> json) =
      _$_GroupSpecsResponseDtoUseCase.fromJson;

  @override
  List<ItemOfGroupSpecsResponseDtoUseCase>? get items;
  @override
  String? get name;
  @override
  String? get specId;
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
  String? get inputName => throw _privateConstructorUsedError;
  String? get inputTitle => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get specItemId => throw _privateConstructorUsedError;
  List<ValueOfItemOfGroupSpecsResponseDtoUseCase>? get values =>
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
      {String? inputName,
      String? inputTitle,
      String? name,
      String? specItemId,
      List<ValueOfItemOfGroupSpecsResponseDtoUseCase>? values});
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
    Object? inputName = freezed,
    Object? inputTitle = freezed,
    Object? name = freezed,
    Object? specItemId = freezed,
    Object? values = freezed,
  }) {
    return _then(_value.copyWith(
      inputName: inputName == freezed
          ? _value.inputName
          : inputName // ignore: cast_nullable_to_non_nullable
              as String?,
      inputTitle: inputTitle == freezed
          ? _value.inputTitle
          : inputTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      specItemId: specItemId == freezed
          ? _value.specItemId
          : specItemId // ignore: cast_nullable_to_non_nullable
              as String?,
      values: values == freezed
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
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
      {String? inputName,
      String? inputTitle,
      String? name,
      String? specItemId,
      List<ValueOfItemOfGroupSpecsResponseDtoUseCase>? values});
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
    Object? inputName = freezed,
    Object? inputTitle = freezed,
    Object? name = freezed,
    Object? specItemId = freezed,
    Object? values = freezed,
  }) {
    return _then(_$_ItemOfGroupSpecsResponseDtoUseCase(
      inputName: inputName == freezed
          ? _value.inputName
          : inputName // ignore: cast_nullable_to_non_nullable
              as String?,
      inputTitle: inputTitle == freezed
          ? _value.inputTitle
          : inputTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      specItemId: specItemId == freezed
          ? _value.specItemId
          : specItemId // ignore: cast_nullable_to_non_nullable
              as String?,
      values: values == freezed
          ? _value._values
          : values // ignore: cast_nullable_to_non_nullable
              as List<ValueOfItemOfGroupSpecsResponseDtoUseCase>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ItemOfGroupSpecsResponseDtoUseCase
    implements _ItemOfGroupSpecsResponseDtoUseCase {
  _$_ItemOfGroupSpecsResponseDtoUseCase(
      {this.inputName,
      this.inputTitle,
      this.name,
      this.specItemId,
      final List<ValueOfItemOfGroupSpecsResponseDtoUseCase>? values})
      : _values = values;

  factory _$_ItemOfGroupSpecsResponseDtoUseCase.fromJson(
          Map<String, dynamic> json) =>
      _$$_ItemOfGroupSpecsResponseDtoUseCaseFromJson(json);

  @override
  final String? inputName;
  @override
  final String? inputTitle;
  @override
  final String? name;
  @override
  final String? specItemId;
  final List<ValueOfItemOfGroupSpecsResponseDtoUseCase>? _values;
  @override
  List<ValueOfItemOfGroupSpecsResponseDtoUseCase>? get values {
    final value = _values;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ItemOfGroupSpecsResponseDtoUseCase(inputName: $inputName, inputTitle: $inputTitle, name: $name, specItemId: $specItemId, values: $values)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ItemOfGroupSpecsResponseDtoUseCase &&
            const DeepCollectionEquality().equals(other.inputName, inputName) &&
            const DeepCollectionEquality()
                .equals(other.inputTitle, inputTitle) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.specItemId, specItemId) &&
            const DeepCollectionEquality().equals(other._values, _values));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(inputName),
      const DeepCollectionEquality().hash(inputTitle),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(specItemId),
      const DeepCollectionEquality().hash(_values));

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
          {final String? inputName,
          final String? inputTitle,
          final String? name,
          final String? specItemId,
          final List<ValueOfItemOfGroupSpecsResponseDtoUseCase>? values}) =
      _$_ItemOfGroupSpecsResponseDtoUseCase;

  factory _ItemOfGroupSpecsResponseDtoUseCase.fromJson(
          Map<String, dynamic> json) =
      _$_ItemOfGroupSpecsResponseDtoUseCase.fromJson;

  @override
  String? get inputName;
  @override
  String? get inputTitle;
  @override
  String? get name;
  @override
  String? get specItemId;
  @override
  List<ValueOfItemOfGroupSpecsResponseDtoUseCase>? get values;
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
  String? get specValueId => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;

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
  $Res call({String? specValueId, String? title});
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
    Object? specValueId = freezed,
    Object? title = freezed,
  }) {
    return _then(_value.copyWith(
      specValueId: specValueId == freezed
          ? _value.specValueId
          : specValueId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
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
  $Res call({String? specValueId, String? title});
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
    Object? specValueId = freezed,
    Object? title = freezed,
  }) {
    return _then(_$_ValueOfItemOfGroupSpecsResponseDtoUseCase(
      specValueId: specValueId == freezed
          ? _value.specValueId
          : specValueId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ValueOfItemOfGroupSpecsResponseDtoUseCase
    implements _ValueOfItemOfGroupSpecsResponseDtoUseCase {
  _$_ValueOfItemOfGroupSpecsResponseDtoUseCase({this.specValueId, this.title});

  factory _$_ValueOfItemOfGroupSpecsResponseDtoUseCase.fromJson(
          Map<String, dynamic> json) =>
      _$$_ValueOfItemOfGroupSpecsResponseDtoUseCaseFromJson(json);

  @override
  final String? specValueId;
  @override
  final String? title;

  @override
  String toString() {
    return 'ValueOfItemOfGroupSpecsResponseDtoUseCase(specValueId: $specValueId, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ValueOfItemOfGroupSpecsResponseDtoUseCase &&
            const DeepCollectionEquality()
                .equals(other.specValueId, specValueId) &&
            const DeepCollectionEquality().equals(other.title, title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(specValueId),
      const DeepCollectionEquality().hash(title));

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
      {final String? specValueId,
      final String? title}) = _$_ValueOfItemOfGroupSpecsResponseDtoUseCase;

  factory _ValueOfItemOfGroupSpecsResponseDtoUseCase.fromJson(
          Map<String, dynamic> json) =
      _$_ValueOfItemOfGroupSpecsResponseDtoUseCase.fromJson;

  @override
  String? get specValueId;
  @override
  String? get title;
  @override
  @JsonKey(ignore: true)
  _$$_ValueOfItemOfGroupSpecsResponseDtoUseCaseCopyWith<
          _$_ValueOfItemOfGroupSpecsResponseDtoUseCase>
      get copyWith => throw _privateConstructorUsedError;
}
