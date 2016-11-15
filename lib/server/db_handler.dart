library chorinator.database;

import 'dart:async';

import 'package:mongo_dart/mongo_dart.dart';

class DbHandler {
  Db db;

  initialize() async {
    db = new Db("mongodb://localhost:27017/smschorinator");
    await db.open();
  }

  Future<Stream<Map>> getNotifications() async {
    return db.collection('notifications').find();
  }

  Future<Map> insertNotification(Map<String, String> toIns) async {
    return db.collection('notifications').insert(toIns);
  }

  Future<Map> removeNotification(ObjectId id) async {
    return db.collection('notifications').remove(where.id(id));
  }

  close() async {
    await db.close();
  }
}
