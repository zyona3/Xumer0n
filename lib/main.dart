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

final predictFont = GoogleFonts.pressStart2p(
  textStyle:
      const TextStyle(color: Colors.pinkAccent, fontSize: 30, letterSpacing: 3),
);

class _MyHomePageState extends State<MyHomePage> {
  List<String> userList = ['432', '293', '093'];
  List<String> cpuList = ['123', '892', '970'];

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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('You', style: myFont),
                      Text('CPU', style: myFont),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: ListView.builder(
                          // padding: const EdgeInsets.all(50),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Align(
                                child:
                                    Text(userList[index], style: predictFont));
                          },
                          itemCount: userList.length,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Center(
                          child: GridView.count(
                            shrinkWrap: true,
                            childAspectRatio:
                                MediaQuery.of(context).size.width /
                                    MediaQuery.of(context).size.height,
                            crossAxisCount: 3,
                            children: <Widget>[
                              const Text('1'),
                              const Text('2'),
                              const Text('3'),
                              const Text('4'),
                              const Text('5'),
                              const Text('6'),
                              const Text('7'),
                              const Text('8'),
                              const Text('9'),
                              const Text('Call'),
                              const Text('0'),
                              const Text('Back'),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          // padding: const EdgeInsets.all(500),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Align(
                                child:
                                    Text(userList[index], style: predictFont));
                          },
                          itemCount: cpuList.length,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ]));
  }
}
