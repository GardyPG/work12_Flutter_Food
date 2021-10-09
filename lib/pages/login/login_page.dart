import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:work12/pages/home/home_page.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';

  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var input = '';
  var pin = 0;
  var password = '123456';

  @override
  Widget build(BuildContext context) {
    List<Widget> iconList = [];
    for (var i = 0; i < pin; i++) {
      iconList.add(Icon(
        Icons.circle_rounded,
        color: Colors.white,
        size: 25.0,
      ));
    }
    for (var i = (6 - pin); i > 0; i--) {
      iconList.add(Icon(
        Icons.circle_rounded,
        color: Colors.white38,
        size: 25.0,
      ));
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/02.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.lock,
                          size: 80.0,
                          color: Colors.white,
                        ),
                        Text(
                          'LOGIN',
                          style: GoogleFonts.righteous(
                              fontSize: 25.0, color: Colors.white),
                        ),
                        Text('\nEnter PIN to login\n\n',
                            style: Theme.of(context).textTheme.bodyText1),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [for (var item in iconList) item],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    child: Column(
                      children: [
                        [1, 2, 3],
                        [4, 5, 6],
                        [7, 8, 9],
                        [-2, 0, -1],
                      ].map((row) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: row.map((item) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: numButton(
                                num: item,
                                onClick: _handleClickbutton,
                              ),
                            );
                          }).toList(),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleClickbutton(int num) {
    setState(() {
      if (num == -1) {
        input = input.substring(0, input.length - 1);
        pin--;
      } else {
        input = input + '$num';
        pin++;
      }
      if (input.length == 6) {
        if (input == password) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (BuildContext context) => HomePage()));
        } else {
          input = '';
          pin = 0;
          return _showMaterialDialog('ERROR', 'Invalid PIN. Please try again.');
        }
      }
    });
  }

  void _showMaterialDialog(String warn, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            warn,
            style: GoogleFonts.fredokaOne(fontSize: 30.0, color: Colors.red),
          ),
          content: Text(
            message,
            style: GoogleFonts.fredokaOne(),
          ),
          actions: [
            TextButton(
              child: const Text('OK'),
              style: TextButton.styleFrom(
                textStyle:
                    GoogleFonts.fredokaOne(color: Colors.red, fontSize: 15.0),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class numButton extends StatelessWidget {
  final int num;
  final Function(int) onClick;

  const numButton({
    required this.num,
    required this.onClick,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: CircleBorder(),
      onTap: num == -2 ? null : () => onClick(num),
      child: Container(
        width: 70.0,
        height: 70.0,
        decoration: num == -2
            ? null
            : BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 3.0, color: Colors.blueGrey),
                boxShadow: [
                    BoxShadow(
                        color: Colors.blueGrey.shade100,
                        blurRadius: 2,
                        offset: Offset(3, 3),
                        spreadRadius: 2)
                  ]),
        child: Center(
          child: num >= 0
              ? Text(num.toString(),
                  style: Theme.of(context).textTheme.headline2)
              : (num == -1
                  ? Icon(Icons.backspace_outlined,
                      size: 25.0, color: Colors.black)
                  : SizedBox.shrink()),
        ),
      ),
    );
  }
}
