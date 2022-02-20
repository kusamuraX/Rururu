import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rururu/state/game.dart';

///
/// ゲーム
///
class GameWidget extends ConsumerWidget {
  final countProvider = Provider<int>((ref) {
    return 4;
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.amber,
                    child: TextField(
                      controller: ref.watch(textController_1),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      maxLengthEnforcement:
                          MaxLengthEnforcement.truncateAfterCompositionEnds,
                      style: TextStyle(fontSize: 24),
                      decoration: InputDecoration(counterText: ""),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.amber,
                    child: TextField(
                      controller: ref.watch(textController_1),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      maxLengthEnforcement:
                          MaxLengthEnforcement.truncateAfterCompositionEnds,
                      style: TextStyle(fontSize: 24),
                      decoration: InputDecoration(counterText: ""),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.amber,
                    child: TextField(
                      controller: ref.watch(textController_1),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      maxLengthEnforcement:
                          MaxLengthEnforcement.truncateAfterCompositionEnds,
                      style: TextStyle(fontSize: 24),
                      decoration: InputDecoration(counterText: ""),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.amber,
                    child: TextField(
                      controller: ref.watch(textController_1),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      maxLengthEnforcement:
                          MaxLengthEnforcement.truncateAfterCompositionEnds,
                      style: TextStyle(fontSize: 24),
                      decoration: InputDecoration(counterText: ""),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(8),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueAccent,
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () => {},
                child: const Text("CHECK!"),
              ),
            ),
            Container(
              color: Colors.black12,
              child: Column(
                children: [
                  const Text('test1'),
                  const Text('test2'),
                  const Text('test3'),
                  const Text('test4'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
