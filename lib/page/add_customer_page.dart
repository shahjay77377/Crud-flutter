import 'package:crudscustomer/customer_form.dart';
import 'package:crudscustomer/db/customer_db.dart';
import 'package:flutter/material.dart';

import '../model/customer_model.dart';

class AddCustomerPage extends StatefulWidget {
  final Customer? customer;
  final Function? refreshcust;
  final int? id;

  const AddCustomerPage({Key? key, this.customer, this.refreshcust, this.id})
      : super(key: key);

  @override
  _AddCustomerPageState createState() => _AddCustomerPageState();
}

class _AddCustomerPageState extends State<AddCustomerPage> {
  final _formKey = GlobalKey<FormState>();
  late Customer cust;
  bool isLoading = false;
  late List<Customer> custs;

  late String firstname;
  late String middlename;
  late String lastname;
  late String village;
  late String town;
  late int aadharno;
  late int contactno;
  late int mobileno;
  late String ref1name;
  late int ref1contact;
  late String ref2name;
  late int ref2contact;
  late int custid = 0;
  late DateTime crdate;

  @override
  void initState() {
    super.initState();

    if (widget.id != null) {
      custid = widget.id!;
      refreshcust();
    } else {
      firstname = widget.customer?.firstName ?? '';
      middlename = widget.customer?.middleName ?? '';
      lastname = widget.customer?.lastName ?? '';
      village = widget.customer?.village ?? '';
      town = widget.customer?.town ?? '';
      aadharno = widget.customer?.aadharNo ?? 0;
      contactno = widget.customer?.contacNo ?? 0;
      mobileno = widget.customer?.mobileNo ?? 0;
      ref1name = widget.customer?.ref1Name ?? '';
      ref1contact = widget.customer?.ref1Number ?? 0;
      ref2name = widget.customer?.ref2Name ?? '';
      ref2contact = widget.customer?.ref2Number ?? 0;
    }
  }

  Future refreshcust() async {
    setState(() => isLoading = true);

    this.cust = await CustomerDatabase.instance.readCustomer(custid);

    // this.cust = (await CustomerDatabase.instance.readAllcusts()) as Customer;
    firstname = cust.firstName;
    middlename = cust.middleName!;
    lastname = cust.lastName!;
    village = cust.village;
    town = cust.town;
    aadharno = cust.aadharNo;
    contactno = cust.contacNo;
    mobileno = cust.mobileNo;
    ref1name = cust.ref1Name!;
    ref1contact = cust.ref1Number!;
    ref2name = cust.ref2Name!;
    ref2contact = cust.ref2Number!;
    crdate = cust.createdDate;
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [deleteButton(), buildButton()],
      ),
      body: Column(
        children: [
          Text(crdate.toString()),
          Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Customerform(
                firstname: firstname,
                middlename: middlename,
                lastname: lastname,
                village: village,
                town: town,
                aadharno: aadharno,
                contactno: contactno,
                mobileno: mobileno,
                ref1name: ref1name,
                ref1contact: ref1contact,
                ref2name: ref2name,
                ref2contact: ref2contact,
                onchangefirstname: (firstname) =>
                    setState(() => this.firstname = firstname),
                onchangemiddlename: (middlename) =>
                    setState(() => this.middlename = middlename),
                onchangelastname: (lastname) =>
                    setState(() => this.lastname = lastname),
                onchangevillage: (village) =>
                    setState(() => this.village = village),
                onchangetown: (town) => setState(() => this.town = town),
                onchangeaadharno: (aadharno) =>
                    setState(() => this.aadharno = aadharno),
                onchangecontactno: (contactno) =>
                    setState(() => this.contactno = contactno),
                onchangemobileno: (mobileno) =>
                    setState(() => this.mobileno = mobileno),
                onchangeref1name: (ref1name) =>
                    setState(() => this.ref1name = ref1name),
                onchangeref1contact: (ref1contact) =>
                    setState(() => this.ref1contact = ref1contact),
                onchangeref2name: (ref2name) =>
                    setState(() => this.ref2name = ref2name),
                onchangeref2contact: (ref2contact) =>
                    setState(() => this.ref2contact = ref2contact),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButton() {
    final isFormValid = firstname.isNotEmpty;
    String label;
    if (widget.id != null) {
      label = "Update";
    } else {
      label = "Save";
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          primary: isFormValid ? null : Colors.grey.shade700,
        ),
        onPressed: addOrUpdateCustomer,
        child: Text(label),
      ),
    );
  }

  Widget deleteButton() {
    final isFormValid = firstname.isNotEmpty;
    bool isVisible;
    if (widget.id != null) {
      isVisible = true;
    } else {
      isVisible = false;
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 12),
      child: Column(
        children: [
          Visibility(
            visible: isVisible,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                onPrimary: Colors.white,
                primary: isFormValid ? null : Colors.grey.shade700,
              ),
              onPressed: deleteCustomer,
              child: Text("Delete"),
            ),
          ),
        ],
      ),
    );
  }

  void addOrUpdateCustomer() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final isUpdating = widget.id != null;

      if (isUpdating) {
        await updateCustomer();
      } else {
        await addCustomer();
      }

      //   Navigator.of(context).pop();
      //   refreshNotes();
    }
  }

  Future updateCustomer() async {
    final cust = Customer(
        customerid: widget.id,
        firstName: firstname,
        middleName: middlename,
        lastName: lastname,
        village: village,
        town: town,
        aadharNo: aadharno,
        contacNo: contactno,
        mobileNo: mobileno,
        ref1Name: ref1name,
        ref1Number: ref1contact,
        ref2Name: ref2name,
        ref2Number: ref2contact,
        createdDate: crdate,
        modifiedDate: DateTime.now(),
        isObsolate: 0);

    await CustomerDatabase.instance.update(cust);
    Navigator.of(context).pop();
    refeshCustomer();
  }

  Future deleteCustomer() async {
    final deletecust = Customer(
        customerid: widget.id,
        firstName: firstname,
        middleName: middlename,
        lastName: lastname,
        village: village,
        town: town,
        aadharNo: aadharno,
        contacNo: contactno,
        mobileNo: mobileno,
        ref1Name: ref1name,
        ref1Number: ref1contact,
        ref2Name: ref2name,
        ref2Number: ref2contact,
        createdDate: crdate,
        modifiedDate: DateTime.now(),
        isObsolate: 1);

    await CustomerDatabase.instance.update(deletecust);
    Navigator.of(context).pop();
    refeshCustomer();
  }

  Future addCustomer() async {
    final customer = Customer(
        firstName: firstname,
        middleName: middlename,
        lastName: lastname,
        village: village,
        town: town,
        aadharNo: aadharno,
        contacNo: contactno,
        mobileNo: mobileno,
        ref1Name: ref1name,
        ref1Number: ref1contact,
        ref2Name: ref2name,
        ref2Number: ref2contact,
        createdDate: DateTime.now(),
        modifiedDate: DateTime.now(),
        isObsolate: 0);
    print(customer);
    await CustomerDatabase.instance.create(customer);
    Navigator.of(context).pop();
    refeshCustomer();
  }

  Future refeshCustomer() async {
    setState(() => isLoading = true);

    this.custs = await CustomerDatabase.instance.readAllCustmore();

    setState(() => isLoading = false);
  }
}
