import 'package:flutter/material.dart';
import '../utils/util.dart';
import 'home_page.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({Key key}) : super(key: key);

  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  List<int> userAnswer = [];
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
    'Set',
    '0',
    'Pop'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    const Text('Set 3 Number',
                        style: TextStyle(color: Colors.pink, fontSize: 40)),
                    Container(
                      child: Text(userAnswer.toString(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 60)),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: 12,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: MediaQuery.of(context).size.width /
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
                                        color: Colors.pinkAccent,
                                        fontSize: 20)),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void tapped(int index) {
    setState(() {
      if (logic.checkDuplicate(userAnswer, index + 1)) {
      } else if (index == 9) {
        if (!logic.isFillable(userAnswer)) {
          setState(() {
            Navigator.push(
              context,
              MaterialPageRoute<void>(builder: (context) => MyHomePage()),
            );
          });
        } else {
          _showMessage('Please choose 3 number');
        }
      } else if (index == 11) {
        if (userAnswer.isNotEmpty) {
          logic.back(userAnswer);
        }
      } else if (logic.isFillable(userAnswer)) {
        if (index == 10) {
          userAnswer.add(0);
        } else {
          userAnswer.add(index + 1);
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
}
