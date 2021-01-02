import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordpress_flutter/pages/home.dart';
import 'package:wordpress_flutter/pages/home_page.dart';
import 'services/theme_changer.dart';
import 'theme.dart';
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  static final String title = 'Google SignIn';
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      create: (_) => ThemeChanger(),
      child: Builder(builder: (context) {
        final themeChanger = Provider.of<ThemeChanger>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          themeMode: themeChanger.getTheme,
          darkTheme: Style.get(false),
          theme: Style.get(true),
          home: HomeRoute(),
        );
      }),
    );
  }
}
