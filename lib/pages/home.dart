import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordpress_flutter/tabs/videosPage.dart';
import '../services/theme_changer.dart';
import '../tabs/home_tab.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final themeChanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text(user.displayName.toString()),
        titleSpacing: 8.0,
        actions: <Widget>[
          InkWell(
            child: CircleAvatar(backgroundColor: Colors.amber, child: Icon(Icons.lightbulb_outline)),
            onTap: themeChanger.toggle,
          )
        ],
      ),
      body: IndexedStack(
        index: currentIndex,
        children: <Widget>[
          HomeTab(),
          VideoPlayerApp()
          // CategoriesTab(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Articles',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Videos',
          ),
        ],
      ),
    );
  }
}
