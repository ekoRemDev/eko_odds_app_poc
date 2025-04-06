// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chain.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Chain _$ChainFromJson(Map<String, dynamic> json) {
  return _Chain.fromJson(json);
}

/// @nodoc
mixin _$Chain {
  String? get chain => throw _privateConstructorUsedError;
  double? get balance => throw _privateConstructorUsedError;
  double? get priceInUsd => throw _privateConstructorUsedError;
  double? get change => throw _privateConstructorUsedError;

  /// Serializes this Chain to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Chain
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChainCopyWith<Chain> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChainCopyWith<$Res> {
  factory $ChainCopyWith(Chain value, $Res Function(Chain) then) =
      _$ChainCopyWithImpl<$Res, Chain>;
  @useResult
  $Res call(
      {String? chain, double? balance, double? priceInUsd, double? change});
}

/// @nodoc
class _$ChainCopyWithImpl<$Res, $Val extends Chain>
    implements $ChainCopyWith<$Res> {
  _$ChainCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Chain
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chain = freezed,
    Object? balance = freezed,
    Object? priceInUsd = freezed,
    Object? change = freezed,
  }) {
    return _then(_value.copyWith(
      chain: freezed == chain
          ? _value.chain
          : chain // ignore: cast_nullable_to_non_nullable
              as String?,
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double?,
      priceInUsd: freezed == priceInUsd
          ? _value.priceInUsd
          : priceInUsd // ignore: cast_nullable_to_non_nullable
              as double?,
      change: freezed == change
          ? _value.change
          : change // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChainImplCopyWith<$Res> implements $ChainCopyWith<$Res> {
  factory _$$ChainImplCopyWith(
          _$ChainImpl value, $Res Function(_$ChainImpl) then) =
      __$$ChainImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? chain, double? balance, double? priceInUsd, double? change});
}

/// @nodoc
class __$$ChainImplCopyWithImpl<$Res>
    extends _$ChainCopyWithImpl<$Res, _$ChainImpl>
    implements _$$ChainImplCopyWith<$Res> {
  __$$ChainImplCopyWithImpl(
      _$ChainImpl _value, $Res Function(_$ChainImpl) _then)
      : super(_value, _then);

  /// Create a copy of Chain
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chain = freezed,
    Object? balance = freezed,
    Object? priceInUsd = freezed,
    Object? change = freezed,
  }) {
    return _then(_$ChainImpl(
      chain: freezed == chain
          ? _value.chain
          : chain // ignore: cast_nullable_to_non_nullable
              as String?,
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double?,
      priceInUsd: freezed == priceInUsd
          ? _value.priceInUsd
          : priceInUsd // ignore: cast_nullable_to_non_nullable
              as double?,
      change: freezed == change
          ? _value.change
          : change // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChainImpl implements _Chain {
  const _$ChainImpl(
      {required this.chain,
      required this.balance,
      required this.priceInUsd,
      required this.change});

  factory _$ChainImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChainImplFromJson(json);

  @override
  final String? chain;
  @override
  final double? balance;
  @override
  final double? priceInUsd;
  @override
  final double? change;

  @override
  String toString() {
    return 'Chain(chain: $chain, balance: $balance, priceInUsd: $priceInUsd, change: $change)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChainImpl &&
            (identical(other.chain, chain) || other.chain == chain) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.priceInUsd, priceInUsd) ||
                other.priceInUsd == priceInUsd) &&
            (identical(other.change, change) || other.change == change));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, chain, balance, priceInUsd, change);

  /// Create a copy of Chain
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChainImplCopyWith<_$ChainImpl> get copyWith =>
      __$$ChainImplCopyWithImpl<_$ChainImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChainImplToJson(
      this,
    );
  }
}

abstract class _Chain implements Chain {
  const factory _Chain(
      {required final String? chain,
      required final double? balance,
      required final double? priceInUsd,
      required final double? change}) = _$ChainImpl;

  factory _Chain.fromJson(Map<String, dynamic> json) = _$ChainImpl.fromJson;

  @override
  String? get chain;
  @override
  double? get balance;
  @override
  double? get priceInUsd;
  @override
  double? get change;

  /// Create a copy of Chain
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChainImplCopyWith<_$ChainImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
