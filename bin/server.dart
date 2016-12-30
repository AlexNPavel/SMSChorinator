import 'dart:io';

import 'package:rpc/rpc.dart';

import 'package:SMSChorinator/server/db_handler.dart';
import 'package:SMSChorinator/server/chorinator_api.dart';

final ApiServer _apiServer =
    new ApiServer(prettyPrint: true);

class MainServer {
  static final DbHandler db = new DbHandler();

  main() async {
    db.initialize();
    _apiServer.addApi(new ChorinatorApi());
    _apiServer.enableDiscoveryApi();

    HttpServer server = await HttpServer.bind(InternetAddress.ANY_IP_V4, 8080);
    server.listen(_apiServer.httpRequestHandler);
  }
}
