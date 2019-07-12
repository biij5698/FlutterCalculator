import 'package:flutter/material.dart';
import 'package:expressions/expressions.dart';

main() {
  runApp(HomeWidget());
}

List<String> buttons = [
  '9',
  '8',
  '7',
  '÷',
  '6',
  '5',
  '4',
  'x',
  '3',
  '2',
  '1',
  '-',
  '0',
  'c',
  '=',
  '+'
];
RegExp regNumber = new RegExp(r'[0-9]'); //regular expression of number
RegExp regOperator = new RegExp(r'[\+\-\x\÷]'); //regular express of operator
String result; //the string to show the action

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
                        result ??= '',
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
                    child: Text(
                      buttons[index],
                      style: TextStyle(
                          color: Color(0xffE9E8E7),
                          fontSize: 32.0,
                          fontWeight: FontWeight.w100),
                    ),
                    onPressed: () {
                      if (buttons[index] == 'c') {
                        setState(() {
                          result = null;
                        });
                      } else if (buttons[index] == '=') {
                        // to calculate
                        String newResult =
                            result.replaceAll('x', '*').replaceAll('÷', '/');
                            if(newResult.endsWith('+') || newResult.endsWith('-') || newResult.endsWith('*') || newResult.endsWith('/')){
                              newResult = newResult.substring(0,newResult.length-1);
                            }
                        Expression _expression = Expression.parse(newResult);
                        final evaluate = const ExpressionEvaluator();
                        var context = {'x': null};
                        setState(() {
                          result = evaluate.eval(_expression, context).toString();
                        });
                      } else {
                        setState(() {
                          result += buttons[index];
                        });
                      }
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
