library chorinator.server_api;

import 'dart:async';

import 'package:rpc/rpc.dart';

import 'package:SMSChorinator/server/db_handler.dart';
/* we only need this if we used the specific getters:
import 'package:SMSChorinator/common/messages.dart'; */
import 'package:SMSChorinator/common/collections.dart';

// This class defines the interface that the server provides.
@ApiClass(version: 'v1')
class ChorinatorApi {
  DbHandler db;
  ChorinatorApi(DbHandler mainDb) {
    db = mainDb;
  }

  // General Getters
  @ApiMethod(method: 'GET', path: '/user/{name}')
  Future<User> getUser(String name) async {
    User user = new User.fromMap(await db.getUser(name));
    return user;
  }

  @ApiMethod(method: 'GET', path: '/group/{name}')
  Future<Group> getGroup(String name) async {
    Group group = new Group.fromMap(await db.getGroup(name));
    return group;
  }

  @ApiMethod(method: 'GET', path: '/chore/{name}')
  Future<Chore> getChore(String name) async {
    Chore chore = new Chore.fromMap(await db.getChore(name));
    return chore;
  }

/* Specific getters not used atm
  // Specific Getters
  @ApiMethod(method: 'GET', path: 'user/{name}/groups')
  Future<UserGroupsMessage> getUserGroups(String name) async {
    Map user = await db.getUser(name);
    return new UserGroupsMessage()..result = user['Groups'];
  }

  // we may or may not need this; keep it here, just in case
  @ApiMethod(method: 'GET', path: 'user/{name}/chores')
  Future<UserGroupsMessage> getUserChores(String name) async {
    Map user = await db.getUser(name);
    return new UserGroupsMessage()..result = user['chores'];
  }

  @ApiMethod(method: 'GET', path: '/group/{name}/members')
  Future<GroupMembersMessage> getGroupMembers(String name) async {
    Map group = await db.getGroup(name);
    return new GroupMembersMessage()..result = group['users'];
  }

  @ApiMethod(method: 'GET', path: '/group/{name}/chores')
  Future<GroupChoresMessage> getGroupChores(String name) async {
    Map group = await db.getGroup(name);
    return new GroupChoresMessage()..result = group['chores'];
  }
  */
}
