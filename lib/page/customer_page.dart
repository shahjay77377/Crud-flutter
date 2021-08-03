import 'package:crudscustomer/db/customer_db.dart';
import 'package:crudscustomer/model/customer_model.dart';
import 'package:crudscustomer/page/add_customer_page.dart';
import 'package:crudscustomer/page/customer_Card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CustomerPage extends StatefulWidget {
  const CustomerPage({Key? key}) : super(key: key);

  @override
  _CustomerPageState createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  late List<Customer> custs;
  bool isLoading = false;
  int isObsolate = 0;

  // late Customer customer;

  @override
  void initState() {
    super.initState();

    refreshcust();
  }

  @override
  void dispose() {
    CustomerDatabase.instance.close();

    super.dispose();
  }

  Future refreshcust() async {
    setState(() => isLoading = true);

    this.custs = await CustomerDatabase.instance.readAllCustmore();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Customer"),
        leading: GestureDetector(
          onTap: () {/* Write listener code here */},
          child: Icon(
            Icons.menu, // add custom icons also
          ),
        ),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () async {
                  await Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => AddCustomerPage(
                              refreshcust: refreshcust,
                            )),
                  );
                },
                child: Icon(
                  Icons.add,
                  size: 30.0,
                ),
              )),
        ],
      ),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : custs.isEmpty
                ? Text(
                    'No Notes',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  )
                : buildNotes(),
      ),
    );
  }

  Widget buildNotes() => StaggeredGridView.countBuilder(
        padding: EdgeInsets.all(8),
        itemCount: custs.length,
        staggeredTileBuilder: (index) => StaggeredTile.fit(2),
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        itemBuilder: (context, index) {
          final cust = custs[index];

          return GestureDetector(
            onTap: () async {
              await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AddCustomerPage(id: cust.customerid),
              ));

              refreshcust();
            },
            child: customercard(cust: cust, index: index),
          );
        },
      );
}
