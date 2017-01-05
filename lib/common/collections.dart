library chorinator.collections;

/* Note: The group, user, and chore strings are all ids */

class User {
  User();
  String name;
  String phone;
  List<String> groups;
  List<String> chores;

  User.fromMap(Map data) {
    name = data['name'];
    phone = data['phoneNumber'];
    groups = data['groups'];
    chores = data['chores'];
  }
}

class Group {
  Group();
  String name;
  List<String> users;
  List<String> chores;

  Group.fromMap(Map data) {
    name = data['name'];
    users = data['users'];
    chores = data['chores'];
  }
}

class Chore {
  Chore();
  String name;
  String description;
  String user;
  DateTime date;
  String group;

  Chore.fromMap(Map data) {
    name = data['name'];
    description = data['description'];
    user = data['user'];
    date = data['UTCDate'];
    group = data['group'];
  }
}
