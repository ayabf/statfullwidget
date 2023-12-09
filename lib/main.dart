import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _heartIcon = Icon(
    Icons.favorite_border,
    color: Colors.white,
  );
  bool _like = false;

  int _selectedIndex = 0;

  var _display = 'Home Selected';
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[IconButton(onPressed: _setLiked, icon: _heartIcon)],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$_display',
              style: TextStyle(color: Colors.indigoAccent, fontSize: 40),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: _setLiked,
          backgroundColor: Colors.indigoAccent,
          child: _heartIcon),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              label: 'Home', icon: Icon(Icons.home, color: Colors.white)),
          BottomNavigationBarItem(
              label: 'Settings',
              icon: Icon(Icons.settings, color: Colors.white)),
          BottomNavigationBarItem(
              label: 'Account',
              icon: Icon(Icons.account_circle, color: Colors.white))
        ],
        backgroundColor: Colors.indigoAccent,
        currentIndex: _selectedIndex,
        onTap: _setDisplayed,
      ),
    ));
  }

  void _setLiked() {
    setState(() {
      if (_like) {
        _like = false;
        _heartIcon = Icon(
          Icons.favorite_border,
          color: Colors.white,
        );
      } else {
        _like = true;
        _heartIcon = Icon(
          Icons.favorite,
          color: Colors.white,
        );
      }
    });
  }

  void _setDisplayed(int index) {
    setState(() {
      switch (index) {
        case 0:
          {
            _selectedIndex = 0;
            _display = 'Home Selected';
          }
          break;
        case 1:
          {
            _selectedIndex = 1;
            _display = 'Setting Selected';
          }
          break;
        case 2:
         {
            _selectedIndex = 0;
            _display = 'Account Selected';
          }
          break;
      }
    });
  }
}