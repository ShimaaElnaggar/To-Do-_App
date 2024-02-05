
import 'package:flutter/material.dart';


class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hint, this.maxlines=1,this.onSaved, this.onChanged});

  final String hint;
  final int maxlines;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value){
        if(value?.isEmpty??true){
          return "Field is required";
        }else{
          return null;
        }
      },
      maxLines: maxlines,
      cursorColor: const Color(0xff239B97),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color:  Color(0xff239B97)),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(const Color(0xff239B97)),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: color ?? Colors.white,
          )
        );
  }
}
