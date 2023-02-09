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

        child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Padding(padding: EdgeInsets.only(top: 150),),
                 Text('Welcome',
                   style: TextStyle(
                     fontSize: 40,
                   ),
                 ),
                 
               ],
             ),
              Stack(
                children: [
                  Container(
                    height: 230,
                    width: 300,

                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Enter your e-mail',
                          ),
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 30),),
                        TextFormField(
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Enter your password',
                          ),
                        ),
                      ],
                    ),
                  ),

                ],

              ),
              SizedBox(
                width: 300,
                height: 50,
                child:
                ElevatedButton(onPressed: (){
                  //code
                },
                  child: Text('Login',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              ),

              SizedBox(
                width: 300,
                height: 50,

                child:
                TextButton(onPressed: (){
                  //code
                },
                  child: Text('Register Account',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ),

          ],
        ),
      ),
    );
  }
}
