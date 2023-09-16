import 'package:flutter/material.dart';


class TextFormFieldStyling extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  late String? hinText;
  late String? labelText;
  late String? validatorMessage;
  late  int? maxLine;
  late  int? minLine;
  late var textInputAction;
  late var keyboardType;

  TextFormFieldStyling({
    required this.controller,
    this.hinText,
    this.labelText,
    this.validatorMessage,
    this.minLine,
    this.maxLine,
    this.keyboardType,
    this.textInputAction,
  });
  FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
      padding: const EdgeInsets.symmetric(vertical: 10.0,),
      child: TextFormField(

        style: TextStyle(color: Colors.teal),
        focusNode: _focusNode,
        textInputAction: textInputAction,

        maxLines: maxLine,
        minLines: minLine,
        keyboardType: TextInputType.multiline,
        autofocus: false,
        controller: controller,
        decoration: InputDecoration(

          hintStyle:  TextStyle(color: Colors.teal),
          filled: true,
          fillColor: Colors.grey[200], // Background color when not focused
          focusColor: Colors.grey[300],
          hintText: hinText,
          labelText: labelText,
          labelStyle: const TextStyle(fontSize: 18.0,
          color: Colors.teal),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.teal
            ),
          ),
        ),
        validator: (value) =>
        value!.trim().isEmpty ? validatorMessage: null,
        // initialValue: _fullName,
      ),
    );
  }
}
