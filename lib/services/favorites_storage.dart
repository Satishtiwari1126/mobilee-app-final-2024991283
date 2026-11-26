import 'package:shared_preferences/shared_preferences.dart';

class FavoritesStorage {
  static const _key = 'rasa_favorite_meal_ids';
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Set<String> getIds() =>
      (_prefs?.getStringList(_key) ?? <String>[]).toSet();

  static Future<void> toggle(String id) async {
    final ids = getIds();
    if (!ids.add(id)) ids.remove(id);
    await _prefs?.setStringList(_key, ids.toList());
  }

  static bool contains(String id) => getIds().contains(id);
}
