// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ImageModel _$ImageModelFromJson(Map<String, dynamic> json) {
  return _ImageModel.fromJson(json);
}

/// @nodoc
mixin _$ImageModel {
  String get link => throw _privateConstructorUsedError;
  ImageVersions get versions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageModelCopyWith<ImageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageModelCopyWith<$Res> {
  factory $ImageModelCopyWith(
          ImageModel value, $Res Function(ImageModel) then) =
      _$ImageModelCopyWithImpl<$Res, ImageModel>;
  @useResult
  $Res call({String link, ImageVersions versions});

  $ImageVersionsCopyWith<$Res> get versions;
}

/// @nodoc
class _$ImageModelCopyWithImpl<$Res, $Val extends ImageModel>
    implements $ImageModelCopyWith<$Res> {
  _$ImageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? link = null,
    Object? versions = null,
  }) {
    return _then(_value.copyWith(
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      versions: null == versions
          ? _value.versions
          : versions // ignore: cast_nullable_to_non_nullable
              as ImageVersions,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageVersionsCopyWith<$Res> get versions {
    return $ImageVersionsCopyWith<$Res>(_value.versions, (value) {
      return _then(_value.copyWith(versions: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ImageModelImplCopyWith<$Res>
    implements $ImageModelCopyWith<$Res> {
  factory _$$ImageModelImplCopyWith(
          _$ImageModelImpl value, $Res Function(_$ImageModelImpl) then) =
      __$$ImageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String link, ImageVersions versions});

  @override
  $ImageVersionsCopyWith<$Res> get versions;
}

/// @nodoc
class __$$ImageModelImplCopyWithImpl<$Res>
    extends _$ImageModelCopyWithImpl<$Res, _$ImageModelImpl>
    implements _$$ImageModelImplCopyWith<$Res> {
  __$$ImageModelImplCopyWithImpl(
      _$ImageModelImpl _value, $Res Function(_$ImageModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? link = null,
    Object? versions = null,
  }) {
    return _then(_$ImageModelImpl(
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      versions: null == versions
          ? _value.versions
          : versions // ignore: cast_nullable_to_non_nullable
              as ImageVersions,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$ImageModelImpl extends _ImageModel with DiagnosticableTreeMixin {
  const _$ImageModelImpl({required this.link, required this.versions})
      : super._();

  factory _$ImageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImageModelImplFromJson(json);

  @override
  final String link;
  @override
  final ImageVersions versions;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ImageModel(link: $link, versions: $versions)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ImageModel'))
      ..add(DiagnosticsProperty('link', link))
      ..add(DiagnosticsProperty('versions', versions));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageModelImpl &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.versions, versions) ||
                other.versions == versions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, link, versions);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageModelImplCopyWith<_$ImageModelImpl> get copyWith =>
      __$$ImageModelImplCopyWithImpl<_$ImageModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImageModelImplToJson(
      this,
    );
  }
}

abstract class _ImageModel extends ImageModel {
  const factory _ImageModel(
      {required final String link,
      required final ImageVersions versions}) = _$ImageModelImpl;
  const _ImageModel._() : super._();

  factory _ImageModel.fromJson(Map<String, dynamic> json) =
      _$ImageModelImpl.fromJson;

  @override
  String get link;
  @override
  ImageVersions get versions;
  @override
  @JsonKey(ignore: true)
  _$$ImageModelImplCopyWith<_$ImageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ImageVersions _$ImageVersionsFromJson(Map<String, dynamic> json) {
  return _ImageVersions.fromJson(json);
}

/// @nodoc
mixin _$ImageVersions {
  String get large => throw _privateConstructorUsedError;
  String get medium => throw _privateConstructorUsedError;
  String get small => throw _privateConstructorUsedError;
  String get micro => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageVersionsCopyWith<ImageVersions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageVersionsCopyWith<$Res> {
  factory $ImageVersionsCopyWith(
          ImageVersions value, $Res Function(ImageVersions) then) =
      _$ImageVersionsCopyWithImpl<$Res, ImageVersions>;
  @useResult
  $Res call({String large, String medium, String small, String micro});
}

/// @nodoc
class _$ImageVersionsCopyWithImpl<$Res, $Val extends ImageVersions>
    implements $ImageVersionsCopyWith<$Res> {
  _$ImageVersionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? large = null,
    Object? medium = null,
    Object? small = null,
    Object? micro = null,
  }) {
    return _then(_value.copyWith(
      large: null == large
          ? _value.large
          : large // ignore: cast_nullable_to_non_nullable
              as String,
      medium: null == medium
          ? _value.medium
          : medium // ignore: cast_nullable_to_non_nullable
              as String,
      small: null == small
          ? _value.small
          : small // ignore: cast_nullable_to_non_nullable
              as String,
      micro: null == micro
          ? _value.micro
          : micro // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImageVersionsImplCopyWith<$Res>
    implements $ImageVersionsCopyWith<$Res> {
  factory _$$ImageVersionsImplCopyWith(
          _$ImageVersionsImpl value, $Res Function(_$ImageVersionsImpl) then) =
      __$$ImageVersionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String large, String medium, String small, String micro});
}

/// @nodoc
class __$$ImageVersionsImplCopyWithImpl<$Res>
    extends _$ImageVersionsCopyWithImpl<$Res, _$ImageVersionsImpl>
    implements _$$ImageVersionsImplCopyWith<$Res> {
  __$$ImageVersionsImplCopyWithImpl(
      _$ImageVersionsImpl _value, $Res Function(_$ImageVersionsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? large = null,
    Object? medium = null,
    Object? small = null,
    Object? micro = null,
  }) {
    return _then(_$ImageVersionsImpl(
      large: null == large
          ? _value.large
          : large // ignore: cast_nullable_to_non_nullable
              as String,
      medium: null == medium
          ? _value.medium
          : medium // ignore: cast_nullable_to_non_nullable
              as String,
      small: null == small
          ? _value.small
          : small // ignore: cast_nullable_to_non_nullable
              as String,
      micro: null == micro
          ? _value.micro
          : micro // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$ImageVersionsImpl extends _ImageVersions with DiagnosticableTreeMixin {
  const _$ImageVersionsImpl(
      {required this.large,
      required this.medium,
      required this.small,
      required this.micro})
      : super._();

  factory _$ImageVersionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImageVersionsImplFromJson(json);

  @override
  final String large;
  @override
  final String medium;
  @override
  final String small;
  @override
  final String micro;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ImageVersions(large: $large, medium: $medium, small: $small, micro: $micro)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ImageVersions'))
      ..add(DiagnosticsProperty('large', large))
      ..add(DiagnosticsProperty('medium', medium))
      ..add(DiagnosticsProperty('small', small))
      ..add(DiagnosticsProperty('micro', micro));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageVersionsImpl &&
            (identical(other.large, large) || other.large == large) &&
            (identical(other.medium, medium) || other.medium == medium) &&
            (identical(other.small, small) || other.small == small) &&
            (identical(other.micro, micro) || other.micro == micro));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, large, medium, small, micro);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageVersionsImplCopyWith<_$ImageVersionsImpl> get copyWith =>
      __$$ImageVersionsImplCopyWithImpl<_$ImageVersionsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImageVersionsImplToJson(
      this,
    );
  }
}

abstract class _ImageVersions extends ImageVersions {
  const factory _ImageVersions(
      {required final String large,
      required final String medium,
      required final String small,
      required final String micro}) = _$ImageVersionsImpl;
  const _ImageVersions._() : super._();

  factory _ImageVersions.fromJson(Map<String, dynamic> json) =
      _$ImageVersionsImpl.fromJson;

  @override
  String get large;
  @override
  String get medium;
  @override
  String get small;
  @override
  String get micro;
  @override
  @JsonKey(ignore: true)
  _$$ImageVersionsImplCopyWith<_$ImageVersionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
