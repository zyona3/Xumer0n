import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'utils/util.dart';

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
  bool isUser = true;
  List<String> userList = ['432', '293', '093'];
  List<String> cpuList = ['123', '892', '970'];
  List<String> inputList = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    'call',
    '0',
    'back'
  ];
  int eatCounter = 0;
  int biteCounter = 0;
  List<int> prediction = [];

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
                  const SizedBox(height: 50),
                  Container(
                    child: Text('Xumer0n', style: myFont),
                  ),
                  const SizedBox(height: 50),
                  Container(
                    child: Text(prediction.toString(), style: myFont),
                  ),
                  const SizedBox(height: 50),
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
                        flex: 3,
                        child: GridView.builder(
                            shrinkWrap: true,
                            itemCount: 12,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio:
                                  MediaQuery.of(context).size.width /
                                      MediaQuery.of(context).size.height *
                                      1.5,
                            ),
                            itemBuilder: (BuildContext contect, int index) {
                              return GestureDetector(
                                onTap: () {
                                  tapped(index);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey[700]),
                                  ),
                                  child: Center(
                                    child: Text(inputList[index],
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 20)),
                                  ),
                                ),
                              );
                            }),
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

  void tapped(int index) {
    setState(() {
      if (logic.checkDuplicate(prediction, index + 1)) {
        print('bad input');
      } else if (index == 9) {
        if (!logic.isFillable(prediction)) {
          logic.call();
        } else {
          print('plz fill');
        }
      } else if (index == 11) {
        if (prediction.isNotEmpty) {
          logic.back(prediction);
        }
      } else if (logic.isFillable(prediction)) {
        prediction.add(index + 1);
      }
    });
  }
}
