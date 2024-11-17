// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cursus_users_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CursusUsersModel _$CursusUsersModelFromJson(Map<String, dynamic> json) {
  return _CursusUsersModel.fromJson(json);
}

/// @nodoc
mixin _$CursusUsersModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'cursus_id')
  int get cursusId => throw _privateConstructorUsedError;
  String? get grade => throw _privateConstructorUsedError;
  double get level => throw _privateConstructorUsedError;
  List<SkillModel> get skills => throw _privateConstructorUsedError;
  CursusModel get cursus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CursusUsersModelCopyWith<CursusUsersModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CursusUsersModelCopyWith<$Res> {
  factory $CursusUsersModelCopyWith(
          CursusUsersModel value, $Res Function(CursusUsersModel) then) =
      _$CursusUsersModelCopyWithImpl<$Res, CursusUsersModel>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'cursus_id') int cursusId,
      String? grade,
      double level,
      List<SkillModel> skills,
      CursusModel cursus});

  $CursusModelCopyWith<$Res> get cursus;
}

/// @nodoc
class _$CursusUsersModelCopyWithImpl<$Res, $Val extends CursusUsersModel>
    implements $CursusUsersModelCopyWith<$Res> {
  _$CursusUsersModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cursusId = null,
    Object? grade = freezed,
    Object? level = null,
    Object? skills = null,
    Object? cursus = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      cursusId: null == cursusId
          ? _value.cursusId
          : cursusId // ignore: cast_nullable_to_non_nullable
              as int,
      grade: freezed == grade
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as String?,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as double,
      skills: null == skills
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<SkillModel>,
      cursus: null == cursus
          ? _value.cursus
          : cursus // ignore: cast_nullable_to_non_nullable
              as CursusModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CursusModelCopyWith<$Res> get cursus {
    return $CursusModelCopyWith<$Res>(_value.cursus, (value) {
      return _then(_value.copyWith(cursus: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CursusUsersModelImplCopyWith<$Res>
    implements $CursusUsersModelCopyWith<$Res> {
  factory _$$CursusUsersModelImplCopyWith(_$CursusUsersModelImpl value,
          $Res Function(_$CursusUsersModelImpl) then) =
      __$$CursusUsersModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'cursus_id') int cursusId,
      String? grade,
      double level,
      List<SkillModel> skills,
      CursusModel cursus});

  @override
  $CursusModelCopyWith<$Res> get cursus;
}

/// @nodoc
class __$$CursusUsersModelImplCopyWithImpl<$Res>
    extends _$CursusUsersModelCopyWithImpl<$Res, _$CursusUsersModelImpl>
    implements _$$CursusUsersModelImplCopyWith<$Res> {
  __$$CursusUsersModelImplCopyWithImpl(_$CursusUsersModelImpl _value,
      $Res Function(_$CursusUsersModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cursusId = null,
    Object? grade = freezed,
    Object? level = null,
    Object? skills = null,
    Object? cursus = null,
  }) {
    return _then(_$CursusUsersModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      cursusId: null == cursusId
          ? _value.cursusId
          : cursusId // ignore: cast_nullable_to_non_nullable
              as int,
      grade: freezed == grade
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as String?,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as double,
      skills: null == skills
          ? _value._skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<SkillModel>,
      cursus: null == cursus
          ? _value.cursus
          : cursus // ignore: cast_nullable_to_non_nullable
              as CursusModel,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$CursusUsersModelImpl extends _CursusUsersModel
    with DiagnosticableTreeMixin {
  const _$CursusUsersModelImpl(
      {required this.id,
      @JsonKey(name: 'cursus_id') required this.cursusId,
      required this.grade,
      required this.level,
      required final List<SkillModel> skills,
      required this.cursus})
      : _skills = skills,
        super._();

  factory _$CursusUsersModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CursusUsersModelImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'cursus_id')
  final int cursusId;
  @override
  final String? grade;
  @override
  final double level;
  final List<SkillModel> _skills;
  @override
  List<SkillModel> get skills {
    if (_skills is EqualUnmodifiableListView) return _skills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_skills);
  }

  @override
  final CursusModel cursus;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CursusUsersModel(id: $id, cursusId: $cursusId, grade: $grade, level: $level, skills: $skills, cursus: $cursus)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CursusUsersModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('cursusId', cursusId))
      ..add(DiagnosticsProperty('grade', grade))
      ..add(DiagnosticsProperty('level', level))
      ..add(DiagnosticsProperty('skills', skills))
      ..add(DiagnosticsProperty('cursus', cursus));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CursusUsersModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.cursusId, cursusId) ||
                other.cursusId == cursusId) &&
            (identical(other.grade, grade) || other.grade == grade) &&
            (identical(other.level, level) || other.level == level) &&
            const DeepCollectionEquality().equals(other._skills, _skills) &&
            (identical(other.cursus, cursus) || other.cursus == cursus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, cursusId, grade, level,
      const DeepCollectionEquality().hash(_skills), cursus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CursusUsersModelImplCopyWith<_$CursusUsersModelImpl> get copyWith =>
      __$$CursusUsersModelImplCopyWithImpl<_$CursusUsersModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CursusUsersModelImplToJson(
      this,
    );
  }
}

abstract class _CursusUsersModel extends CursusUsersModel {
  const factory _CursusUsersModel(
      {required final int id,
      @JsonKey(name: 'cursus_id') required final int cursusId,
      required final String? grade,
      required final double level,
      required final List<SkillModel> skills,
      required final CursusModel cursus}) = _$CursusUsersModelImpl;
  const _CursusUsersModel._() : super._();

  factory _CursusUsersModel.fromJson(Map<String, dynamic> json) =
      _$CursusUsersModelImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'cursus_id')
  int get cursusId;
  @override
  String? get grade;
  @override
  double get level;
  @override
  List<SkillModel> get skills;
  @override
  CursusModel get cursus;
  @override
  @JsonKey(ignore: true)
  _$$CursusUsersModelImplCopyWith<_$CursusUsersModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CursusModel _$CursusModelFromJson(Map<String, dynamic> json) {
  return _CursusModel.fromJson(json);
}

/// @nodoc
mixin _$CursusModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  String get kind => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CursusModelCopyWith<CursusModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CursusModelCopyWith<$Res> {
  factory $CursusModelCopyWith(
          CursusModel value, $Res Function(CursusModel) then) =
      _$CursusModelCopyWithImpl<$Res, CursusModel>;
  @useResult
  $Res call({int id, String name, String slug, String kind});
}

/// @nodoc
class _$CursusModelCopyWithImpl<$Res, $Val extends CursusModel>
    implements $CursusModelCopyWith<$Res> {
  _$CursusModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? slug = null,
    Object? kind = null,
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
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      kind: null == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CursusModelImplCopyWith<$Res>
    implements $CursusModelCopyWith<$Res> {
  factory _$$CursusModelImplCopyWith(
          _$CursusModelImpl value, $Res Function(_$CursusModelImpl) then) =
      __$$CursusModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String slug, String kind});
}

/// @nodoc
class __$$CursusModelImplCopyWithImpl<$Res>
    extends _$CursusModelCopyWithImpl<$Res, _$CursusModelImpl>
    implements _$$CursusModelImplCopyWith<$Res> {
  __$$CursusModelImplCopyWithImpl(
      _$CursusModelImpl _value, $Res Function(_$CursusModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? slug = null,
    Object? kind = null,
  }) {
    return _then(_$CursusModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      kind: null == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$CursusModelImpl extends _CursusModel with DiagnosticableTreeMixin {
  const _$CursusModelImpl(
      {required this.id,
      required this.name,
      required this.slug,
      required this.kind})
      : super._();

  factory _$CursusModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CursusModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String slug;
  @override
  final String kind;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CursusModel(id: $id, name: $name, slug: $slug, kind: $kind)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CursusModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('slug', slug))
      ..add(DiagnosticsProperty('kind', kind));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CursusModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.kind, kind) || other.kind == kind));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, slug, kind);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CursusModelImplCopyWith<_$CursusModelImpl> get copyWith =>
      __$$CursusModelImplCopyWithImpl<_$CursusModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CursusModelImplToJson(
      this,
    );
  }
}

abstract class _CursusModel extends CursusModel {
  const factory _CursusModel(
      {required final int id,
      required final String name,
      required final String slug,
      required final String kind}) = _$CursusModelImpl;
  const _CursusModel._() : super._();

  factory _CursusModel.fromJson(Map<String, dynamic> json) =
      _$CursusModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get slug;
  @override
  String get kind;
  @override
  @JsonKey(ignore: true)
  _$$CursusModelImplCopyWith<_$CursusModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
