// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'git_hub_repo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GitHubRepo _$GitHubRepoFromJson(Map<String, dynamic> json) {
  return _GitHubRepoImpl.fromJson(json);
}

/// @nodoc
mixin _$GitHubRepo {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  @JsonKey(name: "stargazers_count")
  int get stargazersCount => throw _privateConstructorUsedError;
  @JsonKey(name: "watchers_count")
  int get watchersCount => throw _privateConstructorUsedError;
  GitHubRepoOwner get owner => throw _privateConstructorUsedError;

  /// Serializes this GitHubRepo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GitHubRepo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GitHubRepoCopyWith<GitHubRepo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GitHubRepoCopyWith<$Res> {
  factory $GitHubRepoCopyWith(
          GitHubRepo value, $Res Function(GitHubRepo) then) =
      _$GitHubRepoCopyWithImpl<$Res, GitHubRepo>;
  @useResult
  $Res call(
      {int id,
      String name,
      String description,
      String url,
      @JsonKey(name: "stargazers_count") int stargazersCount,
      @JsonKey(name: "watchers_count") int watchersCount,
      GitHubRepoOwner owner});

  $GitHubRepoOwnerCopyWith<$Res> get owner;
}

/// @nodoc
class _$GitHubRepoCopyWithImpl<$Res, $Val extends GitHubRepo>
    implements $GitHubRepoCopyWith<$Res> {
  _$GitHubRepoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GitHubRepo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? url = null,
    Object? stargazersCount = null,
    Object? watchersCount = null,
    Object? owner = null,
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
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      stargazersCount: null == stargazersCount
          ? _value.stargazersCount
          : stargazersCount // ignore: cast_nullable_to_non_nullable
              as int,
      watchersCount: null == watchersCount
          ? _value.watchersCount
          : watchersCount // ignore: cast_nullable_to_non_nullable
              as int,
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as GitHubRepoOwner,
    ) as $Val);
  }

  /// Create a copy of GitHubRepo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GitHubRepoOwnerCopyWith<$Res> get owner {
    return $GitHubRepoOwnerCopyWith<$Res>(_value.owner, (value) {
      return _then(_value.copyWith(owner: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GitHubRepoImplImplCopyWith<$Res>
    implements $GitHubRepoCopyWith<$Res> {
  factory _$$GitHubRepoImplImplCopyWith(_$GitHubRepoImplImpl value,
          $Res Function(_$GitHubRepoImplImpl) then) =
      __$$GitHubRepoImplImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String description,
      String url,
      @JsonKey(name: "stargazers_count") int stargazersCount,
      @JsonKey(name: "watchers_count") int watchersCount,
      GitHubRepoOwner owner});

  @override
  $GitHubRepoOwnerCopyWith<$Res> get owner;
}

/// @nodoc
class __$$GitHubRepoImplImplCopyWithImpl<$Res>
    extends _$GitHubRepoCopyWithImpl<$Res, _$GitHubRepoImplImpl>
    implements _$$GitHubRepoImplImplCopyWith<$Res> {
  __$$GitHubRepoImplImplCopyWithImpl(
      _$GitHubRepoImplImpl _value, $Res Function(_$GitHubRepoImplImpl) _then)
      : super(_value, _then);

  /// Create a copy of GitHubRepo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? url = null,
    Object? stargazersCount = null,
    Object? watchersCount = null,
    Object? owner = null,
  }) {
    return _then(_$GitHubRepoImplImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      stargazersCount: null == stargazersCount
          ? _value.stargazersCount
          : stargazersCount // ignore: cast_nullable_to_non_nullable
              as int,
      watchersCount: null == watchersCount
          ? _value.watchersCount
          : watchersCount // ignore: cast_nullable_to_non_nullable
              as int,
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as GitHubRepoOwner,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GitHubRepoImplImpl implements _GitHubRepoImpl {
  const _$GitHubRepoImplImpl(
      {this.id = 0,
      this.name = '',
      this.description = '',
      this.url = '',
      @JsonKey(name: "stargazers_count") this.stargazersCount = 0,
      @JsonKey(name: "watchers_count") this.watchersCount = 0,
      this.owner = const GitHubRepoOwner()});

  factory _$GitHubRepoImplImpl.fromJson(Map<String, dynamic> json) =>
      _$$GitHubRepoImplImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String url;
  @override
  @JsonKey(name: "stargazers_count")
  final int stargazersCount;
  @override
  @JsonKey(name: "watchers_count")
  final int watchersCount;
  @override
  @JsonKey()
  final GitHubRepoOwner owner;

  @override
  String toString() {
    return 'GitHubRepo(id: $id, name: $name, description: $description, url: $url, stargazersCount: $stargazersCount, watchersCount: $watchersCount, owner: $owner)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GitHubRepoImplImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.stargazersCount, stargazersCount) ||
                other.stargazersCount == stargazersCount) &&
            (identical(other.watchersCount, watchersCount) ||
                other.watchersCount == watchersCount) &&
            (identical(other.owner, owner) || other.owner == owner));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description, url,
      stargazersCount, watchersCount, owner);

  /// Create a copy of GitHubRepo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GitHubRepoImplImplCopyWith<_$GitHubRepoImplImpl> get copyWith =>
      __$$GitHubRepoImplImplCopyWithImpl<_$GitHubRepoImplImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GitHubRepoImplImplToJson(
      this,
    );
  }
}

abstract class _GitHubRepoImpl implements GitHubRepo {
  const factory _GitHubRepoImpl(
      {final int id,
      final String name,
      final String description,
      final String url,
      @JsonKey(name: "stargazers_count") final int stargazersCount,
      @JsonKey(name: "watchers_count") final int watchersCount,
      final GitHubRepoOwner owner}) = _$GitHubRepoImplImpl;

  factory _GitHubRepoImpl.fromJson(Map<String, dynamic> json) =
      _$GitHubRepoImplImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get url;
  @override
  @JsonKey(name: "stargazers_count")
  int get stargazersCount;
  @override
  @JsonKey(name: "watchers_count")
  int get watchersCount;
  @override
  GitHubRepoOwner get owner;

  /// Create a copy of GitHubRepo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GitHubRepoImplImplCopyWith<_$GitHubRepoImplImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GitHubRepoOwner _$GitHubRepoOwnerFromJson(Map<String, dynamic> json) {
  return _GitHubRepoOwner.fromJson(json);
}

/// @nodoc
mixin _$GitHubRepoOwner {
  String get login => throw _privateConstructorUsedError;
  @JsonKey(name: "avatar_url")
  String get avatarUrl => throw _privateConstructorUsedError;

  /// Serializes this GitHubRepoOwner to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GitHubRepoOwner
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GitHubRepoOwnerCopyWith<GitHubRepoOwner> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GitHubRepoOwnerCopyWith<$Res> {
  factory $GitHubRepoOwnerCopyWith(
          GitHubRepoOwner value, $Res Function(GitHubRepoOwner) then) =
      _$GitHubRepoOwnerCopyWithImpl<$Res, GitHubRepoOwner>;
  @useResult
  $Res call({String login, @JsonKey(name: "avatar_url") String avatarUrl});
}

/// @nodoc
class _$GitHubRepoOwnerCopyWithImpl<$Res, $Val extends GitHubRepoOwner>
    implements $GitHubRepoOwnerCopyWith<$Res> {
  _$GitHubRepoOwnerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GitHubRepoOwner
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? login = null,
    Object? avatarUrl = null,
  }) {
    return _then(_value.copyWith(
      login: null == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GitHubRepoOwnerImplCopyWith<$Res>
    implements $GitHubRepoOwnerCopyWith<$Res> {
  factory _$$GitHubRepoOwnerImplCopyWith(_$GitHubRepoOwnerImpl value,
          $Res Function(_$GitHubRepoOwnerImpl) then) =
      __$$GitHubRepoOwnerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String login, @JsonKey(name: "avatar_url") String avatarUrl});
}

/// @nodoc
class __$$GitHubRepoOwnerImplCopyWithImpl<$Res>
    extends _$GitHubRepoOwnerCopyWithImpl<$Res, _$GitHubRepoOwnerImpl>
    implements _$$GitHubRepoOwnerImplCopyWith<$Res> {
  __$$GitHubRepoOwnerImplCopyWithImpl(
      _$GitHubRepoOwnerImpl _value, $Res Function(_$GitHubRepoOwnerImpl) _then)
      : super(_value, _then);

  /// Create a copy of GitHubRepoOwner
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? login = null,
    Object? avatarUrl = null,
  }) {
    return _then(_$GitHubRepoOwnerImpl(
      login: null == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GitHubRepoOwnerImpl implements _GitHubRepoOwner {
  const _$GitHubRepoOwnerImpl(
      {this.login = '', @JsonKey(name: "avatar_url") this.avatarUrl = ''});

  factory _$GitHubRepoOwnerImpl.fromJson(Map<String, dynamic> json) =>
      _$$GitHubRepoOwnerImplFromJson(json);

  @override
  @JsonKey()
  final String login;
  @override
  @JsonKey(name: "avatar_url")
  final String avatarUrl;

  @override
  String toString() {
    return 'GitHubRepoOwner(login: $login, avatarUrl: $avatarUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GitHubRepoOwnerImpl &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, login, avatarUrl);

  /// Create a copy of GitHubRepoOwner
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GitHubRepoOwnerImplCopyWith<_$GitHubRepoOwnerImpl> get copyWith =>
      __$$GitHubRepoOwnerImplCopyWithImpl<_$GitHubRepoOwnerImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GitHubRepoOwnerImplToJson(
      this,
    );
  }
}

abstract class _GitHubRepoOwner implements GitHubRepoOwner {
  const factory _GitHubRepoOwner(
          {final String login,
          @JsonKey(name: "avatar_url") final String avatarUrl}) =
      _$GitHubRepoOwnerImpl;

  factory _GitHubRepoOwner.fromJson(Map<String, dynamic> json) =
      _$GitHubRepoOwnerImpl.fromJson;

  @override
  String get login;
  @override
  @JsonKey(name: "avatar_url")
  String get avatarUrl;

  /// Create a copy of GitHubRepoOwner
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GitHubRepoOwnerImplCopyWith<_$GitHubRepoOwnerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
