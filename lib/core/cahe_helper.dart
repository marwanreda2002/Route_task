import 'package:hive_flutter/hive_flutter.dart';

class CashHelper{
  static late Box box;
  static Future<void> init() async {
    box = await Hive.openBox('appBox');
  }

  static Future<void> putData({required String key, required dynamic value}) async {
    await box.put(key, value);
  }

  static dynamic getData({required String key}) {
    return box.get(key);
  }

  static Future<void> removeData({required String key}) async {
    await box.delete(key);
  }
}
