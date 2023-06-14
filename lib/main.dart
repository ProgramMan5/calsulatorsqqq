import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());


class Button extends StatefulWidget {
  const Button({Key? key, required this.text, required this.onPressed, required this.collor}) : super(key: key);
  final String text;
  final Color collor;
  final Function() onPressed;

  @override
  State<Button> createState() => _ButtonState();
}
class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
    onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromRGBO(97, 153, 237, 1), //3, 72, 175, 1
          minimumSize: Size(100, 85),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),
        ),
    ),
        child: Text(widget.text, style: TextStyle(
          color: widget.collor,
          fontSize: 36,
        ),),
    );
  }
}


class ButtonReturn extends StatefulWidget {
  const ButtonReturn({Key? key, required this.text, required this.onPressed, required this.collor}) : super(key: key);
  final String text;
  final Color collor;
  final Function() onPressed;

  @override
  State<ButtonReturn> createState() => _ButtonReturnState();
}
class _ButtonReturnState extends State<ButtonReturn> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromRGBO(3, 72, 175, 1),
        minimumSize: Size(100, 85),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(widget.text, style: TextStyle(
        color: widget.collor,
        fontSize: 22,
      ),),
    );
  }
}


class AnimatedContainerWidget extends StatefulWidget {
  final bool onreturn;
  final double x1;
  final double x2;
  final String result;

  AnimatedContainerWidget({Key? key, required this.onreturn,required this.x1, required this.x2, required this.result, }) : super(key: key);

  @override
  _AnimatedContainerWidgetState createState() => _AnimatedContainerWidgetState();
}
class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: true, //когда виджет прозрачный делает его фантомным, иначе виджет под ним некликабельный
      child: AnimatedOpacity(
      duration: Duration(milliseconds: 150),
      opacity: widget.onreturn ? 1 : 0 ,
      child: Container(
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('D = ${widget.result}', style: TextStyle(
              color: Colors.orange,
              fontSize: 45,
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('X1 = ${widget.x1}', style: TextStyle(
                  color: Colors.orange,
                  fontSize: 30,
                )),
                Text('X2 = ${widget.x2}', style: TextStyle(
                  color: Colors.orange,
                  fontSize: 30,
                )),
              ],
            )
          ],
        ),
        width: double.infinity,
        height: 260,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Color.fromRGBO(0, 10, 25, 1),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
    );
  }
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});


  @override
  _MyAppState createState() => _MyAppState();

}
class _MyAppState extends State<MyApp> {

  double a = 0.0, b = 0.0, c = 0.0;
  double delta = 0.0, x1 = 0.0, x2 = 0.0;
  String result = "", a_text="",b_text="",c_text="";
  bool a_trigger = false,  b_trigger = false,  c_trigger = false,
      onreturn = false, equaltap = false;

  void _toggleRe(){
    setState(() {
      if (equaltap) {
        onreturn = false;
        equaltap = false;
        a_text = "";
        b_text = "";
        c_text = "";
        a_trigger = true;
      }
    });
  }
  void _atri(){
    setState(() {
      a_trigger=true;
      b_trigger=false;
      c_trigger=false;
    });
  }
  void _btri(){
    setState(() {
      a_trigger=false;
      b_trigger=true;
      c_trigger=false;
    });
  }
  void _ctri(){
    setState(() {
      a_trigger=false;
      b_trigger=false;
      c_trigger=true;
    });
  }
  void _onepress() {
    setState(() {
      if (a_trigger) {
        if (a_text.length < 4 && !a_text.contains('.') && !a_text.contains('-')) {
          a_text += '1';
        } else if (a_text.length < 5 && (a_text.contains('.') || a_text.contains('-'))) {
          a_text += '1';
        } else if (a_text.length < 6 && (a_text.contains('.') && a_text.contains('-'))) {
          a_text += '1';
        }
      } else if (b_trigger) {
        if (b_text.length < 4 && !b_text.contains('.') && !b_text.contains('-')) {
          b_text += '1';
        } else if (b_text.length < 5 && (b_text.contains('.') || b_text.contains('-'))) {
          b_text += '1';
        } else if (b_text.length < 6 && (b_text.contains('.') && b_text.contains('-'))){
          b_text +='1';
        }
      } else if (c_trigger) {
        if (c_text.length < 4 && !c_text.contains('.') && !c_text.contains('-')) {
          c_text += '1';
        } else if (c_text.length < 5 && (c_text.contains('.') || c_text.contains('-'))) {
          c_text += '1';
        } else if (c_text.length < 6 && (c_text.contains('.') && c_text.contains('-'))){
          c_text +='1';
        }
      }
    });
  }
  void _twopress() {
    setState(() {
      if (a_trigger) {
        if (a_text.length < 4 && !a_text.contains('.') && !a_text.contains('-')) {
          a_text += '2';
        } else if (a_text.length < 5 && (a_text.contains('.') || a_text.contains('-'))) {
          a_text += '2';
        } else if (a_text.length < 6 && (a_text.contains('.') && a_text.contains('-'))) {
          a_text += '2';
        }
      } else if (b_trigger) {
        if (b_text.length < 4 && !b_text.contains('.') && !b_text.contains('-')) {
          b_text += '2';
        } else if (b_text.length < 5 && (b_text.contains('.') || b_text.contains('-'))) {
          b_text += '2';
        } else if (b_text.length < 6 && (b_text.contains('.') && b_text.contains('-'))){
          b_text +='2';
        }
      } else if (c_trigger) {
        if (c_text.length < 4 && !c_text.contains('.') && !c_text.contains('-')) {
          c_text += '2';
        } else if (c_text.length < 5 && (c_text.contains('.') || c_text.contains('-'))) {
          c_text += '2';
        } else if (c_text.length < 6 && (c_text.contains('.') && c_text.contains('-'))){
          c_text +='2';
        }
      }
    });
  }
  void _threepress() {
    setState(() {
      if (a_trigger) {
        if (a_text.length < 4 && !a_text.contains('.') && !a_text.contains('-')) {
          a_text += '3';
        } else if (a_text.length < 5 && (a_text.contains('.') || a_text.contains('-'))) {
          a_text += '3';
        } else if (a_text.length < 6 && (a_text.contains('.') && a_text.contains('-'))) {
          a_text += '3';
        }
      } else if (b_trigger) {
        if (b_text.length < 4 && !b_text.contains('.') && !b_text.contains('-')) {
          b_text += '3';
        } else if (b_text.length < 5 && (b_text.contains('.') || b_text.contains('-'))) {
          b_text += '3';
        } else if (b_text.length < 6 && (b_text.contains('.') && b_text.contains('-'))){
          b_text +='3';
        }
      } else if (c_trigger) {
        if (c_text.length < 4 && !c_text.contains('.') && !c_text.contains('-')) {
          c_text += '3';
        } else if (c_text.length < 5 && (c_text.contains('.') || c_text.contains('-'))) {
          c_text += '3';
        } else if (c_text.length < 6 && (c_text.contains('.') && c_text.contains('-'))){
          c_text +='3';
        }
      }
    });
  }
  void _fourpress() {
    setState(() {
      if (a_trigger) {
        if (a_text.length < 4 && !a_text.contains('.') && !a_text.contains('-')) {
          a_text += '4';
        } else if (a_text.length < 5 && (a_text.contains('.') || a_text.contains('-'))) {
          a_text += '4';
        } else if (a_text.length < 6 && (a_text.contains('.') && a_text.contains('-'))) {
          a_text += '4';
        }
      } else if (b_trigger) {
        if (b_text.length < 4 && !b_text.contains('.') && !b_text.contains('-')) {
          b_text += '4';
        } else if (b_text.length < 5 && (b_text.contains('.') || b_text.contains('-'))) {
          b_text += '4';
        } else if (b_text.length < 6 && (b_text.contains('.') && b_text.contains('-'))){
          b_text +='4';
        }
      } else if (c_trigger) {
        if (c_text.length < 4 && !c_text.contains('.') && !c_text.contains('-')) {
          c_text += '4';
        } else if (c_text.length < 5 && (c_text.contains('.') || c_text.contains('-'))) {
          c_text += '4';
        } else if (c_text.length < 6 && (c_text.contains('.') && c_text.contains('-'))){
          c_text +='4';
        }
      }
    });
  }
  void _fivepress() {
    setState(() {
      if (a_trigger) {
        if (a_text.length < 4 && !a_text.contains('.') && !a_text.contains('-')) {
          a_text += '5';
        } else if (a_text.length < 5 && (a_text.contains('.') || a_text.contains('-'))) {
          a_text += '5';
        } else if (a_text.length < 6 && (a_text.contains('.') && a_text.contains('-'))) {
          a_text += '5';
        }
      } else if (b_trigger) {
        if (b_text.length < 4 && !b_text.contains('.') && !b_text.contains('-')) {
          b_text += '5';
        } else if (b_text.length < 5 && (b_text.contains('.') || b_text.contains('-'))) {
          b_text += '5';
        } else if (b_text.length < 6 && (b_text.contains('.') && b_text.contains('-'))){
          b_text +='5';
        }
      } else if (c_trigger) {
        if (c_text.length < 4 && !c_text.contains('.') && !c_text.contains('-')) {
          c_text += '5';
        } else if (c_text.length < 5 && (c_text.contains('.') || c_text.contains('-'))) {
          c_text += '5';
        } else if (c_text.length < 6 && (c_text.contains('.') && c_text.contains('-'))){
          c_text +='5';
        }
      }
    });
  }
  void _sixpress() {
    setState(() {
      if (a_trigger) {
        if (a_text.length < 4 && !a_text.contains('.') && !a_text.contains('-')) {
          a_text += '6';
        } else if (a_text.length < 5 && (a_text.contains('.') || a_text.contains('-'))) {
          a_text += '6';
        } else if (a_text.length < 6 && (a_text.contains('.') && a_text.contains('-'))) {
          a_text += '6';
        }
      } else if (b_trigger) {
        if (b_text.length < 4 && !b_text.contains('.') && !b_text.contains('-')) {
          b_text += '6';
        } else if (b_text.length < 5 && (b_text.contains('.') || b_text.contains('-'))) {
          b_text += '6';
        } else if (b_text.length < 6 && (b_text.contains('.') && b_text.contains('-'))){
          b_text +='6';
        }
      } else if (c_trigger) {
        if (c_text.length < 4 && !c_text.contains('.') && !c_text.contains('-')) {
          c_text += '6';
        } else if (c_text.length < 5 && (c_text.contains('.') || c_text.contains('-'))) {
          c_text += '6';
        } else if (c_text.length < 6 && (c_text.contains('.') && c_text.contains('-'))){
          c_text +='6';
        }
      }
    });
  }
  void _sevenpress() {
    setState(() {
      if (a_trigger) {
        if (a_text.length < 4 && !a_text.contains('.') && !a_text.contains('-')) {
          a_text += '7';
        } else if (a_text.length < 5 && (a_text.contains('.') || a_text.contains('-'))) {
          a_text += '7';
        } else if (a_text.length < 6 && (a_text.contains('.') && a_text.contains('-'))) {
          a_text += '7';
        }
      } else if (b_trigger) {
        if (b_text.length < 4 && !b_text.contains('.') && !b_text.contains('-')) {
          b_text += '7';
        } else if (b_text.length < 5 && (b_text.contains('.') || b_text.contains('-'))) {
          b_text += '7';
        } else if (b_text.length < 6 && (b_text.contains('.') && b_text.contains('-'))){
          b_text +='7';
        }
      } else if (c_trigger) {
        if (c_text.length < 4 && !c_text.contains('.') && !c_text.contains('-')) {
          c_text += '7';
        } else if (c_text.length < 5 && (c_text.contains('.') || c_text.contains('-'))) {
          c_text += '7';
        } else if (c_text.length < 6 && (c_text.contains('.') && c_text.contains('-'))){
          c_text +='7';
        }
      }
    });
  }
  void _eightpress() {
    setState(() {
      if (a_trigger) {
        if (a_text.length < 4 && !a_text.contains('.') && !a_text.contains('-')) {
          a_text += '8';
        } else if (a_text.length < 5 && (a_text.contains('.') || a_text.contains('-'))) {
          a_text += '8';
        } else if (a_text.length < 6 && (a_text.contains('.') && a_text.contains('-'))) {
          a_text += '8';
        }
      } else if (b_trigger) {
        if (b_text.length < 4 && !b_text.contains('.') && !b_text.contains('-')) {
          b_text += '8';
        } else if (b_text.length < 5 && (b_text.contains('.') || b_text.contains('-'))) {
          b_text += '8';
        } else if (b_text.length < 6 && (b_text.contains('.') && b_text.contains('-'))){
          b_text +='8';
        }
      } else if (c_trigger) {
        if (c_text.length < 4 && !c_text.contains('.') && !c_text.contains('-')) {
          c_text += '8';
        } else if (c_text.length < 5 && (c_text.contains('.') || c_text.contains('-'))) {
          c_text += '8';
        } else if (c_text.length < 6 && (c_text.contains('.') && c_text.contains('-'))){
          c_text +='8';
        }
      }
    });
  }
  void _ninepress() {
    setState(() {
      if (a_trigger) {
        if (a_text.length < 4 && !a_text.contains('.') && !a_text.contains('-')) {
          a_text += '9';
        } else if (a_text.length < 5 && (a_text.contains('.') || a_text.contains('-'))) {
          a_text += '9';
        } else if (a_text.length < 6 && (a_text.contains('.') && a_text.contains('-'))) {
          a_text += '9';
        }
      } else if (b_trigger) {
        if (b_text.length < 4 && !b_text.contains('.') && !b_text.contains('-')) {
          b_text += '9';
        } else if (b_text.length < 5 && (b_text.contains('.') || b_text.contains('-'))) {
          b_text += '9';
        } else if (b_text.length < 6 && (b_text.contains('.') && b_text.contains('-'))){
          b_text +='9';
        }
      } else if (c_trigger) {
        if (c_text.length < 4 && !c_text.contains('.') && !c_text.contains('-')) {
          c_text += '9';
        } else if (c_text.length < 5 && (c_text.contains('.') || c_text.contains('-'))) {
          c_text += '9';
        } else if (c_text.length < 6 && (c_text.contains('.') && c_text.contains('-'))){
          c_text +='9';
        }
      }
    });
  }
  void _nullpress() {
    setState(() {
      if (a_trigger) {
        if (a_text.length < 4 && !a_text.contains('.') && !a_text.contains('-')) {
          a_text += '0';
        } else if (a_text.length < 5 && (a_text.contains('.') || a_text.contains('-'))) {
          a_text += '0';
        } else if (a_text.length < 6 && (a_text.contains('.') && a_text.contains('-'))) {
          a_text += '0';
        }
      } else if (b_trigger) {
        if (b_text.length < 4 && !b_text.contains('.') && !b_text.contains('-')) {
          b_text += '0';
        } else if (b_text.length < 5 && (b_text.contains('.') || b_text.contains('-'))) {
          b_text += '0';
        } else if (b_text.length < 6 && (b_text.contains('.') && b_text.contains('-'))){
          b_text +='0';
        }
      } else if (c_trigger) {
        if (c_text.length < 4 && !c_text.contains('.') && !c_text.contains('-')) {
          c_text += '0';
        } else if (c_text.length < 5 && (c_text.contains('.') || c_text.contains('-'))) {
          c_text += '0';
        } else if (c_text.length < 6 && (c_text.contains('.') && c_text.contains('-'))){
          c_text +='0';
        }
      }
    });
  }
  void _commapress() {
    setState(() {
      if (a_trigger) {
        if (!a_text.contains('.')) {
          a_text += '.';
        }
      } else if (b_trigger) {
        if (!b_text.contains('.')) {
          b_text += '.';
        }
      } else if (c_trigger) {
        if (!c_text.contains('.')) {
          c_text += '.';
        }
      }
    });
  }
  void _deletepress()  {
    setState(() {
      if (a_trigger) {a_text = '';}
      else if (b_trigger) {b_text = '';}
      else if (c_trigger) {c_text = '';}
    });
  }
  void _minuspress() {
    setState(() {
      if (a_trigger) {
        if (a_text.isEmpty) {
          a_text = '-';
        } else if (a_text.length < 6 && !a_text.contains('-')) {
          a_text = '-' + a_text;
        }
      } else if (b_trigger) {
        if (b_text.isEmpty) {
          b_text = '-';
        } else if (b_text.length < 6 && !b_text.contains('-')) {
          b_text = '-' + b_text;
        }
      } else if (c_trigger) {
        if (c_text.isEmpty) {
          c_text = '-';
        } else if (c_text.length < 6 && !c_text.contains('-')) {
          c_text = '-' + c_text;
        }
      }
    });
  }
  void _equalspress() {
    setState(() {
      if (a_text != '' && b_text != '' && c_text !='') {
        onreturn = true;
        a_trigger = false;
        b_trigger = false;
        c_trigger = false;
        equaltap = true;
        a = double.parse(a_text);
        b = double.parse(b_text);
        c = double.parse(c_text);
        delta = b * b - 4 * a * c;
        if (delta is num) {
          if (delta < 0) {
            result = "no soluts";
            x1 = 0;
            x2 = 0;
          }
          // случай д < 0
          else if (delta == 0) {
            x1 = (-b) / (2 * a);
            x1 = double.parse(x1.toStringAsFixed(1));
            delta = double.parse(delta.toStringAsFixed(1)) ;
            result = delta.toString();
          // случай когда д = 0
          }
          else {
            x1 = (-b - sqrt(delta)) / (2 * a);
            x1 = double.parse(x1.toStringAsFixed(1)) ;
            x2 = (-b + sqrt(delta)) / (2 * a);
            x2 = double.parse(x2.toStringAsFixed(1)) ;
            delta = double.parse(delta.toStringAsFixed(1)) ;
            result = delta.toString();
            // все хорошо
          }
        }
        /*else {result = 'error';
          x1 = 0;
          x2 = 0;
        }
        это отвлетвление не работает
        */
      }
      if (a_trigger) {
        a_trigger = false;
        b_trigger = true;
        c_trigger = false;
      }
      else if (b_trigger){
        a_trigger = false;
        b_trigger = false;
        c_trigger = true;
      }
      else if (c_trigger){
        a_trigger = true;
        b_trigger = false;
        c_trigger = false;
      }
    });
  }
//куча функций для кнопок и триггеров виджетов

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     home: Scaffold(
       backgroundColor: Color.fromRGBO(0, 30, 70, 1), //11, 50, 107, 1
       body: Center(
         child: Column(
           children: [
             Stack(
               children: [
                 Container(
                     width: double.infinity,
                     height: 260,
                     margin: const EdgeInsets.all(15),
                     decoration: BoxDecoration(
                         color: Color.fromRGBO(0, 10, 25, 1),
                         borderRadius: BorderRadius.circular(20),
                     ),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                           children: [
                             const Text('A:', style: TextStyle(
                               color: Colors.white,
                               fontSize: 29,
                             ),),
                             Container(
                               width: 77,
                               child: TextButton(
                                 onPressed: _atri,
                                 child: Text('$a_text', style: TextStyle(fontSize: 19,color: Colors.orange),
                                 ),
                               ),
                               decoration: BoxDecoration(
                                 color: Colors.white,
                                 borderRadius: BorderRadius.circular(14),
                                 border: Border.all(
                                   color: Colors.black,
                                   width: 3,
                                 ),
                               ),
                             ),

                             const Text('B:', style: TextStyle(
                               color: Colors.white,
                               fontSize: 29,
                             ),),
                             Container(
                               width: 77,
                               child: TextButton(
                                 onPressed: _btri,
                                 child: Text('$b_text', style: TextStyle(fontSize: 19,color: Colors.orange),
                                 ),
                               ),
                               decoration: BoxDecoration(
                                 color: Colors.white,
                                 borderRadius: BorderRadius.circular(14),
                                 border: Border.all(
                                   color: Colors.black,
                                   width: 3,
                                 ),
                               ),
                             ),

                             const Text('C:', style: TextStyle(
                               color: Colors.white,
                               fontSize: 29,
                             ),),
                             Container(
                               width: 77,
                               child: TextButton(
                                 onPressed: _ctri,
                                 child:  Text('$c_text', style: TextStyle(fontSize: 19,color: Colors.orange),
                                 ),
                               ),
                               decoration: BoxDecoration(
                                 color: Colors.white,
                                 borderRadius: BorderRadius.circular(14),
                                 border: Border.all(
                                   color: Colors.black,
                                   width: 3,
                                 ),
                               ),
                             ),
                           ],
                         ),

                         const SizedBox(height: 15),

                       ]
                       ,)
                   //первый контейнер с вводом заканчивается
                 ),
                 AnimatedContainerWidget(
                   onreturn: onreturn, x1: x1, x2: x2, result: result,
                 ),
                 //второй анимированный конт с выводом заканчивается
               ],
             ),
             Expanded(child:
             Container(
               margin: const EdgeInsets.all(15),
               child:  Column(
                 children: [
                    Expanded(child:
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Button(text: '1', collor: Colors.white, onPressed: _onepress),
                       Button(text: '2', collor: Colors.white, onPressed: _twopress),
                       Button(text: '3', collor: Colors.white, onPressed: _threepress),
                     ],
                   ),
                   ),
                   Expanded(child:
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Button(text: '4', collor: Colors.white, onPressed: _fourpress),
                       Button(text: '5', collor: Colors.white, onPressed: _fivepress),
                       Button(text: '6', collor: Colors.white, onPressed: _sixpress),
                     ],
                   ),
                   ),
                   Expanded(child:
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Button(text: '7', collor: Colors.white, onPressed: _sevenpress),
                       Button(text: '8', collor: Colors.white, onPressed: _eightpress),
                       Button(text: '9', collor: Colors.white, onPressed: _ninepress),
                     ],
                   ),
                   ),
                   Expanded(child:
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Button(text: '-', collor: Colors.white, onPressed: _minuspress),
                       Button(text: '0', collor: Colors.white, onPressed: _nullpress),
                       Button(text: '.', collor: Colors.white, onPressed: _commapress),
                     ],
                   ),
                   ),
                   Expanded(child:
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Button(text: 'del', collor: Colors.white, onPressed: _deletepress),
                       Button(text: '=', collor: Colors.white, onPressed: _equalspress),
                       ButtonReturn(text: 'Return', collor: Colors.orange, onPressed: _toggleRe),
                     ],
                   ),
                   ),
                   ],
                   ),
             ),
             ),
             //конт с кнопками на экране закончился
           ],
         ),
       ),
     ),
    );
  }
}