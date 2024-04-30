import 'package:flutter/material.dart';
import 'package:jody/constraints.dart';


class CustomInputField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final bool suffixIcon;
  final bool? isDense;
  final bool obscureText;
  final TextEditingController? controller;

  const CustomInputField(
      {Key? key,
      required this.labelText,
      required this.hintText,
      this.suffixIcon = false,
      this.isDense,
      this.obscureText = false,
      this.controller})
      : super(key: key);

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: (widget.obscureText && _obscureText),
      decoration: InputDecoration(
        label: Text(
          widget.labelText,
          style: TextStyle(fontFamily: 'poppins', fontSize: 16),
        ),
        floatingLabelStyle: const TextStyle(color: kPrimaryColor),
        hintStyle: const TextStyle(color: Colors.grey),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Colors.grey, width: 1)),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: kPrimaryColor, width: 2)),
        isDense: (widget.isDense != null) ? widget.isDense : false,
        hintText: widget.hintText,
        suffixIcon: widget.suffixIcon
            ? IconButton(
                icon: Icon(
                  _obscureText
                      ? Icons.remove_red_eye
                      : Icons.visibility_off_outlined,
                  color: Colors.black54,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
        suffixIconConstraints: (widget.isDense != null)
            ? const BoxConstraints(maxHeight: 33)
            : null,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (textValue) {
        if (textValue == null || textValue.isEmpty) {
          return 'required!';
        }
        return null;
      },
      controller: widget.controller,
    );
  }
}
