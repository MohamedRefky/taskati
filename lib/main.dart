import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskati/Core/services/local_storage.dart';
import 'package:taskati/Core/themes/theme.dart';
import 'package:taskati/data/task_model.dart';
import 'package:taskati/features/Splash/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox('user');
  await Hive.openBox<TaskModel>('task');
  await Hive.openBox<bool>('model');
  var appLocalStorage = AppLocalStorage();
  await appLocalStorage.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box('user').listenable(),
      builder: (context, box, child) {
        bool darkMode = box.get('darkMode', defaultValue: false);
        return MaterialApp(
          themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
          // LIGHT
          theme: AppThemes.appLightTheme,
          // DARK
          darkTheme: AppThemes.appDarkTheme,
          debugShowCheckedModeBanner: false,
          home: const SplashView(),
        );
      },
    );
  }
}
