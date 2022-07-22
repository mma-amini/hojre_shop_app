// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'group_options_response_dto_use_case.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GroupOptionsResponseDtoUseCase _$GroupOptionsResponseDtoUseCaseFromJson(
    Map<String, dynamic> json) {
  return _GroupOptionsResponseDtoUseCase.fromJson(json);
}

/// @nodoc
mixin _$GroupOptionsResponseDtoUseCase {
  List<ItemOfGroupOptionsResponseDtoUseCase>? get items =>
      throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GroupOptionsResponseDtoUseCaseCopyWith<GroupOptionsResponseDtoUseCase>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupOptionsResponseDtoUseCaseCopyWith<$Res> {
  factory $GroupOptionsResponseDtoUseCaseCopyWith(
          GroupOptionsResponseDtoUseCase value,
          $Res Function(GroupOptionsResponseDtoUseCase) then) =
      _$GroupOptionsResponseDtoUseCaseCopyWithImpl<$Res>;
  $Res call(
      {List<ItemOfGroupOptionsResponseDtoUseCase>? items,
      String? name,
      String? id});
}

/// @nodoc
class _$GroupOptionsResponseDtoUseCaseCopyWithImpl<$Res>
    implements $GroupOptionsResponseDtoUseCaseCopyWith<$Res> {
  _$GroupOptionsResponseDtoUseCaseCopyWithImpl(this._value, this._then);

  final GroupOptionsResponseDtoUseCase _value;
  // ignore: unused_field
  final $Res Function(GroupOptionsResponseDtoUseCase) _then;

  @override
  $Res call({
    Object? items = freezed,
    Object? name = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ItemOfGroupOptionsResponseDtoUseCase>?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_GroupOptionsResponseDtoUseCaseCopyWith<$Res>
    implements $GroupOptionsResponseDtoUseCaseCopyWith<$Res> {
  factory _$$_GroupOptionsResponseDtoUseCaseCopyWith(
          _$_GroupOptionsResponseDtoUseCase value,
          $Res Function(_$_GroupOptionsResponseDtoUseCase) then) =
      __$$_GroupOptionsResponseDtoUseCaseCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<ItemOfGroupOptionsResponseDtoUseCase>? items,
      String? name,
      String? id});
}

/// @nodoc
class __$$_GroupOptionsResponseDtoUseCaseCopyWithImpl<$Res>
    extends _$GroupOptionsResponseDtoUseCaseCopyWithImpl<$Res>
    implements _$$_GroupOptionsResponseDtoUseCaseCopyWith<$Res> {
  __$$_GroupOptionsResponseDtoUseCaseCopyWithImpl(
      _$_GroupOptionsResponseDtoUseCase _value,
      $Res Function(_$_GroupOptionsResponseDtoUseCase) _then)
      : super(_value, (v) => _then(v as _$_GroupOptionsResponseDtoUseCase));

  @override
  _$_GroupOptionsResponseDtoUseCase get _value =>
      super._value as _$_GroupOptionsResponseDtoUseCase;

  @override
  $Res call({
    Object? items = freezed,
    Object? name = freezed,
    Object? id = freezed,
  }) {
    return _then(_$_GroupOptionsResponseDtoUseCase(
      items: items == freezed
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ItemOfGroupOptionsResponseDtoUseCase>?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GroupOptionsResponseDtoUseCase
    implements _GroupOptionsResponseDtoUseCase {
  _$_GroupOptionsResponseDtoUseCase(
      {final List<ItemOfGroupOptionsResponseDtoUseCase>? items,
      this.name,
      this.id})
      : _items = items;

  factory _$_GroupOptionsResponseDtoUseCase.fromJson(
          Map<String, dynamic> json) =>
      _$$_GroupOptionsResponseDtoUseCaseFromJson(json);

  final List<ItemOfGroupOptionsResponseDtoUseCase>? _items;
  @override
  List<ItemOfGroupOptionsResponseDtoUseCase>? get items {
    final value = _items;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? name;
  @override
  final String? id;

  @override
  String toString() {
    return 'GroupOptionsResponseDtoUseCase(items: $items, name: $name, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GroupOptionsResponseDtoUseCase &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.id, id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(id));

  @JsonKey(ignore: true)
  @override
  _$$_GroupOptionsResponseDtoUseCaseCopyWith<_$_GroupOptionsResponseDtoUseCase>
      get copyWith => __$$_GroupOptionsResponseDtoUseCaseCopyWithImpl<
          _$_GroupOptionsResponseDtoUseCase>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GroupOptionsResponseDtoUseCaseToJson(this);
  }
}

abstract class _GroupOptionsResponseDtoUseCase
    implements GroupOptionsResponseDtoUseCase {
  factory _GroupOptionsResponseDtoUseCase(
      {final List<ItemOfGroupOptionsResponseDtoUseCase>? items,
      final String? name,
      final String? id}) = _$_GroupOptionsResponseDtoUseCase;

  factory _GroupOptionsResponseDtoUseCase.fromJson(Map<String, dynamic> json) =
      _$_GroupOptionsResponseDtoUseCase.fromJson;

  @override
  List<ItemOfGroupOptionsResponseDtoUseCase>? get items;
  @override
  String? get name;
  @override
  String? get id;
  @override
  @JsonKey(ignore: true)
  _$$_GroupOptionsResponseDtoUseCaseCopyWith<_$_GroupOptionsResponseDtoUseCase>
      get copyWith => throw _privateConstructorUsedError;
}

ItemOfGroupOptionsResponseDtoUseCase
    _$ItemOfGroupOptionsResponseDtoUseCaseFromJson(Map<String, dynamic> json) {
  return _ItemOfGroupOptionsResponseDtoUseCase.fromJson(json);
}

/// @nodoc
mixin _$ItemOfGroupOptionsResponseDtoUseCase {
  String? get inputName => throw _privateConstructorUsedError;
  String? get inputTitle => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  List<ValueOfItemOfGroupOptionsResponseDtoUseCase>? get values =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemOfGroupOptionsResponseDtoUseCaseCopyWith<
          ItemOfGroupOptionsResponseDtoUseCase>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemOfGroupOptionsResponseDtoUseCaseCopyWith<$Res> {
  factory $ItemOfGroupOptionsResponseDtoUseCaseCopyWith(
          ItemOfGroupOptionsResponseDtoUseCase value,
          $Res Function(ItemOfGroupOptionsResponseDtoUseCase) then) =
      _$ItemOfGroupOptionsResponseDtoUseCaseCopyWithImpl<$Res>;
  $Res call(
      {String? inputName,
      String? inputTitle,
      String? name,
      String? id,
      List<ValueOfItemOfGroupOptionsResponseDtoUseCase>? values});
}

/// @nodoc
class _$ItemOfGroupOptionsResponseDtoUseCaseCopyWithImpl<$Res>
    implements $ItemOfGroupOptionsResponseDtoUseCaseCopyWith<$Res> {
  _$ItemOfGroupOptionsResponseDtoUseCaseCopyWithImpl(this._value, this._then);

  final ItemOfGroupOptionsResponseDtoUseCase _value;
  // ignore: unused_field
  final $Res Function(ItemOfGroupOptionsResponseDtoUseCase) _then;

  @override
  $Res call({
    Object? inputName = freezed,
    Object? inputTitle = freezed,
    Object? name = freezed,
    Object? id = freezed,
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
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      values: values == freezed
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as List<ValueOfItemOfGroupOptionsResponseDtoUseCase>?,
    ));
  }
}

/// @nodoc
abstract class _$$_ItemOfGroupOptionsResponseDtoUseCaseCopyWith<$Res>
    implements $ItemOfGroupOptionsResponseDtoUseCaseCopyWith<$Res> {
  factory _$$_ItemOfGroupOptionsResponseDtoUseCaseCopyWith(
          _$_ItemOfGroupOptionsResponseDtoUseCase value,
          $Res Function(_$_ItemOfGroupOptionsResponseDtoUseCase) then) =
      __$$_ItemOfGroupOptionsResponseDtoUseCaseCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? inputName,
      String? inputTitle,
      String? name,
      String? id,
      List<ValueOfItemOfGroupOptionsResponseDtoUseCase>? values});
}

/// @nodoc
class __$$_ItemOfGroupOptionsResponseDtoUseCaseCopyWithImpl<$Res>
    extends _$ItemOfGroupOptionsResponseDtoUseCaseCopyWithImpl<$Res>
    implements _$$_ItemOfGroupOptionsResponseDtoUseCaseCopyWith<$Res> {
  __$$_ItemOfGroupOptionsResponseDtoUseCaseCopyWithImpl(
      _$_ItemOfGroupOptionsResponseDtoUseCase _value,
      $Res Function(_$_ItemOfGroupOptionsResponseDtoUseCase) _then)
      : super(
            _value, (v) => _then(v as _$_ItemOfGroupOptionsResponseDtoUseCase));

  @override
  _$_ItemOfGroupOptionsResponseDtoUseCase get _value =>
      super._value as _$_ItemOfGroupOptionsResponseDtoUseCase;

  @override
  $Res call({
    Object? inputName = freezed,
    Object? inputTitle = freezed,
    Object? name = freezed,
    Object? id = freezed,
    Object? values = freezed,
  }) {
    return _then(_$_ItemOfGroupOptionsResponseDtoUseCase(
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
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      values: values == freezed
          ? _value._values
          : values // ignore: cast_nullable_to_non_nullable
              as List<ValueOfItemOfGroupOptionsResponseDtoUseCase>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ItemOfGroupOptionsResponseDtoUseCase
    implements _ItemOfGroupOptionsResponseDtoUseCase {
  _$_ItemOfGroupOptionsResponseDtoUseCase(
      {this.inputName,
      this.inputTitle,
      this.name,
      this.id,
      final List<ValueOfItemOfGroupOptionsResponseDtoUseCase>? values})
      : _values = values;

  factory _$_ItemOfGroupOptionsResponseDtoUseCase.fromJson(
          Map<String, dynamic> json) =>
      _$$_ItemOfGroupOptionsResponseDtoUseCaseFromJson(json);

  @override
  final String? inputName;
  @override
  final String? inputTitle;
  @override
  final String? name;
  @override
  final String? id;
  final List<ValueOfItemOfGroupOptionsResponseDtoUseCase>? _values;
  @override
  List<ValueOfItemOfGroupOptionsResponseDtoUseCase>? get values {
    final value = _values;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ItemOfGroupOptionsResponseDtoUseCase(inputName: $inputName, inputTitle: $inputTitle, name: $name, id: $id, values: $values)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ItemOfGroupOptionsResponseDtoUseCase &&
            const DeepCollectionEquality().equals(other.inputName, inputName) &&
            const DeepCollectionEquality()
                .equals(other.inputTitle, inputTitle) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other._values, _values));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(inputName),
      const DeepCollectionEquality().hash(inputTitle),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(_values));

  @JsonKey(ignore: true)
  @override
  _$$_ItemOfGroupOptionsResponseDtoUseCaseCopyWith<
          _$_ItemOfGroupOptionsResponseDtoUseCase>
      get copyWith => __$$_ItemOfGroupOptionsResponseDtoUseCaseCopyWithImpl<
          _$_ItemOfGroupOptionsResponseDtoUseCase>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ItemOfGroupOptionsResponseDtoUseCaseToJson(this);
  }
}

abstract class _ItemOfGroupOptionsResponseDtoUseCase
    implements ItemOfGroupOptionsResponseDtoUseCase {
  factory _ItemOfGroupOptionsResponseDtoUseCase(
          {final String? inputName,
          final String? inputTitle,
          final String? name,
          final String? id,
          final List<ValueOfItemOfGroupOptionsResponseDtoUseCase>? values}) =
      _$_ItemOfGroupOptionsResponseDtoUseCase;

  factory _ItemOfGroupOptionsResponseDtoUseCase.fromJson(
          Map<String, dynamic> json) =
      _$_ItemOfGroupOptionsResponseDtoUseCase.fromJson;

  @override
  String? get inputName;
  @override
  String? get inputTitle;
  @override
  String? get name;
  @override
  String? get id;
  @override
  List<ValueOfItemOfGroupOptionsResponseDtoUseCase>? get values;
  @override
  @JsonKey(ignore: true)
  _$$_ItemOfGroupOptionsResponseDtoUseCaseCopyWith<
          _$_ItemOfGroupOptionsResponseDtoUseCase>
      get copyWith => throw _privateConstructorUsedError;
}

ValueOfItemOfGroupOptionsResponseDtoUseCase
    _$ValueOfItemOfGroupOptionsResponseDtoUseCaseFromJson(
        Map<String, dynamic> json) {
  return _ValueOfItemOfGroupOptionsResponseDtoUseCase.fromJson(json);
}

/// @nodoc
mixin _$ValueOfItemOfGroupOptionsResponseDtoUseCase {
  String? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ValueOfItemOfGroupOptionsResponseDtoUseCaseCopyWith<
          ValueOfItemOfGroupOptionsResponseDtoUseCase>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValueOfItemOfGroupOptionsResponseDtoUseCaseCopyWith<$Res> {
  factory $ValueOfItemOfGroupOptionsResponseDtoUseCaseCopyWith(
          ValueOfItemOfGroupOptionsResponseDtoUseCase value,
          $Res Function(ValueOfItemOfGroupOptionsResponseDtoUseCase) then) =
      _$ValueOfItemOfGroupOptionsResponseDtoUseCaseCopyWithImpl<$Res>;
  $Res call({String? id, String? title, String? value});
}

/// @nodoc
class _$ValueOfItemOfGroupOptionsResponseDtoUseCaseCopyWithImpl<$Res>
    implements $ValueOfItemOfGroupOptionsResponseDtoUseCaseCopyWith<$Res> {
  _$ValueOfItemOfGroupOptionsResponseDtoUseCaseCopyWithImpl(
      this._value, this._then);

  final ValueOfItemOfGroupOptionsResponseDtoUseCase _value;
  // ignore: unused_field
  final $Res Function(ValueOfItemOfGroupOptionsResponseDtoUseCase) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_ValueOfItemOfGroupOptionsResponseDtoUseCaseCopyWith<$Res>
    implements $ValueOfItemOfGroupOptionsResponseDtoUseCaseCopyWith<$Res> {
  factory _$$_ValueOfItemOfGroupOptionsResponseDtoUseCaseCopyWith(
          _$_ValueOfItemOfGroupOptionsResponseDtoUseCase value,
          $Res Function(_$_ValueOfItemOfGroupOptionsResponseDtoUseCase) then) =
      __$$_ValueOfItemOfGroupOptionsResponseDtoUseCaseCopyWithImpl<$Res>;
  @override
  $Res call({String? id, String? title, String? value});
}

/// @nodoc
class __$$_ValueOfItemOfGroupOptionsResponseDtoUseCaseCopyWithImpl<$Res>
    extends _$ValueOfItemOfGroupOptionsResponseDtoUseCaseCopyWithImpl<$Res>
    implements _$$_ValueOfItemOfGroupOptionsResponseDtoUseCaseCopyWith<$Res> {
  __$$_ValueOfItemOfGroupOptionsResponseDtoUseCaseCopyWithImpl(
      _$_ValueOfItemOfGroupOptionsResponseDtoUseCase _value,
      $Res Function(_$_ValueOfItemOfGroupOptionsResponseDtoUseCase) _then)
      : super(_value,
            (v) => _then(v as _$_ValueOfItemOfGroupOptionsResponseDtoUseCase));

  @override
  _$_ValueOfItemOfGroupOptionsResponseDtoUseCase get _value =>
      super._value as _$_ValueOfItemOfGroupOptionsResponseDtoUseCase;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? value = freezed,
  }) {
    return _then(_$_ValueOfItemOfGroupOptionsResponseDtoUseCase(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ValueOfItemOfGroupOptionsResponseDtoUseCase
    implements _ValueOfItemOfGroupOptionsResponseDtoUseCase {
  _$_ValueOfItemOfGroupOptionsResponseDtoUseCase(
      {this.id, this.title, this.value});

  factory _$_ValueOfItemOfGroupOptionsResponseDtoUseCase.fromJson(
          Map<String, dynamic> json) =>
      _$$_ValueOfItemOfGroupOptionsResponseDtoUseCaseFromJson(json);

  @override
  final String? id;
  @override
  final String? title;
  @override
  final String? value;

  @override
  String toString() {
    return 'ValueOfItemOfGroupOptionsResponseDtoUseCase(id: $id, title: $title, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ValueOfItemOfGroupOptionsResponseDtoUseCase &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  _$$_ValueOfItemOfGroupOptionsResponseDtoUseCaseCopyWith<
          _$_ValueOfItemOfGroupOptionsResponseDtoUseCase>
      get copyWith =>
          __$$_ValueOfItemOfGroupOptionsResponseDtoUseCaseCopyWithImpl<
              _$_ValueOfItemOfGroupOptionsResponseDtoUseCase>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ValueOfItemOfGroupOptionsResponseDtoUseCaseToJson(this);
  }
}

abstract class _ValueOfItemOfGroupOptionsResponseDtoUseCase
    implements ValueOfItemOfGroupOptionsResponseDtoUseCase {
  factory _ValueOfItemOfGroupOptionsResponseDtoUseCase(
      {final String? id,
      final String? title,
      final String? value}) = _$_ValueOfItemOfGroupOptionsResponseDtoUseCase;

  factory _ValueOfItemOfGroupOptionsResponseDtoUseCase.fromJson(
          Map<String, dynamic> json) =
      _$_ValueOfItemOfGroupOptionsResponseDtoUseCase.fromJson;

  @override
  String? get id;
  @override
  String? get title;
  @override
  String? get value;
  @override
  @JsonKey(ignore: true)
  _$$_ValueOfItemOfGroupOptionsResponseDtoUseCaseCopyWith<
          _$_ValueOfItemOfGroupOptionsResponseDtoUseCase>
      get copyWith => throw _privateConstructorUsedError;
}
