import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  const CustomField(
      {super.key,
      required this.label,
      required this.hint,
      required this.controller});
  final String label;
  final String hint;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 354,
      height: 44,
      child: TextFormField(
        controller:controller,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          floatingLabelStyle: const TextStyle(color: Color(0xffB68B25)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xff252836)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xffB68B25)),
          ),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'you must enter this information';
          }
        },
      ),
    );
  }
}
