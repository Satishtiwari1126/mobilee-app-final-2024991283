import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rasa/services/favorites_storage.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('FavoritesStorage', () {
    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      await FavoritesStorage.init();
    });

    test('persists favorites across storage reinitialization', () async {
      await FavoritesStorage.toggle('52772');

      await FavoritesStorage.init();

      expect(FavoritesStorage.contains('52772'), isTrue);
      expect(FavoritesStorage.getIds(), {'52772'});
    });

    test('toggle removes an existing favorite', () async {
      await FavoritesStorage.toggle('52772');
      await FavoritesStorage.toggle('52772');

      expect(FavoritesStorage.contains('52772'), isFalse);
      expect(FavoritesStorage.getIds(), isEmpty);
    });
  });
}
