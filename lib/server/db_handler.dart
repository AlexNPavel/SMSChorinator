library chlorinator.database;

import 'package:mongo_dart/mongo_dart.dart';

class MongoDB {
  initialize() async {
    Db db = new Db("mongodb://localhost:27017");
    await db.open();
  }
}
