import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xumer0n',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

final myFont = GoogleFonts.pressStart2p(
  textStyle:
      const TextStyle(color: Colors.white, fontSize: 30, letterSpacing: 3),
);

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[800],
        body: ListView(children: <Widget>[
          Center(
            child: Container(
              width: 1200,
              padding: const EdgeInsets.all(16),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(height: 100),
                  Container(
                    child: Text('Xumer0n', style: myFont),
                  ),
                  const SizedBox(height: 100),
                  Container(
                    child: Text('[ 1 3 4 ]', style: myFont),
                  ),
                  const SizedBox(height: 100),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('You', style: myFont),
                      Text('Input', style: myFont),
                      Text('CPU', style: myFont),
                    ],
                  )
                ],
              ),
            ),
          ),
        ]));
  }
}
