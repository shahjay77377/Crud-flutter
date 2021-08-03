import 'package:crudscustomer/model/customer_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CustomerDatabase {
  static final CustomerDatabase instance = CustomerDatabase._init();
  static Database? _database;
  CustomerDatabase._init();
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('customer.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = "TEXT NOT NULL";
    final integerType = 'INTEGER NOT NULL';
    final text1type = "TEXT";
    final integer1Type = 'INTEGER';

    await db.execute('''
    CREATE TABLE $tableCustomer(
      ${CustomerFields.customerid} $idType,
      ${CustomerFields.firstName} $textType,
      ${CustomerFields.middleName} $text1type,
      ${CustomerFields.lastName} $text1type,
      ${CustomerFields.village} $textType,
      ${CustomerFields.town} $textType,
      ${CustomerFields.aadharNo} $integerType,
      ${CustomerFields.contacNo} $integerType,
      ${CustomerFields.mobileNo} $integerType,
      ${CustomerFields.ref1Name} $text1type,
      ${CustomerFields.ref1Number} $integer1Type,
      ${CustomerFields.ref2Name} $text1type,
      ${CustomerFields.ref2Number} $integer1Type,
      ${CustomerFields.createdDate} $textType,
      ${CustomerFields.modifiedDate} $textType,
      ${CustomerFields.isObsolate} $integerType
      )
    ''');
  }

  Future<Customer> create(Customer customer) async {
    final db = await instance.database;
    //final json = customer.toJson();
    // final columns =
    //     '${CustomerFields.firstName},${CustomerFields.middleName},${CustomerFields.lastName},${CustomerFields.town},${CustomerFields.village},${CustomerFields.contacNo},${CustomerFields.mobileNo},${CustomerFields.aadharNo},${CustomerFields.ref1Name},${CustomerFields.ref2Name},${CustomerFields.ref1Number},${CustomerFields.ref2Number},${CustomerFields.createdDate},${CustomerFields.modifiedDate},${CustomerFields.isObsolate}';
    // final values =
    //     '${json[CustomerFields.firstName]},${json[CustomerFields.firstName]},${json[CustomerFields.lastName]},${json[CustomerFields.town]},${json[CustomerFields.village]},${json[CustomerFields.contacNo]},${json[CustomerFields.mobileNo]},${json[CustomerFields.aadharNo]},${json[CustomerFields.ref1Name]},${json[CustomerFields.ref1Number]},${json[CustomerFields.ref2Name]},${json[CustomerFields.ref2Number]},${json[CustomerFields.createdDate]},${json[CustomerFields.modifiedDate]},${json[CustomerFields.isObsolate]}       ';
    // final id =
    //     await db.rawInsert('Insert into table_name($columns) values($values)');

    final id = await db.insert(tableCustomer, customer.toJson());
    return customer.copy(customerid: id);
  }

  Future<Customer> readCustomer(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      tableCustomer,
      columns: CustomerFields.values,
      where: '${CustomerFields.customerid}=?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return Customer.fromJson(maps.first);
    } else {
      throw Exception('id $id not found');
    }
  }

  Future<List<Customer>> readAllCustmore() async {
    final db = await instance.database;

//    final where = '${CustomerFields.isObsolate}';
    final result = await db
        .rawQuery('SELECT * FROM $tableCustomer WHERE isObsolate = ?', ['0']);

    return result.map((json) => Customer.fromJson(json)).toList();
  }

  Future<int> update(Customer customer) async {
    final db = await instance.database;

    return db.update(
      tableCustomer,
      customer.toJson(),
      where: '${CustomerFields.customerid} = ?',
      whereArgs: [customer.customerid],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
