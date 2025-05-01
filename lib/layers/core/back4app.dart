import 'package:parse_server_sdk/parse_server_sdk.dart';

abstract class Back4app {
  static Future<void> initialize() async {

    final keyApplicationId = "x8UNPiKGimWG214Rn0pkd5zoFPkHX3Ko2icVriws";
    final keyClientKey = "iUPPvAK6TUA2ZkiOLM8QXvT66TkZYenRU809yWMw";
    final keyParseServerUrl = "https://parseapi.back4app.com";
    final liveQueryUrl = "https://apupueventos.b4a.io";

    await Parse().initialize(
      keyApplicationId,
      keyParseServerUrl,
      clientKey: keyClientKey,
      autoSendSessionId: true,
      liveQueryUrl: liveQueryUrl,
    );
  }
}
