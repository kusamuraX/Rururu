import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rururu/state/game_state_provider.dart';

import 'stateModel/game_state.dart';

///
/// ゲームwidget
///
class GameWidget extends ConsumerWidget {
  final List<GlobalKey<_CustomTextFieldState>> inputKeys = [];

  static Route<Object?> _dialogBuilder(
      BuildContext context, Object? arguments) {
    return DialogRoute<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) =>
          const SimpleDialog(title: Text('PreParing New Game'), children: [
        Center(
          child: CircularProgressIndicator(),
        ),
        const SizedBox(
          height: 20,
        )
      ]),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    GameState gameState = ref.watch(gameStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("試行回数:${gameState.answerList.length}"),
        actions: [
          Container(
            margin: EdgeInsets.all(8),
            child: OutlinedButton(
              onPressed: () async {
                Navigator.of(context).restorablePush(_dialogBuilder);
                inputKeys.forEach((element) {
                  element.currentState?.clearText();
                });
                inputKeys.clear();
                await ref.read(gameStateProvider.notifier).newGame();
                Navigator.of(context).pop();
              },
              child: const Text(
                "NEW",
                style: TextStyle(color: Colors.white),
              ),
              style: OutlinedButton.styleFrom(
                primary: Colors.black,
                side: const BorderSide(color: Colors.white),
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: 80,
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: List.generate(gameState.wordList.length, (index) {
                  inputKeys.add(GlobalKey<_CustomTextFieldState>());
                  return Container(
                    width: 50,
                    height: 50,
                    color: Colors.amber,
                    child: CustomTextField(index, inputKeys[index]),
                  );
                }),
              ),
            ),
            Container(
              height: 40,
              margin: EdgeInsets.all(8),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueAccent,
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: ref.read(gameStateProvider).wordList.length == 0
                    ? null
                    : () => ref.read(gameStateProvider.notifier).match(),
                child: const Text("CHECK!"),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(8),
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(gameState.answerList.length,
                        (answerIndex) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                              gameState.answerList[answerIndex].length,
                              (index) {
                            return Container(
                              width: 50,
                              height: 50,
                              color: Colors.redAccent.shade100,
                              child: CustomPaint(
                                painter: CorrectOrNotPainer(
                                    gameState.answerList[
                                        gameState.answerList.length -
                                            (answerIndex + 1)][index]),
                              ),
                            );
                          }),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///
/// TextField
///
class CustomTextField extends ConsumerStatefulWidget {
  final int index;

  CustomTextField(this.index, Key key) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CustomTextFieldState();
}

class _CustomTextFieldState extends ConsumerState<CustomTextField> {
  late TextEditingController _textController;

  bool _textEnabled = true;

  @override
  void initState() {
    super.initState();
    GameState gameState = ref.read(gameStateProvider);
    _textController =
        TextEditingController(text: gameState.wordList[widget.index]);
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void clearText() {
    _textController.clear();
  }

  void disabled() {
    setState(() {
      _textEnabled = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      showCursor: false,
      controller: _textController,
      maxLength: 1,
      enabled: _textEnabled,
      textAlign: TextAlign.center,
      maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,
      style: TextStyle(fontSize: 18),
      decoration: InputDecoration(counterText: ""),
      onChanged: (newText) =>
          ref.read(gameStateProvider.notifier).setText(widget.index, newText),
    );
  }
}

///
/// 正解不正解表示用
///
class CorrectOrNotPainer extends CustomPainter {
  final ui.Image inputImage;

  CorrectOrNotPainer(this.inputImage);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawImageRect(
      inputImage,
      Rect.fromLTWH(
          0, 0, inputImage.width.toDouble(), inputImage.height.toDouble()),
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint(),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
