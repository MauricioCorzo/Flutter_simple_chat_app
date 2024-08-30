import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final void Function(String) onValue;
  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(40));

    final inputDecoration = InputDecoration(
      hintText: "Send your message with '?'",
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_outlined),
        onPressed: () {
          final textValue = textController.value.text;

          textController.clear();

          this.onValue(textValue);
        },
      ),
    );

    return TextFormField(
      textAlignVertical: TextAlignVertical.center,
      keyboardType: TextInputType.visiblePassword,

      decoration: inputDecoration,
      controller: textController,
      focusNode: focusNode,
      // onTapOutside: (event) {
      //   focusNode.unfocus();
      // },
      onFieldSubmitted: (value) {
        textController.clear();
        focusNode.requestFocus();
        this.onValue(value);
      },
      onEditingComplete: () {}, // this prevents keyboard from closing
    );
  }
}
