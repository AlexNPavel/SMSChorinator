library chorinator.database;

import 'dart:async';

import 'package:mongo_dart/mongo_dart.dart';

/*
  Structure is as follows:
  chores: {
    name: ...,
    description: ...,
    user: ...,
    uTCDate: ...,
    group: ...
  }
  users: {
    name: ...,
    phoneNumber: ...,
    groups: ["_id", "_id", ...]
    chores: ["_id", "_id", ...]
  }
  groups: {
    name: ...,
    users: ["_id", "_id", ...],
    chores: ["_id", "_id", ...]
  }
*/

/*
 * The purpose of this class is to simply handle the database requests and keep
 * a connection open if neccessary. Each method should only be a one-line call
 * to the mongo server api.
 */
class DbHandler {
  Db db;

  initialize() async {
    db = new Db("mongodb://localhost:27017/smschorinator");
    await db.open();
  }

/*
  "GET" section
*/

  Future<Map> getUser(String name) async {
    return db.collection('users').findOne({'name': name});
  }

  Future<Map> getChore(String name) async {
    return db.collection('chores').findOne({'name': name});
  }

  Future<Map> getGroup(String name) async {
    return db.collection('groups').findOne({'name': name});
  }

  Future<Map> getUserById(ObjectId id) async {
    return db.collection('users').findOne(where.id(id));
  }

  Future<Map> getChoreById(ObjectId id) async {
    return db.collection('chores').findOne(where.id(id));
  }

  Future<Map> getGroupById(ObjectId id) async {
    return db.collection('groups').findOne(where.id(id));
  }

/*
  "INSERT" section
*/

  Future<Map> insertMapIntoChores(Map document) async {
    return db.collection('chores').insert(document);
  }

  Future<Map> insertMapIntoUsers(Map document) async {
    return db.collection('users').insert(document);
  }

  Future<Map> insertMapIntoGroups(Map document) async {
    return db.collection('groups').insert(document);
  }

/*
  "REMOVE" section
*/

  Future<Map> removeChoreById(ObjectId id) async {
    return db.collection('chores').remove(where.id(id));
  }

  Future<Map> removeUserById(ObjectId id) async {
    return db.collection('users').remove(where.id(id));
  }

  Future<Map> removeGroupById(ObjectId id) async {
    return db.collection('groups').remove(where.id(id));
  }

/*
  Deprected section
*/

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
