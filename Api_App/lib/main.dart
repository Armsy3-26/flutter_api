import 'package:flutter/material.dart';
import 'package:untitled/register.dart';
import 'package:untitled/users.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Api Task',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Api Task'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Register(),
    Users(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 12,
        elevation: 0,
        child: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor.withGreen(10),
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.home),
                backgroundColor: Theme.of(context).primaryColor.withAlpha(0),
                label: "Register"),
            const BottomNavigationBarItem(
                icon: Icon(Icons.add_to_home_screen), label: "Users"),
          ],
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
        ),
      ),

      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            _widgetOptions.elementAt(_currentIndex),
          ],
        ),
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("End of TIme");
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
