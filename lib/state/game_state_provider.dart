import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rururu/api/get_word.dart';
import 'package:rururu/stateModel/game_state.dart';

String corrent = "";

final gameStateProvider = StateNotifierProvider<GameStateNotifer, GameState>((ref) {
  return GameStateNotifer(GameState(wordList: []));
});

class GameStateNotifer extends StateNotifier<GameState> {
  GameStateNotifer(GameState state) : super(state);

  setText(int index, String newText) {
    List<String> newWordList = state.wordList;
    newWordList[index] = newText;
    state = state.copyWith(wordList: newWordList);
  }

  newGame() async {
    state = GameState(wordList: [], answerList: []);

    corrent = await WordAPI().getWord();

    List<String> generateList = List.generate(corrent.length, (index) {
      return "";
    });

    state =  state.copyWith(wordList: generateList);
  }

  match() async {
    List<ui.Image> ansList = [];
    for (var i = 0; i < corrent.length; i++) {
      if (state.wordList[i] == corrent[i]) {
        final pictureRecorder = ui.PictureRecorder();
        final canvas = Canvas(pictureRecorder);
        final paint = Paint()..color = Colors.greenAccent;
        canvas.drawRect(Rect.fromLTWH(0, 0, 50, 50), paint);
        final picture = pictureRecorder.endRecording();
        final image = await picture.toImage(50, 50);
        ansList.add(image);
      } else {
        final inputPictureRecorder = ui.PictureRecorder();
        final inputCanvas = Canvas(inputPictureRecorder);
        final inputTextStyle = TextStyle(color: Colors.black, fontSize: 30, fontFamily: 'NotoSansJavanese');
        final inputTextSpan = TextSpan(text: state.wordList[i], style: inputTextStyle);
        final inputTextPainter = TextPainter(text: inputTextSpan, textDirection: TextDirection.ltr);
        inputTextPainter.layout();
        inputTextPainter.paint(inputCanvas, const Offset(10, 0));
        final inputPicture = inputPictureRecorder.endRecording();
        final inputImage = await inputPicture.toImage(50, 50);

        final correctPictureRecorder = ui.PictureRecorder();
        final correctCanvas = Canvas(correctPictureRecorder);
        final correctTextStyle = TextStyle(color: Colors.amber, fontSize: 30, fontFamily: 'NotoSansJavanese');
        final correctTextSpan = TextSpan(text: corrent[i], style: correctTextStyle);
        final correctTextPainter = TextPainter(text: correctTextSpan, textDirection: TextDirection.ltr);
        correctTextPainter.layout();
        correctTextPainter.paint(correctCanvas, const Offset(10, 0));
        final correctPicture = correctPictureRecorder.endRecording();
        final correctImage = await correctPicture.toImage(50, 50);

        final pictureRecorder = ui.PictureRecorder();
        final canvas = Canvas(pictureRecorder);
        final correctPaint = Paint()..blendMode = ui.BlendMode.src;
        final inputPaint = Paint()..blendMode = ui.BlendMode.srcIn;
        canvas.drawImage(correctImage, const Offset(0, 0), correctPaint);
        canvas.drawImage(inputImage, const Offset(0, 0), inputPaint);
        final picture = pictureRecorder.endRecording();
        final image = await picture.toImage(50, 50);
        ansList.add(image);
      }
    }
    List<List<ui.Image>> newAnserList = [...state.answerList];
    newAnserList.add(ansList);
    state = state.copyWith(answerList: newAnserList);
  }
}
