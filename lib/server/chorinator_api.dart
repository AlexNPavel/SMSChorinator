library chorinator.server;

import 'dart:async';

import 'package:rpc/rpc.dart';

import 'package:SMSChorinator/server/db_handler.dart';
import 'package:SMSChorinator/server/bin/server.dart';

class UserGroupsMessage {
  List<String> result;
  UserGroupsMessage();
}

// This class defines the interface that the server provides.
@ApiClass(version: 'v1')
class ChorinatorApi {
  DbHandler db = MainServer.db;

  @ApiMethod(method: 'GET', path: 'user/{name}')
  Future<UserGroupsMessage> getUserGroups(String name) async {
    Map user = await db.getUser(name);
    return new UserGroupsMessage()..result = user['groups'];
  }
}
