library chorinator.database;

import 'dart:async';
import 'dart:io';

import 'package:SMSChorinator/server/db_handler.dart';

main() async {
  DbHandler db_handler = new DbHandler();

  void printMap(Map map) {
    print("hello?");
    print('Das map: $map');
    db_handler.removeNotification(map["_id"]);
  }

  await db_handler.initialize();
  Stream<Map> stream = await db_handler.getNotifications();
  await stream.forEach(printMap);
  print('printed first');
  await db_handler.insertNotification({'1' : 'test'});
  stream = await db_handler.getNotifications();
  await stream.forEach(printMap);
  print('printed second');
  stream = await db_handler.getNotifications();
  await stream.forEach(printMap);
  print('printed third');
  db_handler.close();
}
