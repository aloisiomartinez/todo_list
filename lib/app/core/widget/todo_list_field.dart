import 'package:flutter/material.dart';
import 'package:todo_list/app/core/ui/todo_list_icons.dart';

class TodoListField extends StatelessWidget {
  final String label;
  final IconButton? suffixIconButton;
  final bool obscureText;

  const TodoListField({ 
    Key? key, 
    required this.label,
    this.suffixIconButton,
    this.obscureText = false,
    }) : 
      assert(
        obscureText == true ? suffixIconButton == null : true
      ),
    super(key: key);

   @override
   Widget build(BuildContext context) {
       return TextFormField(
         decoration: InputDecoration(
           labelText: label,
           labelStyle: TextStyle(fontSize: 15, color: Colors.black),
           border: OutlineInputBorder(
             borderRadius: BorderRadius.circular(30)
           ),
           errorBorder: OutlineInputBorder(
             borderRadius: BorderRadius.circular(30),
             borderSide: BorderSide(color: Colors.red)
           ),
           isDense: true,
           suffixIcon: this.suffixIconButton ?? 
            (obscureText == true ? IconButton(
              onPressed: (){},
              icon: Icon(
                TodoListIcons.eye, 
                size: 15,
              ),
            ) : null),
         ),
         obscureText: obscureText,
       );
  }
}