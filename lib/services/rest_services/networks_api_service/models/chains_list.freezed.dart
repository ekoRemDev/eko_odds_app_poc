// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chains_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChainsList _$ChainsListFromJson(Map<String, dynamic> json) {
  return _ChainsList.fromJson(json);
}

/// @nodoc
mixin _$ChainsList {
  List<Chain> get chains => throw _privateConstructorUsedError;

  /// Serializes this ChainsList to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChainsList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChainsListCopyWith<ChainsList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChainsListCopyWith<$Res> {
  factory $ChainsListCopyWith(
          ChainsList value, $Res Function(ChainsList) then) =
      _$ChainsListCopyWithImpl<$Res, ChainsList>;
  @useResult
  $Res call({List<Chain> chains});
}

/// @nodoc
class _$ChainsListCopyWithImpl<$Res, $Val extends ChainsList>
    implements $ChainsListCopyWith<$Res> {
  _$ChainsListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChainsList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chains = null,
  }) {
    return _then(_value.copyWith(
      chains: null == chains
          ? _value.chains
          : chains // ignore: cast_nullable_to_non_nullable
              as List<Chain>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChainsListImplCopyWith<$Res>
    implements $ChainsListCopyWith<$Res> {
  factory _$$ChainsListImplCopyWith(
          _$ChainsListImpl value, $Res Function(_$ChainsListImpl) then) =
      __$$ChainsListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Chain> chains});
}

/// @nodoc
class __$$ChainsListImplCopyWithImpl<$Res>
    extends _$ChainsListCopyWithImpl<$Res, _$ChainsListImpl>
    implements _$$ChainsListImplCopyWith<$Res> {
  __$$ChainsListImplCopyWithImpl(
      _$ChainsListImpl _value, $Res Function(_$ChainsListImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChainsList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chains = null,
  }) {
    return _then(_$ChainsListImpl(
      chains: null == chains
          ? _value._chains
          : chains // ignore: cast_nullable_to_non_nullable
              as List<Chain>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChainsListImpl implements _ChainsList {
  const _$ChainsListImpl({required final List<Chain> chains})
      : _chains = chains;

  factory _$ChainsListImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChainsListImplFromJson(json);

  final List<Chain> _chains;
  @override
  List<Chain> get chains {
    if (_chains is EqualUnmodifiableListView) return _chains;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chains);
  }

  @override
  String toString() {
    return 'ChainsList(chains: $chains)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChainsListImpl &&
            const DeepCollectionEquality().equals(other._chains, _chains));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_chains));

  /// Create a copy of ChainsList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChainsListImplCopyWith<_$ChainsListImpl> get copyWith =>
      __$$ChainsListImplCopyWithImpl<_$ChainsListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChainsListImplToJson(
      this,
    );
  }
}

abstract class _ChainsList implements ChainsList {
  const factory _ChainsList({required final List<Chain> chains}) =
      _$ChainsListImpl;

  factory _ChainsList.fromJson(Map<String, dynamic> json) =
      _$ChainsListImpl.fromJson;

  @override
  List<Chain> get chains;

  /// Create a copy of ChainsList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChainsListImplCopyWith<_$ChainsListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
