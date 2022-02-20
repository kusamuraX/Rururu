import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final textController_1 = Provider<TextEditingController>((ref) {
  return TextEditingController(text: "");
});