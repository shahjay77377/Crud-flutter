import 'package:crudscustomer/Customer_form_fild.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class Customerform extends StatelessWidget {
  final bool edit = true;

  final String? firstname;
  final String? middlename;
  final String? lastname;
  final String? village;
  final String? town;
  final int? aadharno;
  final int? contactno;
  final int? mobileno;
  final String? ref1name;
  final int? ref1contact;
  final String? ref2name;
  final int? ref2contact;
  final ValueChanged<String> onchangefirstname;
  final ValueChanged<String> onchangemiddlename;
  final ValueChanged<String> onchangelastname;
  final ValueChanged<String> onchangevillage;
  final ValueChanged<String> onchangetown;
  final ValueChanged<int> onchangeaadharno;
  final ValueChanged<int> onchangecontactno;
  final ValueChanged<int> onchangemobileno;
  final ValueChanged<String> onchangeref1name;
  final ValueChanged<int> onchangeref1contact;
  final ValueChanged<String> onchangeref2name;
  final ValueChanged<int> onchangeref2contact;

  const Customerform({
    Key? key,
    this.firstname = "",
    this.middlename = "",
    this.lastname = "",
    this.village = "",
    this.town = "",
    this.aadharno = 0,
    this.contactno = 0,
    this.mobileno = 0,
    this.ref1name = "",
    this.ref1contact = 0,
    this.ref2name = "",
    this.ref2contact = 0,
    required this.onchangefirstname,
    required this.onchangemiddlename,
    required this.onchangelastname,
    required this.onchangevillage,
    required this.onchangetown,
    required this.onchangeaadharno,
    required this.onchangecontactno,
    required this.onchangemobileno,
    required this.onchangeref1name,
    required this.onchangeref1contact,
    required this.onchangeref2name,
    required this.onchangeref2contact,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            children: <Widget>[
              Customerformfild(
                name: '$firstname',
                status: true,
                showname: 'First Name',
                inputetype: TextInputType.name,
                hint: "First Name",
                onchange: onchangefirstname,
              ),
              Customerformfild(
                name: '$middlename',
                status: true,
                showname: 'Middel Name',
                inputetype: TextInputType.name,
                hint: 'Middel Name',
                onchange: onchangemiddlename,
              ),
              Customerformfild(
                name: '$lastname',
                status: true,
                showname: 'Last Name',
                inputetype: TextInputType.name,
                hint: 'Last Name',
                onchange: onchangelastname,
              ),
              Customerformfild(
                name: '$village',
                status: true,
                showname: 'Village',
                hint: 'Village',
                onchange: onchangevillage,
              ),
              Customerformfild(
                name: '$town',
                status: true,
                showname: 'Town',
                hint: 'Town',
                onchange: onchangetown,
              ),
              Customerformfild(
                name: '$aadharno',
                status: true,
                showname: 'Aadhar Number',
                maxlength: 12,
                inputetype: TextInputType.number,
                filteringTextInputFormatter: [
                  FilteringTextInputFormatter.digitsOnly
                ],
                hint: 'Aadhar Number',
                onchange: (aadharno) => onchangeaadharno(aadharno),
              ),
              Customerformfild(
                name: '$contactno',
                status: true,
                showname: 'Contact NO.',
                maxlength: 15,
                inputetype: TextInputType.number,
                filteringTextInputFormatter: [
                  FilteringTextInputFormatter.digitsOnly
                ],
                onchange: (contactno) => onchangecontactno(contactno),
                hint: 'Contact NO',
              ),
              Customerformfild(
                name: '$mobileno',
                status: true,
                showname: 'Mobile No',
                maxlength: 15,
                inputetype: TextInputType.number,
                filteringTextInputFormatter: [
                  FilteringTextInputFormatter.digitsOnly
                ],
                hint: 'Mobile No',
                onchange: (mobileno) => onchangemobileno(mobileno),
              ),
              Customerformfild(
                name: '$ref1name',
                status: true,
                showname: 'Referance Name 1',
                inputetype: TextInputType.name,
                hint: 'Referance Name 1',
                onchange: onchangeref1name,
              ),
              Customerformfild(
                name: '$ref1contact',
                status: true,
                showname: 'Referance Number 1',
                maxlength: 15,
                inputetype: TextInputType.number,
                filteringTextInputFormatter: [
                  FilteringTextInputFormatter.digitsOnly
                ],
                hint: 'Referance Number 1',
                onchange: (ref1contact) => onchangeref1contact(ref1contact),
              ),
              Customerformfild(
                name: '$ref2name',
                status: true,
                showname: 'Referance Name 2',
                maxlength: 12,
                inputetype: TextInputType.name,
                hint: 'Referance Name 2',
                onchange: onchangeref2name,
              ),
              Customerformfild(
                name: '$ref2contact',
                status: true,
                showname: 'Referance Number 2',
                maxlength: 15,
                inputetype: TextInputType.number,
                filteringTextInputFormatter: [
                  FilteringTextInputFormatter.digitsOnly
                ],
                hint: "Referance Number2",
                onchange: (ref2contact) => onchangeref2contact(ref2contact),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Widget buildFirstName() => TextFormField(

//       maxLines: 1,
//       initialValue: firstname,
//       enabled: false,
//       style: TextStyle(
//         color: Colors.white70,
//         fontWeight: FontWeight.bold,
//         fontSize: 24,
//       ),
//       decoration: InputDecoration(
//         border: InputBorder.none,
//         hintText: 'First Name',
//         hintStyle: TextStyle(color: Colors.white70),
//       ),
//       validator: (title) => title != null && title.isEmpty
//           ? 'The First Name cannot be empty'
//           : null,
//       onChanged: onchangefirstname,
//     );
// Widget buildlastName() => TextFormField(
//       maxLines: 1,
//       maxLength: 12,
//       enabled: edit,
//       initialValue: lastname,
//       style: TextStyle(
//         color: Colors.white70,
//         fontWeight: FontWeight.bold,
//         fontSize: 24,
//       ),
//       decoration: InputDecoration(
//         border: InputBorder.none,
//         hintText: 'Last Name',
//         hintStyle: TextStyle(color: Colors.white70),
//       ),
//       // validator: (title) =>
//       //     title != null && title.isEmpty ? 'The First Name cannot be empty' : null,
//       // onChanged: onchangelastname,
//     );
// Widget buildmiddlename() => TextFormField(
//       maxLines: 1,
//       enabled: false,
//       initialValue: middlename,
//       style: TextStyle(
//         color: Colors.white70,
//         fontWeight: FontWeight.bold,
//         fontSize: 24,
//       ),
//       decoration: InputDecoration(
//         border: InputBorder.none,
//         hintText: 'Middel Name',
//         hintStyle: TextStyle(color: Colors.white70),
//       ),
//       // validator: (title) =>
//       //     title != null && title.isEmpty ? 'The First Name cannot be empty' : null,
//       // onChanged: onchangefirstname,
//     );
//}
