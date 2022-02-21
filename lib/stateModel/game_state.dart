import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_state.freezed.dart';

@freezed
class GameState with _$GameState {
  const factory GameState({@Default([]) List<String> wordList, @Default([]) List<List<ui.Image>> answerList}) = _GameState;
}
