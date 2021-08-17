final String tableCustomer = 'customerDetails';

class CustomerFields {
  static final List<String> values = [
    customerid,
    firstName,
    middleName,
    lastName,
    village,
    town,
    aadharNo,
    contacNo,
    mobileNo,
    ref1Name,
    ref1Number,
    ref2Name,
    ref2Number,
    createdDate,
    modifiedDate,
    isObsolate,
  ];
  static final String customerid = '_customerid';
  static final String firstName = 'firstName';
  static final String middleName = 'middleName';
  static final String lastName = 'lastName';
  static final String village = 'village';
  static final String town = 'town';
  static final String aadharNo = 'aadharNo';
  static final String contacNo = 'contacNo';
  static final String mobileNo = 'mobileNo';
  static final String ref1Name = 'ref1Name';
  static final String ref1Number = 'ref1Number';
  static final String ref2Name = 'ref2Name';
  static final String ref2Number = 'ref2Number';
  static final String createdDate = 'createdDate';
  static final String modifiedDate = 'modifiedDate';
  static final String isObsolate = 'isObsolate';
}

class Customer {
  final int? customerid;
  final String firstName;
  final String? middleName;
  final String? lastName;
  final String village;
  final String town;
  final int aadharNo;
  final int contacNo;
  final int mobileNo;
  final String? ref1Name;
  final int? ref1Number;
  final String? ref2Name;
  final int? ref2Number;
  final DateTime createdDate;
  final DateTime modifiedDate;
  final int isObsolate;

  const Customer({
    this.customerid,
    required this.firstName,
    this.middleName,
    this.lastName,
    required this.village,
    required this.town,
    required this.aadharNo,
    required this.contacNo,
    required this.mobileNo,
    this.ref1Name,
    this.ref1Number,
    this.ref2Name,
    this.ref2Number,
    required this.createdDate,
    required this.modifiedDate,
    required this.isObsolate,
  });

  Customer copy({
    int? customerid,
    String? firstName,
    String? middleName,
    String? lastName,
    String? village,
    String? town,
    int? aadharNo,
    int? contacNo,
    int? mobileNo,
    String? ref1Name,
    int? ref1Number,
    String? ref2Name,
    int? ref2Number,
    DateTime? createdDate,
    DateTime? modifiedDate,
    int? isObsolate,
  }) =>
      Customer(
          customerid: customerid ?? this.customerid,
          firstName: firstName ?? this.firstName,
          middleName: middleName ?? this.middleName,
          lastName: lastName ?? this.lastName,
          village: village ?? this.village,
          town: town ?? this.village,
          aadharNo: aadharNo ?? this.aadharNo,
          contacNo: contacNo ?? this.aadharNo,
          mobileNo: mobileNo ?? this.mobileNo,
          ref1Name: ref1Name ?? this.ref1Name,
          ref1Number: ref1Number ?? this.ref1Number,
          ref2Name: ref2Name ?? this.ref2Name,
          ref2Number: ref2Number ?? this.ref2Number,
          createdDate: createdDate ?? this.createdDate,
          modifiedDate: modifiedDate ?? this.modifiedDate,
          isObsolate: isObsolate ?? this.isObsolate);

  static Customer fromJson(Map<String, dynamic> json) => Customer(
        customerid: json[CustomerFields.customerid],
        firstName: json[CustomerFields.firstName],
        middleName: json[CustomerFields.middleName],
        lastName: json[CustomerFields.lastName],
        village: json[CustomerFields.village],
        town: json[CustomerFields.town],
        aadharNo: json[CustomerFields.aadharNo],
        contacNo: json[CustomerFields.contacNo],
        mobileNo: json[CustomerFields.mobileNo],
        ref1Name: json[CustomerFields.ref1Name],
        ref1Number: json[CustomerFields.ref1Number],
        ref2Name: json[CustomerFields.ref2Name],
        ref2Number: json[CustomerFields.ref2Number],
        createdDate: DateTime.parse(json[CustomerFields.createdDate]),
        modifiedDate: DateTime.parse(json[CustomerFields.modifiedDate]),
        isObsolate: json[CustomerFields.isObsolate],
      );

  Map<String, Object?> toJson() => {
        CustomerFields.customerid: customerid,
        CustomerFields.firstName: firstName,
        CustomerFields.middleName: middleName,
        CustomerFields.lastName: lastName,
        CustomerFields.village: village,
        CustomerFields.town: town,
        CustomerFields.aadharNo: aadharNo.toString(),
        CustomerFields.contacNo: contacNo,
        CustomerFields.mobileNo: mobileNo,
        CustomerFields.ref1Name: ref1Name,
        CustomerFields.ref1Number: ref1Number,
        CustomerFields.ref2Name: ref2Name,
        CustomerFields.ref2Number: ref2Number,
        CustomerFields.createdDate: createdDate.toIso8601String(),
        CustomerFields.modifiedDate: modifiedDate.toIso8601String(),
        CustomerFields.isObsolate: isObsolate,
      };
}
