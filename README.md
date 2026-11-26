# RASA — The Essence of Every Flavor

**Student:** Tiwari Satish  
**Student ID:** 2024991283  
**Course:** Mobile App Design (2026-2)

RASA is a Flutter recipe discovery app. Browse meal categories, search for dishes, view ingredients and cooking instructions, and save favorite recipes.

## Features
- Browse recipe categories and meals
- View recipe images, category, country/area, ingredients, measures, and instructions
- Search recipes with a clear no-results state
- Save and remove favorites; favorites persist using SharedPreferences
- Home, Search, and Favorites bottom navigation
- Loading, error, and retry states
- Surprise-me random recipe action
- About dialog with student name and ID

## Technology
- Flutter and Dart
- TheMealDB public API: https://www.themealdb.com/api.php
- http for network requests
- shared_preferences for local favorites

## Run locally
1. Install Flutter and Android Studio or configure an iOS simulator.
2. Clone this repository.
3. Open a terminal in the project root and run: flutter create .
   This generates the native Android/iOS platform folders if they are not present.
4. Run: flutter pub get
5. Run: flutter run

For Android, ensure this permission is inside the manifest element in android/app/src/main/AndroidManifest.xml:
<uses-permission android:name="android.permission.INTERNET" />

## Project structure
lib/
  main.dart
  models/
  services/
  screens/
  widgets/

## Screenshots
Add at least three screenshots of the running application before submission:
- Home and categories
- Recipe details
- Search or Favorites

## Personalization still to complete
- Add your own profile photo to the About dialog or an About screen.
- Capture and add at least three real screenshots of the running app.
- Verify the project on your laptop with flutter pub get and flutter run.

## Notes
The app requires an internet connection to retrieve recipes. TheMealDB is a third-party service and its availability may vary.
