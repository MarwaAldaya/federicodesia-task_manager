import 'package:flutter/material.dart';

class CustomDropDownMenuItem extends StatelessWidget {
  final Widget child;
  final String value;

  const CustomDropDownMenuItem({super.key, required this.child,required this.value});

  @override
  Widget build(BuildContext context) {
    return buildDropdownMenuItem();
  }

   buildDropdownMenuItem() {
    return
       DropdownMenuItem<String>(
      // alignment: AlignmentDirectional.centerEnd,
      value: value,
      child: child,

    );
  }
}
