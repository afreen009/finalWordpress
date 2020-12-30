import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordpress_flutter/sign_up_widget.dart';
import 'services/theme_changer.dart';
import 'theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      create: (_) => ThemeChanger(),
      child: Builder(builder: (context) {
        final themeChanger = Provider.of<ThemeChanger>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          // title: TITLE,
          themeMode: themeChanger.getTheme,
          darkTheme: Style.get(false),
          theme: Style.get(true),
          home: SignUpWidget(),
        );
      }),
    );
  }
}
