import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/search_screen.dart';
import 'screens/favorites_screen.dart';
import 'services/favorites_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FavoritesStorage.init();
  runApp(const RasaApp());
}

class RasaApp extends StatelessWidget {
  const RasaApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'RASA',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFB85C38)),
      scaffoldBackgroundColor: const Color(0xFFFFFAF5),
      appBarTheme: const AppBarTheme(backgroundColor: Color(0xFFFFFAF5), surfaceTintColor: Colors.transparent),
      cardTheme: CardThemeData(color: Colors.white, elevation: 1, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))),
    ),
    home: const MainNavigation(),
  );
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});
  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int index = 0;
  final pages = const [HomeScreen(), SearchScreen(), FavoritesScreen()];
  @override
  Widget build(BuildContext context) => Scaffold(
    body: IndexedStack(index: index, children: pages),
    bottomNavigationBar: NavigationBar(selectedIndex: index, onDestinationSelected: (value) => setState(() => index = value),
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
        NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
        NavigationDestination(icon: Icon(Icons.favorite_border), selectedIcon: Icon(Icons.favorite), label: 'Favorites'),
      ]),
  );
}
