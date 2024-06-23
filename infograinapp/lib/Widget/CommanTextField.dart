import 'package:flutter/material.dart';
import '../utility/color.dart';

class CommonTextFormField extends StatelessWidget {
  const CommonTextFormField({
    super.key,
    required this.hintText,
    required this.labelText,
    this.onChanged,
    this.suffix,
    this.readOnly = false,
    this.onTap,
    this.controller,
  });

  final String hintText, labelText;

  final Function(String)? onChanged;
  final Widget? suffix;
  final bool readOnly;
  final VoidCallback? onTap;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: controller,
          onChanged: onChanged,
          readOnly: readOnly,
          onTap: onTap,
          validator: (v) {
            if (v!.isEmpty) {
              return "Please Enter $hintText";
            } else {}
          },
          decoration: InputDecoration(
            border: _buildBorder(),
            enabledBorder: _buildBorder(color: Color(0xff1B263B)),
            focusedBorder: _buildBorder(),
            disabledBorder: _buildBorder(color: Colors.grey),
            errorBorder: _buildBorder(color: Colors.red),
            hintText: hintText,
            contentPadding: EdgeInsets.only(left: 10),
            hintStyle: TextStyle(color: subtestcolor),
            suffixIcon: suffix,
          ),
        ),
      ],
    );
  }

  _buildBorder({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: color ?? Colors.blue.shade700, width: 1.2),
    );
  }
}
