// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'campus_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CampusModel _$CampusModelFromJson(Map<String, dynamic> json) {
  return _CampusModel.fromJson(json);
}

/// @nodoc
mixin _$CampusModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CampusModelCopyWith<CampusModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CampusModelCopyWith<$Res> {
  factory $CampusModelCopyWith(
          CampusModel value, $Res Function(CampusModel) then) =
      _$CampusModelCopyWithImpl<$Res, CampusModel>;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$CampusModelCopyWithImpl<$Res, $Val extends CampusModel>
    implements $CampusModelCopyWith<$Res> {
  _$CampusModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CampusModelImplCopyWith<$Res>
    implements $CampusModelCopyWith<$Res> {
  factory _$$CampusModelImplCopyWith(
          _$CampusModelImpl value, $Res Function(_$CampusModelImpl) then) =
      __$$CampusModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$$CampusModelImplCopyWithImpl<$Res>
    extends _$CampusModelCopyWithImpl<$Res, _$CampusModelImpl>
    implements _$$CampusModelImplCopyWith<$Res> {
  __$$CampusModelImplCopyWithImpl(
      _$CampusModelImpl _value, $Res Function(_$CampusModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$CampusModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$CampusModelImpl extends _CampusModel with DiagnosticableTreeMixin {
  const _$CampusModelImpl({required this.id, required this.name}) : super._();

  factory _$CampusModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CampusModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CampusModel(id: $id, name: $name)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CampusModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CampusModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CampusModelImplCopyWith<_$CampusModelImpl> get copyWith =>
      __$$CampusModelImplCopyWithImpl<_$CampusModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CampusModelImplToJson(
      this,
    );
  }
}

abstract class _CampusModel extends CampusModel {
  const factory _CampusModel(
      {required final int id, required final String name}) = _$CampusModelImpl;
  const _CampusModel._() : super._();

  factory _CampusModel.fromJson(Map<String, dynamic> json) =
      _$CampusModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$CampusModelImplCopyWith<_$CampusModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
