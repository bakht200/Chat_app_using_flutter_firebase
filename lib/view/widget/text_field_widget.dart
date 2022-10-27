import 'package:flutter/material.dart';
import '../../constants/app_theme.dart';

class TextFormFieldWidget extends StatefulWidget {
  TextFormFieldWidget({
    required this.textFieldController,
    required this.labelText,
    required this.validator,
    required this.keyboardType,
    required this.iconData,
    required this.obsecure,
  });

  TextEditingController textFieldController;

  String labelText;
  var validator;
  TextInputType keyboardType;
  Widget iconData;
  bool obsecure;

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obsecure,
      validator: widget.validator,
      controller: widget.textFieldController,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        prefixIcon: widget.iconData,
        labelText: widget.labelText,
        labelStyle: TextStyle(color: AppTheme.primaryColor),
        fillColor: Colors.white,
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
