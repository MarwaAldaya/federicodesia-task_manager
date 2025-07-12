import 'package:bloc_arch/core/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? label;
  final String? hintText;
  final bool isPassword;
  final bool isPhone;
  final String? countryCode;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final int maxLines;
  final TextStyle? textStyle;
  final void Function()? onEditingComplete;
  final void Function(String)? onFieldSubmitted;

  const CustomTextField({
    super.key,
    required this.controller,
    this.label,
    this.hintText,
    this.isPassword = false,
    this.isPhone = false,
    this.countryCode,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.maxLines = 1,
    this.textStyle,
    this.onEditingComplete,
    this.onFieldSubmitted,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword ? _obscureText : false,
      keyboardType: widget.keyboardType ??
          (widget.isPhone ? TextInputType.phone : TextInputType.text),
      validator: widget.validator,
      onChanged: widget.onChanged,
      maxLines: widget.maxLines,
      style: widget.textStyle ?? context.textStyles.titleMedium,
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hintText,
        prefixIcon: widget.isPhone && widget.countryCode != null
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  widget.countryCode!,
                  style: TextStyle(fontSize: 16.sp),
                ),
              )
            : null,
        prefixIconConstraints: widget.isPhone && widget.countryCode != null
            ? const BoxConstraints(minWidth: 0, minHeight: 0)
            : null,
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () => setState(() {
                  _obscureText = !_obscureText;
                }),
              )
            : null,
        border: const OutlineInputBorder(),
      ),
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
      onEditingComplete: widget.onEditingComplete,
      onFieldSubmitted: widget.onFieldSubmitted,
    );
  }
}
