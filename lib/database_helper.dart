// ignore_for_file: unnecessary_null_comparison

import 'package:ecommerce/screens/cart_model.dart';
import 'package:ecommerce/screens/products.dart';
import 'package:ecommerce/strings.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CartDatabaseHelper {
  //باخد انستانس من الداتا بيز الي جايه من السكول لايت
  CartDatabaseHelper._();
  static CartDatabaseHelper db = CartDatabaseHelper._();
  static Database? _database;
  static Future<Database?> get database async {
    if (_database != null) return _database;

    await initDb();

    return _database;
  }

//هنا بكريت الداتا
  static Future initDb() async {
    String path = join(await getDatabasesPath(), '$tableCartProduct.db');
    _database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''  
      CREATE TABLE $tableCartProduct(
        $columnName TEXT ,
        $columnImage TEXT ,
        $columnPrice TEXT ,
        $columnProductId TEXT ,
        $columnQuanity INTEGER
        )
      ''');
    });
  }
  //هجيب كل الداتا من الكارت برودجت
  //بضيفها من صفحه الديتال

  static Future<List<CartModel>> getAllproducts() async {
    var dbClient = await database;

    List<Map> maps = await dbClient!.query(tableCartProduct);
    List<CartModel> list = maps.isNotEmpty
        ? maps.map((product) => CartModel.fromJson(product)).toList()
        : [];
    return list;
  }

  //هنا بعمل انسرت للداتا
  static insert(CartModel model) async {
    var dbClient = await database;
    await dbClient!.insert(tableCartProduct, model.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  updateProduct(CartModel model) async {
    var dbClient = await database;
    return await dbClient!.update(tableCartProduct, model.toJson(),
        where: '$columnProductId=?', whereArgs: [model.productId]);
  }
}
