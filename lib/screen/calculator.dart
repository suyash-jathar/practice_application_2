// ignore_for_file: prefer_const_constructors, unnecessary_brace_in_string_interps, sized_box_for_whitespace

import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});
  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height*0.3,
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    alignment: Alignment.bottomRight,
                    child: 
                          Text(result+''+text,style: TextStyle(fontSize: 24),
                          )
                          ),
                ],
              ),            
            ),
            Container(
              height: size.height*0.5,
              width: size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1st Row
                  Row(
                    children: [
                      elevatedButtonClicked('7'),
                      elevatedButtonClicked('8'),
                      elevatedButtonClicked('9'),
                      elevatedButtonClicked('x'),
                    ],
                  ),
                  // 2nd Row
                  Row(
                    children: [
                      elevatedButtonClicked('4'),
                      elevatedButtonClicked('5'),
                      elevatedButtonClicked('6'),
                      elevatedButtonClicked('-'),
                    ],
                  ),
                  // 3rd Row
                  Row(
                    children: [
                      elevatedButtonClicked('1'),
                      elevatedButtonClicked('2'),
                      elevatedButtonClicked('3'),
                      elevatedButtonClicked('+'),
                    ],
                  ),
                  // 4th Row
                  Row(
                    children: [
                      elevatedButtonClicked('C'),
                      elevatedButtonClicked('0'),
                      elevatedButtonClicked('='),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  String sign='';
  Widget elevatedButtonClicked(String value)
  {
    return Expanded(child: Padding(
      padding: const EdgeInsets.all(5.0),
      child: ElevatedButton(
        onPressed: (){
          setState(() {
            buttonClicked(value);
            if(value!='=' && value!='+' && value!='-' && value!='x' )
            {
              text+=value;
            }
            else{
              text='';
            }
          });
        }, 
        child: Text(value)
        ),
    ));
  }
  String result='';
  int? first;
  int? second;
  String text='';
  String? opperator;
  void buttonClicked(String button)
  {
    
    if(button=='C')
    {
      first=0;
      second=0;
      text='';
      result='';
    }
    // else if(button!='+'  && button!='-' && button!='x' && button!='=' && button!='C' )
    // {
    //   print('${first}');
    // }
    else if(button=='+' || button=='-' || button=='x' )
    {
      first=int.parse(text);
      result='';
      opperator=button;
    }
    else if(button=='=')
    {
      second=int.parse(text);
      if(opperator=="+")
      {
        result=(first!+second!).toString();
      }
      else if(opperator=='-')
      {
        result=(first!-second!).toString();
      }
      else if(opperator=='x')
      {
        result=(first!*second!).toString();
      }
      else{
        result=int.parse(text+button).toString();
      }
      setState(() {
        
        text=result;
      });
    }

    print('first is ${first}');
    print('second is ${second}');
    print('text is ${text}');
    print('operator is ${opperator}');
    print('result is ${result}');

  }
}