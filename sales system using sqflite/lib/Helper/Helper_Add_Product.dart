// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Add extends StatefulWidget {
  Add(
      {Key? key,
      this.Label,
      this.Hint,
      required this.keyboard,
      required this.onSaved})
      : super(key: key);
  final String? Label;
  final String? Hint;
  final dynamic keyboard;
  final Function(String?) onSaved;

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
          onChanged: widget.onSaved,
          keyboardType: widget.keyboard,
          decoration: InputDecoration(
            labelText: widget.Label,
            hintText: widget.Hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          )),
    );
  }
}
