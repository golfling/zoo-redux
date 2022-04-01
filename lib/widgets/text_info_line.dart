import 'package:flutter/material.dart';

class TextInfoLine extends StatefulWidget {
  const TextInfoLine({
    Key? key,
    required this.name,
    required this.controller,
  })  : 
        super(key: key);

  final Widget name;
  final TextEditingController controller;

  @override
  State<TextInfoLine> createState() => _TextInfoLineState();
}

class _TextInfoLineState extends State<TextInfoLine> {
  var readOnly = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DefaultTextStyle(
          style: Theme.of(context).textTheme.bodyText1!,
          child: widget.name,
        ),
        InkWell(
          onFocusChange: (value) => setState(() {
            readOnly = true;
          }),
          onDoubleTap: () => setState(() {
            readOnly = false;
          }),
          child: Padding(
            padding: const EdgeInsets.only(left: 7),
            child: TextField(
              readOnly: readOnly,
              decoration: const InputDecoration(border: InputBorder.none),
              controller: widget.controller,
              style: Theme.of(context).textTheme.bodyText2!,
            ),
          ),
        ),
      ],
    );
  }
}
