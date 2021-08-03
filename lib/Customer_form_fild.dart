import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Customerformfild extends StatelessWidget {
  Customerformfild(
      {required this.name,
      required this.status,
      required this.showname,
      this.maxlength,
      this.inputetype,
      this.filteringTextInputFormatter,
      required this.hint,
      this.onchange,
      });

  final String name;
  final bool status;
  final String showname;
  final int? maxlength;
  final TextInputType? inputetype;
  final List<TextInputFormatter>? filteringTextInputFormatter;
  final String hint;
  final onchange;
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: TextFormField(
        maxLines: 1,
        maxLength: maxlength,
        initialValue: name,
        enabled: status,
        style: TextStyle(fontSize: 20.0),
        keyboardType: inputetype,
        inputFormatters: filteringTextInputFormatter,
        decoration: InputDecoration(
          labelText: showname,
          hintText: hint,
          labelStyle: TextStyle(fontSize: 40.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        //  validator: (name) => name != null && name.isEmpty
        //      ? 'The First Name cannot be empty'
        //      : null,
        onChanged: onchange,
        
      ),
    );
  }
}
