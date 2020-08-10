import 'package:Xume0n/utils/algo/good.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/algo/random.dart';
import '../utils/util.dart';

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
  MyHomePage({this.userAnswer});
  List<int> userAnswer;
  @override
  _MyHomePageState createState() => _MyHomePageState(userAnswer);
}

final myFont = GoogleFonts.pressStart2p(
  textStyle:
      const TextStyle(color: Colors.white, fontSize: 20, letterSpacing: 1),
);

final predictFont = GoogleFonts.pressStart2p(
  textStyle:
      const TextStyle(color: Colors.white, fontSize: 10, letterSpacing: 0.1),
);

final eatFont = GoogleFonts.pressStart2p(
  textStyle: const TextStyle(
      color: Colors.pinkAccent, fontSize: 10, letterSpacing: 0.1),
);

final biteFont = GoogleFonts.pressStart2p(
  textStyle: const TextStyle(
      color: Colors.blueAccent, fontSize: 10, letterSpacing: 0.1),
);

final attentionFont = GoogleFonts.pressStart2p(
  textStyle:
      const TextStyle(color: Colors.redAccent, fontSize: 8, letterSpacing: 0.1),
);

class _MyHomePageState extends State<MyHomePage> {
  bool isUser = true;
  List<String> userList = [];
  List<int> userEatList = [];
  List<int> userBiteList = [];
  List<String> cpuList = [];
  List<int> cpuEatList = [];
  List<int> cpuBiteList = [];
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
  List<int> botPrediction = random.createAnswer();
  // List<int> userAnswer = [1, 2, 3];
  List<int> cpuAnswer = random.createAnswer();
  List<List> mosikasite = todai.createPossible4(10);

  List<int> userAnswer;
  _MyHomePageState(this.userAnswer);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[800],
        body: ListView(
          children: <Widget>[
            Center(
              child: Container(
                width: 1200,
                padding: const EdgeInsets.all(16),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        FloatingActionButton(
                          backgroundColor: Colors.green,
                          child: const Icon(Icons.help_outline),
                          onPressed: () {
                            _showMessage(
                                'EAT mean that \n the number and the position are correct \n\n BITE means that \n only the position is correct');
                          },
                        ),
                      ],
                    ),
                    Container(
                      child: Text('Your number is $userAnswer', style: myFont),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      child: Text(prediction.toString(), style: myFont),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: GridView.builder(
                                shrinkWrap: true,
                                itemCount: 12,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  childAspectRatio:
                                      MediaQuery.of(context).size.width /
                                          MediaQuery.of(context).size.height *
                                          5.5,
                                ),
                                itemBuilder: (BuildContext contect, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      tapped(index);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.grey[700]),
                                      ),
                                      child: Center(
                                        child: Text(inputList[index],
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 20)),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('You', style: myFont),
                          Text('CPU', style: myFont),
                        ],
                      ),
                    ),
                    Text(
                        'CPU has ' +
                            mosikasite.length.toString() +
                            ' candidates',
                        style: predictFont),
                    const SizedBox(height: 6),
                    Text('After you called, plz click call again',
                        style: attentionFont),
                    const SizedBox(height: 10),
                    Text('CPU will give you pred although it takes time',
                        style: attentionFont),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: userList.isNotEmpty
                              ? ListView.builder(
                                  // padding: const EdgeInsets.all(50),
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(userList[index].toString(),
                                            style: predictFont),
                                        // Text(' ', style: myFont),
                                        Text('${userEatList[index]}E',
                                            style: eatFont),
                                        Text('${userBiteList[index]}B',
                                            style: biteFont),
                                      ],
                                    );
                                  },
                                  itemCount: userList.length,
                                )
                              : Container(),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: cpuList.isNotEmpty
                              ? ListView.builder(
                                  // padding: const EdgeInsets.all(500),
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(cpuList[index].toString(),
                                            style: predictFont),
                                        // Text('-', style: myFont),
                                        Text('${cpuEatList[index]}E',
                                            style: eatFont),
                                        Text('${cpuBiteList[index]}B',
                                            style: biteFont),
                                      ],
                                    );
                                  },
                                  itemCount: cpuList.length,
                                )
                              : Container(),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  void tapped(int index) {
    setState(() {
      if (isUser) {
        if (logic.checkDuplicate(prediction, index + 1)) {
        } else if (index == 9) {
          if (!logic.isFillable(prediction)) {
            // TODO optimize
            userList.add(prediction.toString());
            eatCounter = logic.mooproduct(cpuAnswer, prediction)[0];
            biteCounter = logic.mooproduct(cpuAnswer, prediction)[1];
            userBiteList.add(biteCounter);
            userEatList.add(eatCounter);
            if (eatCounter == 4) {
              _showResultDialog('You win');
            } else {
              prediction = [];
              changeTurn();
            }
          } else {
            _showMessage('Please choose 4 digits');
          }
        } else if (index == 11) {
          if (prediction.isNotEmpty) {
            logic.back(prediction);
          }
        } else if (logic.isFillable(prediction)) {
          if (index == 10) {
            prediction.add(0);
          } else {
            prediction.add(index + 1);
          }
        }
        // bot behavior
      } else {
        botPrediction =
            todai.createCPUpred(mosikasite, userAnswer, botPrediction);
        cpuList.add(botPrediction.toString());
        eatCounter = logic.mooproduct(userAnswer, botPrediction)[0];
        biteCounter = logic.mooproduct(userAnswer, botPrediction)[1];
        cpuBiteList.add(biteCounter);
        cpuEatList.add(eatCounter);
        if (eatCounter == 4) {
          _showResultDialog('You lose');
        } else {
          prediction = [];
          isUser = !isUser;
          setState(() {});
        }
      }
    });
  }

  void _showMessage(String msg) {
    showDialog<AlertDialog>(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)), //this right here
              child: Container(
                height: MediaQuery.of(context).size.height / 3,
                child: Padding(
                  padding: const EdgeInsets.all(9),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(msg),
                      RaisedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          'ok',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        });
  }

  void _showResultDialog(String msg) {
    showDialog<AlertDialog>(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(msg),
            actions: [
              FlatButton(
                child: const Text('Play Again'),
                onPressed: () {
                  var count = 0;
                  Navigator.popUntil(context, (route) {
                    return count++ == 2;
                  });
                  reset();
                },
              ),
            ],
          );
        });
  }

  void reset() {
    setState(() {
      isUser = true;
      userList = [];
      userEatList = [];
      userBiteList = [];
      cpuList = [];
      cpuEatList = [];
      cpuBiteList = [];
      prediction = [];
      botPrediction = [];
      eatCounter = 0;
      biteCounter = 0;
      mosikasite = todai.createPossible4(10);
    });
  }

  void changeTurn() {
    setState(() {
      isUser = !isUser;
      eatCounter = 0;
      biteCounter = 0;
    });
  }
}
