import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

///Classe responsável por gerênciar dados que serão reaproveitados e imutáveis
///durante a utilização da aplicação.
class AppStorage {
  static Future<void> saveString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static Future<void> saveMap(String key, Map<String, dynamic> value) async {
    saveString(key, json.encode(value));
  }

  static Future<String> getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static Future<Map<String, dynamic>> getMap(String key) async {
    try {
      Map<String, dynamic> map = json.decode(await getString(key));
      return map;
    } catch (_) {
      return null;
    }
  }

  static Future<bool> remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }

  static Future<String> getUserImage() async {
    Map<String, dynamic> map = await AppStorage.getMap('userImage');
    return Future.value(map['userImage']);
  }

  static Future<String> getUserName() async {
    Map<String, dynamic> map = await AppStorage.getMap('userName');
    return Future.value(map['userName']);
  }
}
