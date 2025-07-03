import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:home_decor_app/core/networks/api_constants.dart';

class SaveTheToken {
  static final storage = FlutterSecureStorage();

  static setData({
    required String accessToken,
    required String refreshToken,
  }) async {
    debugPrint("set Data => The Key Boon Entered :");
    await storage.write(key: Token.ACCESS_TOKEN.name, value: accessToken);
    await storage.write(key: Token.REFRESH_TOKEN.name, value: refreshToken);
  }

  static Future<String> getData(String key) async {
    debugPrint("get Data => Saved Token :");
    return await storage.read(key: key) ?? "";
  }

  static deleteData() async {
    debugPrint("delete Data => Delete Data Been  :");
    // await storage.delete(key: Token.ACCESS_TOKEN.name);
    // await storage.delete(key: Token.REFRESH_TOKEN.name);
    storage.deleteAll();
  }
}
