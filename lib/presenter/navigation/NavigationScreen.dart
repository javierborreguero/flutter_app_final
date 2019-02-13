import 'package:flutter/material.dart';
import 'package:flutter_app_final/presenter/PrincipalScreen/PrincipalScreen.dart';
import 'package:flutter_app_final/presenter/Answers/AnswersScreen.dart';

class NavigationScreen extends StatefulWidget {
  NavigationScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  PrincipalScreen _principalScreen = PrincipalScreen();
  AnswersScreen _answersScreen = AnswersScreen(1);
  int _currentScreenIndex = 0;

  _getCurrentScreen() {
    switch (_currentScreenIndex) {
      case 0:
        return _principalScreen;
      case 1:
        return _answersScreen;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[

            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                setState(() {
                  _currentScreenIndex = 0;
                });
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Question'),
              onTap: () {
                setState(() {
                  _currentScreenIndex = 1;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      body: _getCurrentScreen(),
    );
  }
}
