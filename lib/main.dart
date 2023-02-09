import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LoginScreen',
      theme: ThemeData(

      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'LoginScreen'),
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



  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(

        child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
              Text('Welcome',
              )
          ],
        ),
      ),
    );
  }
}
