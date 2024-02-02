import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../data/model/document_list_model.dart';

class SPUtill {
  static String keySelectLanguage = "key_select_language";
  static String keyDocumentList = "key_document_list";
  static String keyUserId = "user_id";
  static String keyAndroidDeviceToken = "android_device_token";
  static String keyIosDeviceToken = "ios_device_token";

  static setValue(String key,String? value) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value!);
  }

  static Future<String?> getValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      var value = prefs.getString(key);
      return value;
    } catch (error) {
      return null;
    }
  }
  static setIntValue(String key,int? value) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value!);
  }

  static Future<int?> getIntValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      var value = prefs.getInt(key);
      return value;
    } catch (error) {
      return null;
    }
  }

  static Future<int?> getRemoteModeType(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      var value = prefs.getInt(key);
      return value;
    } catch (error) {
      return null;
    }
  }

  static setDocumentPathList(String key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, jsonEncode(value));
  }

  static Future<List<ListElement>> getDocumentList(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      var value =  jsonDecode(prefs.getString(key)!);
      return List<ListElement>.from(value.map((e) => ListElement.fromJson(e)));
    } catch (error) {
      return [];
    }
  }

  static setLanguageIntValue(String key, int? value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value!);
  }

  static Future<int?> getSelectLanguage(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      var value = prefs.getInt(key);
      return value;
    } catch (error) {
      return null;
    }
  }
}
