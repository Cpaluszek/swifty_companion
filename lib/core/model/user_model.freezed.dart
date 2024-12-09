// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  int get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get login => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String get lastName => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get kind => throw _privateConstructorUsedError;
  @JsonKey(name: 'displayname')
  String get displayName => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  int get wallet => throw _privateConstructorUsedError;
  @JsonKey(name: 'staff?')
  bool get isStaff => throw _privateConstructorUsedError;
  @JsonKey(name: 'correction_point')
  int get evaluationPoints => throw _privateConstructorUsedError;
  ImageModel get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'pool_month')
  String get poolMonth => throw _privateConstructorUsedError;
  @JsonKey(name: 'pool_year')
  String get poolYear => throw _privateConstructorUsedError;
  @JsonKey(name: 'alumni?')
  bool get isAlumni => throw _privateConstructorUsedError;
  @JsonKey(name: 'active?')
  bool get isActive => throw _privateConstructorUsedError;
  List<CampusModel> get campus => throw _privateConstructorUsedError;
  @JsonKey(name: 'cursus_users')
  List<CursusUsersModel> get cursusUsers => throw _privateConstructorUsedError;
  @JsonKey(name: 'projects_users')
  List<ProjectUsersModel> get projectUsers =>
      throw _privateConstructorUsedError;
  List<AchievementModel> get achievements => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {int id,
      String email,
      String login,
      @JsonKey(name: 'first_name') String firstName,
      @JsonKey(name: 'last_name') String lastName,
      String url,
      String phone,
      String kind,
      @JsonKey(name: 'displayname') String displayName,
      String? location,
      int wallet,
      @JsonKey(name: 'staff?') bool isStaff,
      @JsonKey(name: 'correction_point') int evaluationPoints,
      ImageModel image,
      @JsonKey(name: 'pool_month') String poolMonth,
      @JsonKey(name: 'pool_year') String poolYear,
      @JsonKey(name: 'alumni?') bool isAlumni,
      @JsonKey(name: 'active?') bool isActive,
      List<CampusModel> campus,
      @JsonKey(name: 'cursus_users') List<CursusUsersModel> cursusUsers,
      @JsonKey(name: 'projects_users') List<ProjectUsersModel> projectUsers,
      List<AchievementModel> achievements});

  $ImageModelCopyWith<$Res> get image;
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? login = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? url = null,
    Object? phone = null,
    Object? kind = null,
    Object? displayName = null,
    Object? location = freezed,
    Object? wallet = null,
    Object? isStaff = null,
    Object? evaluationPoints = null,
    Object? image = null,
    Object? poolMonth = null,
    Object? poolYear = null,
    Object? isAlumni = null,
    Object? isActive = null,
    Object? campus = null,
    Object? cursusUsers = null,
    Object? projectUsers = null,
    Object? achievements = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      login: null == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      kind: null == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      wallet: null == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as int,
      isStaff: null == isStaff
          ? _value.isStaff
          : isStaff // ignore: cast_nullable_to_non_nullable
              as bool,
      evaluationPoints: null == evaluationPoints
          ? _value.evaluationPoints
          : evaluationPoints // ignore: cast_nullable_to_non_nullable
              as int,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as ImageModel,
      poolMonth: null == poolMonth
          ? _value.poolMonth
          : poolMonth // ignore: cast_nullable_to_non_nullable
              as String,
      poolYear: null == poolYear
          ? _value.poolYear
          : poolYear // ignore: cast_nullable_to_non_nullable
              as String,
      isAlumni: null == isAlumni
          ? _value.isAlumni
          : isAlumni // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      campus: null == campus
          ? _value.campus
          : campus // ignore: cast_nullable_to_non_nullable
              as List<CampusModel>,
      cursusUsers: null == cursusUsers
          ? _value.cursusUsers
          : cursusUsers // ignore: cast_nullable_to_non_nullable
              as List<CursusUsersModel>,
      projectUsers: null == projectUsers
          ? _value.projectUsers
          : projectUsers // ignore: cast_nullable_to_non_nullable
              as List<ProjectUsersModel>,
      achievements: null == achievements
          ? _value.achievements
          : achievements // ignore: cast_nullable_to_non_nullable
              as List<AchievementModel>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageModelCopyWith<$Res> get image {
    return $ImageModelCopyWith<$Res>(_value.image, (value) {
      return _then(_value.copyWith(image: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String email,
      String login,
      @JsonKey(name: 'first_name') String firstName,
      @JsonKey(name: 'last_name') String lastName,
      String url,
      String phone,
      String kind,
      @JsonKey(name: 'displayname') String displayName,
      String? location,
      int wallet,
      @JsonKey(name: 'staff?') bool isStaff,
      @JsonKey(name: 'correction_point') int evaluationPoints,
      ImageModel image,
      @JsonKey(name: 'pool_month') String poolMonth,
      @JsonKey(name: 'pool_year') String poolYear,
      @JsonKey(name: 'alumni?') bool isAlumni,
      @JsonKey(name: 'active?') bool isActive,
      List<CampusModel> campus,
      @JsonKey(name: 'cursus_users') List<CursusUsersModel> cursusUsers,
      @JsonKey(name: 'projects_users') List<ProjectUsersModel> projectUsers,
      List<AchievementModel> achievements});

  @override
  $ImageModelCopyWith<$Res> get image;
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? login = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? url = null,
    Object? phone = null,
    Object? kind = null,
    Object? displayName = null,
    Object? location = freezed,
    Object? wallet = null,
    Object? isStaff = null,
    Object? evaluationPoints = null,
    Object? image = null,
    Object? poolMonth = null,
    Object? poolYear = null,
    Object? isAlumni = null,
    Object? isActive = null,
    Object? campus = null,
    Object? cursusUsers = null,
    Object? projectUsers = null,
    Object? achievements = null,
  }) {
    return _then(_$UserModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      login: null == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      kind: null == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      wallet: null == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as int,
      isStaff: null == isStaff
          ? _value.isStaff
          : isStaff // ignore: cast_nullable_to_non_nullable
              as bool,
      evaluationPoints: null == evaluationPoints
          ? _value.evaluationPoints
          : evaluationPoints // ignore: cast_nullable_to_non_nullable
              as int,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as ImageModel,
      poolMonth: null == poolMonth
          ? _value.poolMonth
          : poolMonth // ignore: cast_nullable_to_non_nullable
              as String,
      poolYear: null == poolYear
          ? _value.poolYear
          : poolYear // ignore: cast_nullable_to_non_nullable
              as String,
      isAlumni: null == isAlumni
          ? _value.isAlumni
          : isAlumni // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      campus: null == campus
          ? _value._campus
          : campus // ignore: cast_nullable_to_non_nullable
              as List<CampusModel>,
      cursusUsers: null == cursusUsers
          ? _value._cursusUsers
          : cursusUsers // ignore: cast_nullable_to_non_nullable
              as List<CursusUsersModel>,
      projectUsers: null == projectUsers
          ? _value._projectUsers
          : projectUsers // ignore: cast_nullable_to_non_nullable
              as List<ProjectUsersModel>,
      achievements: null == achievements
          ? _value._achievements
          : achievements // ignore: cast_nullable_to_non_nullable
              as List<AchievementModel>,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$UserModelImpl extends _UserModel with DiagnosticableTreeMixin {
  const _$UserModelImpl(
      {required this.id,
      required this.email,
      required this.login,
      @JsonKey(name: 'first_name') required this.firstName,
      @JsonKey(name: 'last_name') required this.lastName,
      required this.url,
      required this.phone,
      required this.kind,
      @JsonKey(name: 'displayname') required this.displayName,
      required this.location,
      required this.wallet,
      @JsonKey(name: 'staff?') required this.isStaff,
      @JsonKey(name: 'correction_point') required this.evaluationPoints,
      required this.image,
      @JsonKey(name: 'pool_month') required this.poolMonth,
      @JsonKey(name: 'pool_year') required this.poolYear,
      @JsonKey(name: 'alumni?') required this.isAlumni,
      @JsonKey(name: 'active?') required this.isActive,
      required final List<CampusModel> campus,
      @JsonKey(name: 'cursus_users')
      required final List<CursusUsersModel> cursusUsers,
      @JsonKey(name: 'projects_users')
      required final List<ProjectUsersModel> projectUsers,
      required final List<AchievementModel> achievements})
      : _campus = campus,
        _cursusUsers = cursusUsers,
        _projectUsers = projectUsers,
        _achievements = achievements,
        super._();

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  final int id;
  @override
  final String email;
  @override
  final String login;
  @override
  @JsonKey(name: 'first_name')
  final String firstName;
  @override
  @JsonKey(name: 'last_name')
  final String lastName;
  @override
  final String url;
  @override
  final String phone;
  @override
  final String kind;
  @override
  @JsonKey(name: 'displayname')
  final String displayName;
  @override
  final String? location;
  @override
  final int wallet;
  @override
  @JsonKey(name: 'staff?')
  final bool isStaff;
  @override
  @JsonKey(name: 'correction_point')
  final int evaluationPoints;
  @override
  final ImageModel image;
  @override
  @JsonKey(name: 'pool_month')
  final String poolMonth;
  @override
  @JsonKey(name: 'pool_year')
  final String poolYear;
  @override
  @JsonKey(name: 'alumni?')
  final bool isAlumni;
  @override
  @JsonKey(name: 'active?')
  final bool isActive;
  final List<CampusModel> _campus;
  @override
  List<CampusModel> get campus {
    if (_campus is EqualUnmodifiableListView) return _campus;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_campus);
  }

  final List<CursusUsersModel> _cursusUsers;
  @override
  @JsonKey(name: 'cursus_users')
  List<CursusUsersModel> get cursusUsers {
    if (_cursusUsers is EqualUnmodifiableListView) return _cursusUsers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cursusUsers);
  }

  final List<ProjectUsersModel> _projectUsers;
  @override
  @JsonKey(name: 'projects_users')
  List<ProjectUsersModel> get projectUsers {
    if (_projectUsers is EqualUnmodifiableListView) return _projectUsers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_projectUsers);
  }

  final List<AchievementModel> _achievements;
  @override
  List<AchievementModel> get achievements {
    if (_achievements is EqualUnmodifiableListView) return _achievements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_achievements);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserModel(id: $id, email: $email, login: $login, firstName: $firstName, lastName: $lastName, url: $url, phone: $phone, kind: $kind, displayName: $displayName, location: $location, wallet: $wallet, isStaff: $isStaff, evaluationPoints: $evaluationPoints, image: $image, poolMonth: $poolMonth, poolYear: $poolYear, isAlumni: $isAlumni, isActive: $isActive, campus: $campus, cursusUsers: $cursusUsers, projectUsers: $projectUsers, achievements: $achievements)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('login', login))
      ..add(DiagnosticsProperty('firstName', firstName))
      ..add(DiagnosticsProperty('lastName', lastName))
      ..add(DiagnosticsProperty('url', url))
      ..add(DiagnosticsProperty('phone', phone))
      ..add(DiagnosticsProperty('kind', kind))
      ..add(DiagnosticsProperty('displayName', displayName))
      ..add(DiagnosticsProperty('location', location))
      ..add(DiagnosticsProperty('wallet', wallet))
      ..add(DiagnosticsProperty('isStaff', isStaff))
      ..add(DiagnosticsProperty('evaluationPoints', evaluationPoints))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('poolMonth', poolMonth))
      ..add(DiagnosticsProperty('poolYear', poolYear))
      ..add(DiagnosticsProperty('isAlumni', isAlumni))
      ..add(DiagnosticsProperty('isActive', isActive))
      ..add(DiagnosticsProperty('campus', campus))
      ..add(DiagnosticsProperty('cursusUsers', cursusUsers))
      ..add(DiagnosticsProperty('projectUsers', projectUsers))
      ..add(DiagnosticsProperty('achievements', achievements));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.wallet, wallet) || other.wallet == wallet) &&
            (identical(other.isStaff, isStaff) || other.isStaff == isStaff) &&
            (identical(other.evaluationPoints, evaluationPoints) ||
                other.evaluationPoints == evaluationPoints) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.poolMonth, poolMonth) ||
                other.poolMonth == poolMonth) &&
            (identical(other.poolYear, poolYear) ||
                other.poolYear == poolYear) &&
            (identical(other.isAlumni, isAlumni) ||
                other.isAlumni == isAlumni) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            const DeepCollectionEquality().equals(other._campus, _campus) &&
            const DeepCollectionEquality()
                .equals(other._cursusUsers, _cursusUsers) &&
            const DeepCollectionEquality()
                .equals(other._projectUsers, _projectUsers) &&
            const DeepCollectionEquality()
                .equals(other._achievements, _achievements));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        email,
        login,
        firstName,
        lastName,
        url,
        phone,
        kind,
        displayName,
        location,
        wallet,
        isStaff,
        evaluationPoints,
        image,
        poolMonth,
        poolYear,
        isAlumni,
        isActive,
        const DeepCollectionEquality().hash(_campus),
        const DeepCollectionEquality().hash(_cursusUsers),
        const DeepCollectionEquality().hash(_projectUsers),
        const DeepCollectionEquality().hash(_achievements)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel extends UserModel {
  const factory _UserModel(
      {required final int id,
      required final String email,
      required final String login,
      @JsonKey(name: 'first_name') required final String firstName,
      @JsonKey(name: 'last_name') required final String lastName,
      required final String url,
      required final String phone,
      required final String kind,
      @JsonKey(name: 'displayname') required final String displayName,
      required final String? location,
      required final int wallet,
      @JsonKey(name: 'staff?') required final bool isStaff,
      @JsonKey(name: 'correction_point') required final int evaluationPoints,
      required final ImageModel image,
      @JsonKey(name: 'pool_month') required final String poolMonth,
      @JsonKey(name: 'pool_year') required final String poolYear,
      @JsonKey(name: 'alumni?') required final bool isAlumni,
      @JsonKey(name: 'active?') required final bool isActive,
      required final List<CampusModel> campus,
      @JsonKey(name: 'cursus_users')
      required final List<CursusUsersModel> cursusUsers,
      @JsonKey(name: 'projects_users')
      required final List<ProjectUsersModel> projectUsers,
      required final List<AchievementModel> achievements}) = _$UserModelImpl;
  const _UserModel._() : super._();

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  int get id;
  @override
  String get email;
  @override
  String get login;
  @override
  @JsonKey(name: 'first_name')
  String get firstName;
  @override
  @JsonKey(name: 'last_name')
  String get lastName;
  @override
  String get url;
  @override
  String get phone;
  @override
  String get kind;
  @override
  @JsonKey(name: 'displayname')
  String get displayName;
  @override
  String? get location;
  @override
  int get wallet;
  @override
  @JsonKey(name: 'staff?')
  bool get isStaff;
  @override
  @JsonKey(name: 'correction_point')
  int get evaluationPoints;
  @override
  ImageModel get image;
  @override
  @JsonKey(name: 'pool_month')
  String get poolMonth;
  @override
  @JsonKey(name: 'pool_year')
  String get poolYear;
  @override
  @JsonKey(name: 'alumni?')
  bool get isAlumni;
  @override
  @JsonKey(name: 'active?')
  bool get isActive;
  @override
  List<CampusModel> get campus;
  @override
  @JsonKey(name: 'cursus_users')
  List<CursusUsersModel> get cursusUsers;
  @override
  @JsonKey(name: 'projects_users')
  List<ProjectUsersModel> get projectUsers;
  @override
  List<AchievementModel> get achievements;
  @override
  @JsonKey(ignore: true)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
