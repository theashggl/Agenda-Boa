import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _counter = List.filled(3, 0), _selectedIndex = 0;

  void _incrementCounter(int index) {
    setState(() {
      _counter[index]++;
    });
  }

  void onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter ${_selectedIndex+1}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '${_counter[_selectedIndex]}',
              style: Theme.of(context).textTheme.headline4,
            ),
            MaterialButton(
              color: Colors.blue,
                elevation: 10,
                onPressed:()=> _incrementCounter(_selectedIndex),
              child: const Text('Increment me!')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _incrementCounter(_selectedIndex),
        tooltip: 'Increment me!',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.add_chart),
              label: 'Counter 1',
              tooltip: 'Counter 1',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_chart),
              label: 'Counter 2',
              tooltip: 'Counter 2',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_chart),
              label: 'Counter 3',
              tooltip: 'Counter 3',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: (int value) {
            onItemTap(value);
          }),
    );
  }
}
