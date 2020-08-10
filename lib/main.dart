import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import './screens/home_page.dart';
import './screens/input_page.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setEnabledSystemUIOverlays([]);
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroScreen(),
    );
  }
}

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen>
    with SingleTickerProviderStateMixin {
  final myNewFont = GoogleFonts.pressStart2p(
    textStyle:
        const TextStyle(color: Colors.black, fontSize: 20, letterSpacing: 3),
  );

  final myNewFontWhite = GoogleFonts.pressStart2p(
    textStyle:
        const TextStyle(color: Colors.white, fontSize: 20, letterSpacing: 3),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.grey[900],
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 120),
                    child: Container(
                      child: Text(
                        'Xumer0n',
                        style: myNewFontWhite.copyWith(fontSize: 30),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 5,
                    width: MediaQuery.of(context).size.width / 5,
                    child: Container(
                      child: CircleAvatar(
                        backgroundColor: Colors.grey[900],
                        child: Container(
                          width: MediaQuery.of(context).size.width / 0.5,
                          height: MediaQuery.of(context).size.height / 3,
                          child: Image.network(
                            'https://raw.githubusercontent.com/Xx0w0wxX/Marubatsu/master/assets/images/whorier.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                        radius: 50,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    'This is created by flutter',
                    style: GoogleFonts.pressStart2p(color: Colors.pink),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                          builder: (context) => InputScreen()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 40),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        padding: const EdgeInsets.all(15),
                        color: Colors.white,
                        child: Center(
                          child: Text(
                            'Duel',
                            style: myNewFont,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
