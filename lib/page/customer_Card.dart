import 'package:crudscustomer/model/customer_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: camel_case_types
class customercard extends StatelessWidget {
  const customercard({
    Key? key,
    required this.cust,
    required this.index,
  }) : super(key: key);

  final Customer cust;
  final int index;

  @override
  Widget build(BuildContext context) {
    final time = DateFormat.yMMMd().format(cust.createdDate);

    return Card(
      child: Container(
        constraints: BoxConstraints(minHeight: 10),
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              time,
              //    style: TextStyle(color: Colors.grey.shade700),
            ),
            SizedBox(height: 4),
            Text(
              cust.firstName,
              style: TextStyle(
                //   color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              cust.lastName!,
              style: TextStyle(
                //   color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
