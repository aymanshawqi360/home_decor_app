import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:home_decor_app/core/networks/api_constants.dart';

class SaveTheToken {
  static final _storage = FlutterSecureStorage();

  static setData({required String key, required String value}) async {
    debugPrint("set Data => The Key Boon Entered :");
    await _storage.write(key: key, value: value);
    // await _storage.write(
    //   key: Token.refreshToken.name,
    //   value: refreshToken ?? "",
    // );
  }

  static Future<String?> getData(String key) async {
    debugPrint("get Data => Saved Token :");
    return await _storage.read(key: key) ?? "";
  }

  static Future<void> updateAccessToken(String newAccessToken) async {
    debugPrint("update Access Token => Updating access token only...");
    await _storage.write(key: Token.accesToken.name, value: newAccessToken);
  }

  static deleteAllData() async {
    debugPrint("delete All Data => Delete Data Been  :");
    // await storage.delete(key: Token.ACCESS_TOKEN.name);
    // await storage.delete(key: Token.REFRESH_TOKEN.name);
    await _storage.deleteAll();
  }

  static deleteItem({required String key}) async {
    debugPrint("delete Item => Delete Data Been   :");
    await _storage.delete(key: key);
  }
}
