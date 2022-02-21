// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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

  _GameState call({List<String> wordList = const [], List<List<ui.Image>> answerList = const []}) {
    return _GameState(
      wordList: wordList,
      answerList: answerList,
    );
  }
}

/// @nodoc
const $GameState = _$GameStateTearOff();

/// @nodoc
mixin _$GameState {
  List<String> get wordList => throw _privateConstructorUsedError;
  List<List<ui.Image>> get answerList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GameStateCopyWith<GameState> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameStateCopyWith<$Res> {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) then) = _$GameStateCopyWithImpl<$Res>;
  $Res call({List<String> wordList, List<List<ui.Image>> answerList});
}

/// @nodoc
class _$GameStateCopyWithImpl<$Res> implements $GameStateCopyWith<$Res> {
  _$GameStateCopyWithImpl(this._value, this._then);

  final GameState _value;
  // ignore: unused_field
  final $Res Function(GameState) _then;

  @override
  $Res call({
    Object? wordList = freezed,
    Object? answerList = freezed,
  }) {
    return _then(_value.copyWith(
      wordList: wordList == freezed
          ? _value.wordList
          : wordList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      answerList: answerList == freezed
          ? _value.answerList
          : answerList // ignore: cast_nullable_to_non_nullable
              as List<List<ui.Image>>,
    ));
  }
}

/// @nodoc
abstract class _$GameStateCopyWith<$Res> implements $GameStateCopyWith<$Res> {
  factory _$GameStateCopyWith(_GameState value, $Res Function(_GameState) then) = __$GameStateCopyWithImpl<$Res>;
  @override
  $Res call({List<String> wordList, List<List<ui.Image>> answerList});
}

/// @nodoc
class __$GameStateCopyWithImpl<$Res> extends _$GameStateCopyWithImpl<$Res> implements _$GameStateCopyWith<$Res> {
  __$GameStateCopyWithImpl(_GameState _value, $Res Function(_GameState) _then) : super(_value, (v) => _then(v as _GameState));

  @override
  _GameState get _value => super._value as _GameState;

  @override
  $Res call({
    Object? wordList = freezed,
    Object? answerList = freezed,
  }) {
    return _then(_GameState(
      wordList: wordList == freezed
          ? _value.wordList
          : wordList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      answerList: answerList == freezed
          ? _value.answerList
          : answerList // ignore: cast_nullable_to_non_nullable
              as List<List<ui.Image>>,
    ));
  }
}

/// @nodoc

class _$_GameState implements _GameState {
  const _$_GameState({this.wordList = const [], this.answerList = const []});

  @JsonKey()
  @override
  final List<String> wordList;
  @JsonKey()
  @override
  final List<List<ui.Image>> answerList;

  @override
  String toString() {
    return 'GameState(wordList: $wordList, answerList: $answerList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GameState &&
            const DeepCollectionEquality().equals(other.wordList, wordList) &&
            const DeepCollectionEquality().equals(other.answerList, answerList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(wordList), const DeepCollectionEquality().hash(answerList));

  @JsonKey(ignore: true)
  @override
  _$GameStateCopyWith<_GameState> get copyWith => __$GameStateCopyWithImpl<_GameState>(this, _$identity);
}

abstract class _GameState implements GameState {
  const factory _GameState({List<String> wordList, List<List<ui.Image>> answerList}) = _$_GameState;

  @override
  List<String> get wordList;
  @override
  List<List<ui.Image>> get answerList;
  @override
  @JsonKey(ignore: true)
  _$GameStateCopyWith<_GameState> get copyWith => throw _privateConstructorUsedError;
}
