// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'game_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$GameStateTearOff {
  const _$GameStateTearOff();

  Idle idle() {
    return const Idle();
  }

  Start start() {
    return const Start();
  }

  Stop stop() {
    return const Stop();
  }
}

/// @nodoc
const $GameState = _$GameStateTearOff();

/// @nodoc
mixin _$GameState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() start,
    required TResult Function() stop,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? start,
    TResult Function()? stop,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Start value) start,
    required TResult Function(Stop value) stop,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Start value)? start,
    TResult Function(Stop value)? stop,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameStateCopyWith<$Res> {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) then) =
      _$GameStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$GameStateCopyWithImpl<$Res> implements $GameStateCopyWith<$Res> {
  _$GameStateCopyWithImpl(this._value, this._then);

  final GameState _value;
  // ignore: unused_field
  final $Res Function(GameState) _then;
}

/// @nodoc
abstract class $IdleCopyWith<$Res> {
  factory $IdleCopyWith(Idle value, $Res Function(Idle) then) =
      _$IdleCopyWithImpl<$Res>;
}

/// @nodoc
class _$IdleCopyWithImpl<$Res> extends _$GameStateCopyWithImpl<$Res>
    implements $IdleCopyWith<$Res> {
  _$IdleCopyWithImpl(Idle _value, $Res Function(Idle) _then)
      : super(_value, (v) => _then(v as Idle));

  @override
  Idle get _value => super._value as Idle;
}

/// @nodoc

class _$Idle implements Idle {
  const _$Idle();

  @override
  String toString() {
    return 'GameState.idle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Idle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() start,
    required TResult Function() stop,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? start,
    TResult Function()? stop,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Start value) start,
    required TResult Function(Stop value) stop,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Start value)? start,
    TResult Function(Stop value)? stop,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class Idle implements GameState {
  const factory Idle() = _$Idle;
}

/// @nodoc
abstract class $StartCopyWith<$Res> {
  factory $StartCopyWith(Start value, $Res Function(Start) then) =
      _$StartCopyWithImpl<$Res>;
}

/// @nodoc
class _$StartCopyWithImpl<$Res> extends _$GameStateCopyWithImpl<$Res>
    implements $StartCopyWith<$Res> {
  _$StartCopyWithImpl(Start _value, $Res Function(Start) _then)
      : super(_value, (v) => _then(v as Start));

  @override
  Start get _value => super._value as Start;
}

/// @nodoc

class _$Start implements Start {
  const _$Start();

  @override
  String toString() {
    return 'GameState.start()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Start);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() start,
    required TResult Function() stop,
  }) {
    return start();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? start,
    TResult Function()? stop,
    required TResult orElse(),
  }) {
    if (start != null) {
      return start();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Start value) start,
    required TResult Function(Stop value) stop,
  }) {
    return start(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Start value)? start,
    TResult Function(Stop value)? stop,
    required TResult orElse(),
  }) {
    if (start != null) {
      return start(this);
    }
    return orElse();
  }
}

abstract class Start implements GameState {
  const factory Start() = _$Start;
}

/// @nodoc
abstract class $StopCopyWith<$Res> {
  factory $StopCopyWith(Stop value, $Res Function(Stop) then) =
      _$StopCopyWithImpl<$Res>;
}

/// @nodoc
class _$StopCopyWithImpl<$Res> extends _$GameStateCopyWithImpl<$Res>
    implements $StopCopyWith<$Res> {
  _$StopCopyWithImpl(Stop _value, $Res Function(Stop) _then)
      : super(_value, (v) => _then(v as Stop));

  @override
  Stop get _value => super._value as Stop;
}

/// @nodoc

class _$Stop implements Stop {
  const _$Stop();

  @override
  String toString() {
    return 'GameState.stop()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Stop);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() start,
    required TResult Function() stop,
  }) {
    return stop();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? start,
    TResult Function()? stop,
    required TResult orElse(),
  }) {
    if (stop != null) {
      return stop();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Start value) start,
    required TResult Function(Stop value) stop,
  }) {
    return stop(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Start value)? start,
    TResult Function(Stop value)? stop,
    required TResult orElse(),
  }) {
    if (stop != null) {
      return stop(this);
    }
    return orElse();
  }
}

abstract class Stop implements GameState {
  const factory Stop() = _$Stop;
}
