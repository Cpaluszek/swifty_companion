// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_users_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProjectUsersModel _$ProjectUsersModelFromJson(Map<String, dynamic> json) {
  return _ProjectUsersModel.fromJson(json);
}

/// @nodoc
mixin _$ProjectUsersModel {
  int get id => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'final_mark')
  int? get finalMark => throw _privateConstructorUsedError;
  @JsonKey(name: 'validated?')
  bool? get isValidated => throw _privateConstructorUsedError;
  ProjectModel get project => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectUsersModelCopyWith<ProjectUsersModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectUsersModelCopyWith<$Res> {
  factory $ProjectUsersModelCopyWith(
          ProjectUsersModel value, $Res Function(ProjectUsersModel) then) =
      _$ProjectUsersModelCopyWithImpl<$Res, ProjectUsersModel>;
  @useResult
  $Res call(
      {int id,
      String status,
      @JsonKey(name: 'final_mark') int? finalMark,
      @JsonKey(name: 'validated?') bool? isValidated,
      ProjectModel project});

  $ProjectModelCopyWith<$Res> get project;
}

/// @nodoc
class _$ProjectUsersModelCopyWithImpl<$Res, $Val extends ProjectUsersModel>
    implements $ProjectUsersModelCopyWith<$Res> {
  _$ProjectUsersModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? finalMark = freezed,
    Object? isValidated = freezed,
    Object? project = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      finalMark: freezed == finalMark
          ? _value.finalMark
          : finalMark // ignore: cast_nullable_to_non_nullable
              as int?,
      isValidated: freezed == isValidated
          ? _value.isValidated
          : isValidated // ignore: cast_nullable_to_non_nullable
              as bool?,
      project: null == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as ProjectModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProjectModelCopyWith<$Res> get project {
    return $ProjectModelCopyWith<$Res>(_value.project, (value) {
      return _then(_value.copyWith(project: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProjectUsersModelImplCopyWith<$Res>
    implements $ProjectUsersModelCopyWith<$Res> {
  factory _$$ProjectUsersModelImplCopyWith(_$ProjectUsersModelImpl value,
          $Res Function(_$ProjectUsersModelImpl) then) =
      __$$ProjectUsersModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String status,
      @JsonKey(name: 'final_mark') int? finalMark,
      @JsonKey(name: 'validated?') bool? isValidated,
      ProjectModel project});

  @override
  $ProjectModelCopyWith<$Res> get project;
}

/// @nodoc
class __$$ProjectUsersModelImplCopyWithImpl<$Res>
    extends _$ProjectUsersModelCopyWithImpl<$Res, _$ProjectUsersModelImpl>
    implements _$$ProjectUsersModelImplCopyWith<$Res> {
  __$$ProjectUsersModelImplCopyWithImpl(_$ProjectUsersModelImpl _value,
      $Res Function(_$ProjectUsersModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? finalMark = freezed,
    Object? isValidated = freezed,
    Object? project = null,
  }) {
    return _then(_$ProjectUsersModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      finalMark: freezed == finalMark
          ? _value.finalMark
          : finalMark // ignore: cast_nullable_to_non_nullable
              as int?,
      isValidated: freezed == isValidated
          ? _value.isValidated
          : isValidated // ignore: cast_nullable_to_non_nullable
              as bool?,
      project: null == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as ProjectModel,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$ProjectUsersModelImpl extends _ProjectUsersModel
    with DiagnosticableTreeMixin {
  const _$ProjectUsersModelImpl(
      {required this.id,
      required this.status,
      @JsonKey(name: 'final_mark') required this.finalMark,
      @JsonKey(name: 'validated?') required this.isValidated,
      required this.project})
      : super._();

  factory _$ProjectUsersModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectUsersModelImplFromJson(json);

  @override
  final int id;
  @override
  final String status;
  @override
  @JsonKey(name: 'final_mark')
  final int? finalMark;
  @override
  @JsonKey(name: 'validated?')
  final bool? isValidated;
  @override
  final ProjectModel project;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProjectUsersModel(id: $id, status: $status, finalMark: $finalMark, isValidated: $isValidated, project: $project)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProjectUsersModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('finalMark', finalMark))
      ..add(DiagnosticsProperty('isValidated', isValidated))
      ..add(DiagnosticsProperty('project', project));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectUsersModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.finalMark, finalMark) ||
                other.finalMark == finalMark) &&
            (identical(other.isValidated, isValidated) ||
                other.isValidated == isValidated) &&
            (identical(other.project, project) || other.project == project));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, status, finalMark, isValidated, project);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectUsersModelImplCopyWith<_$ProjectUsersModelImpl> get copyWith =>
      __$$ProjectUsersModelImplCopyWithImpl<_$ProjectUsersModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectUsersModelImplToJson(
      this,
    );
  }
}

abstract class _ProjectUsersModel extends ProjectUsersModel {
  const factory _ProjectUsersModel(
      {required final int id,
      required final String status,
      @JsonKey(name: 'final_mark') required final int? finalMark,
      @JsonKey(name: 'validated?') required final bool? isValidated,
      required final ProjectModel project}) = _$ProjectUsersModelImpl;
  const _ProjectUsersModel._() : super._();

  factory _ProjectUsersModel.fromJson(Map<String, dynamic> json) =
      _$ProjectUsersModelImpl.fromJson;

  @override
  int get id;
  @override
  String get status;
  @override
  @JsonKey(name: 'final_mark')
  int? get finalMark;
  @override
  @JsonKey(name: 'validated?')
  bool? get isValidated;
  @override
  ProjectModel get project;
  @override
  @JsonKey(ignore: true)
  _$$ProjectUsersModelImplCopyWith<_$ProjectUsersModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProjectModel _$ProjectModelFromJson(Map<String, dynamic> json) {
  return _ProjectModel.fromJson(json);
}

/// @nodoc
mixin _$ProjectModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  @JsonKey(name: 'parent_id')
  int? get parentId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectModelCopyWith<ProjectModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectModelCopyWith<$Res> {
  factory $ProjectModelCopyWith(
          ProjectModel value, $Res Function(ProjectModel) then) =
      _$ProjectModelCopyWithImpl<$Res, ProjectModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      String slug,
      @JsonKey(name: 'parent_id') int? parentId});
}

/// @nodoc
class _$ProjectModelCopyWithImpl<$Res, $Val extends ProjectModel>
    implements $ProjectModelCopyWith<$Res> {
  _$ProjectModelCopyWithImpl(this._value, this._then);

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
    Object? parentId = freezed,
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
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProjectModelImplCopyWith<$Res>
    implements $ProjectModelCopyWith<$Res> {
  factory _$$ProjectModelImplCopyWith(
          _$ProjectModelImpl value, $Res Function(_$ProjectModelImpl) then) =
      __$$ProjectModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String slug,
      @JsonKey(name: 'parent_id') int? parentId});
}

/// @nodoc
class __$$ProjectModelImplCopyWithImpl<$Res>
    extends _$ProjectModelCopyWithImpl<$Res, _$ProjectModelImpl>
    implements _$$ProjectModelImplCopyWith<$Res> {
  __$$ProjectModelImplCopyWithImpl(
      _$ProjectModelImpl _value, $Res Function(_$ProjectModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? slug = null,
    Object? parentId = freezed,
  }) {
    return _then(_$ProjectModelImpl(
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
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$ProjectModelImpl extends _ProjectModel with DiagnosticableTreeMixin {
  const _$ProjectModelImpl(
      {required this.id,
      required this.name,
      required this.slug,
      @JsonKey(name: 'parent_id') required this.parentId})
      : super._();

  factory _$ProjectModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String slug;
  @override
  @JsonKey(name: 'parent_id')
  final int? parentId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProjectModel(id: $id, name: $name, slug: $slug, parentId: $parentId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProjectModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('slug', slug))
      ..add(DiagnosticsProperty('parentId', parentId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, slug, parentId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectModelImplCopyWith<_$ProjectModelImpl> get copyWith =>
      __$$ProjectModelImplCopyWithImpl<_$ProjectModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectModelImplToJson(
      this,
    );
  }
}

abstract class _ProjectModel extends ProjectModel {
  const factory _ProjectModel(
          {required final int id,
          required final String name,
          required final String slug,
          @JsonKey(name: 'parent_id') required final int? parentId}) =
      _$ProjectModelImpl;
  const _ProjectModel._() : super._();

  factory _ProjectModel.fromJson(Map<String, dynamic> json) =
      _$ProjectModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get slug;
  @override
  @JsonKey(name: 'parent_id')
  int? get parentId;
  @override
  @JsonKey(ignore: true)
  _$$ProjectModelImplCopyWith<_$ProjectModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
