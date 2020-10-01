import 'package:flutter/material.dart';

Widget editTextBox(TextEditingController controller, TextStyle textStyle) {
  return EditableText(
    maxLines: null,
    minLines: null,
    expands: true,
    controller: controller,
    focusNode: FocusNode(canRequestFocus: true),
    style: textStyle,
    cursorColor: Colors.blue,
    backgroundCursorColor: Colors.amber,
  );
}
