import 'package:flutter/material.dart';

main() {
  runApp(HomeWidget());
}

List<String> buttons = [
  'c',
  '+/-',
  '%',
  '÷',
  '7',
  '8',
  '9',
  'x',
  '4',
  '5',
  '6',
  '-',
  '1',
  '2',
  '3',
  '+',
  '0',
  '.',
  'del',
  '='
];
RegExp regNumber = new RegExp(r'[0-9.]'); //regular expression of number
RegExp regOperator =
    new RegExp(r'[\+\-\x\÷\%\+\/\-]'); //regular express of operator
double leftValue; //left value
double rightValue; //right value
String result; //the result

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xff403831),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(bottom: 10.0, right: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        result ??= "",
                        style:
                            TextStyle(color: Color(0xffFFFFFF), fontSize: 32.0),
                      )
                    ],
                  ),
                ),
              ),
              GridView.count(
                crossAxisCount: 4,
                shrinkWrap: true,
                crossAxisSpacing: 2.0,
                mainAxisSpacing: 2.0,
                children: List.generate(buttons.length, (index) {
                  return FlatButton(
                    child: buttons[index] == 'del'
                        ? IconButton(
                            // icon: ImageIcon(AssetImage('images/del.png')),
                            icon: Image.asset('images/del.png'),
                          )
                        : Text(
                            buttons[index],
                            style: TextStyle(
                                color: Color(0xffE9E8E7),
                                fontSize: 32.0,
                                fontWeight: FontWeight.w100),
                          ),
                    onPressed: () {
                      // print(regNumber.hasMatch(buttons[index]));
                      print(buttons[index]);
                      // print(regOperator.hasMatch(buttons[index]));
                      regOperator.allMatches(buttons[index]).forEach((v){
                        print(":"+v[0]);
                      });
                      print(regOperator.stringMatch(buttons[index]) ==
                          buttons[index]);
                    },
                    color: Color(0xff706A63),
                    splashColor: Colors.transparent,
                    highlightColor: Color(0xffA8A4A1),
                  );
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
