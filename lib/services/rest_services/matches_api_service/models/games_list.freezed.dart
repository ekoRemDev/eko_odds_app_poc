// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'games_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GamesList _$GamesListFromJson(Map<String, dynamic> json) {
  return _GamesList.fromJson(json);
}

/// @nodoc
mixin _$GamesList {
  List<Game> get games => throw _privateConstructorUsedError;

  /// Serializes this GamesList to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GamesList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GamesListCopyWith<GamesList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GamesListCopyWith<$Res> {
  factory $GamesListCopyWith(GamesList value, $Res Function(GamesList) then) =
      _$GamesListCopyWithImpl<$Res, GamesList>;
  @useResult
  $Res call({List<Game> games});
}

/// @nodoc
class _$GamesListCopyWithImpl<$Res, $Val extends GamesList>
    implements $GamesListCopyWith<$Res> {
  _$GamesListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GamesList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? games = null,
  }) {
    return _then(_value.copyWith(
      games: null == games
          ? _value.games
          : games // ignore: cast_nullable_to_non_nullable
              as List<Game>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GamesListImplCopyWith<$Res>
    implements $GamesListCopyWith<$Res> {
  factory _$$GamesListImplCopyWith(
          _$GamesListImpl value, $Res Function(_$GamesListImpl) then) =
      __$$GamesListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Game> games});
}

/// @nodoc
class __$$GamesListImplCopyWithImpl<$Res>
    extends _$GamesListCopyWithImpl<$Res, _$GamesListImpl>
    implements _$$GamesListImplCopyWith<$Res> {
  __$$GamesListImplCopyWithImpl(
      _$GamesListImpl _value, $Res Function(_$GamesListImpl) _then)
      : super(_value, _then);

  /// Create a copy of GamesList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? games = null,
  }) {
    return _then(_$GamesListImpl(
      games: null == games
          ? _value._games
          : games // ignore: cast_nullable_to_non_nullable
              as List<Game>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GamesListImpl implements _GamesList {
  const _$GamesListImpl({required final List<Game> games}) : _games = games;

  factory _$GamesListImpl.fromJson(Map<String, dynamic> json) =>
      _$$GamesListImplFromJson(json);

  final List<Game> _games;
  @override
  List<Game> get games {
    if (_games is EqualUnmodifiableListView) return _games;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_games);
  }

  @override
  String toString() {
    return 'GamesList(games: $games)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GamesListImpl &&
            const DeepCollectionEquality().equals(other._games, _games));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_games));

  /// Create a copy of GamesList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GamesListImplCopyWith<_$GamesListImpl> get copyWith =>
      __$$GamesListImplCopyWithImpl<_$GamesListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GamesListImplToJson(
      this,
    );
  }
}

abstract class _GamesList implements GamesList {
  const factory _GamesList({required final List<Game> games}) = _$GamesListImpl;

  factory _GamesList.fromJson(Map<String, dynamic> json) =
      _$GamesListImpl.fromJson;

  @override
  List<Game> get games;

  /// Create a copy of GamesList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GamesListImplCopyWith<_$GamesListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
