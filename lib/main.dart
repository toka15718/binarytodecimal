// ignore_for_file: unused_element, non_constant_identifier_names, use_key_in_widget_constructors, must_be_immutable, prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables, unused_local_variable

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
  
}

class _MyHomePageState extends State<MyHomePage> {
  final formKey=GlobalKey<FormState>();
 TextEditingController binaryNumber = TextEditingController();
 num decimalNumber = 0;
  bool _validate = false;
  @override
  Widget build(BuildContext context) {
    void binaryToDecimal(binaryNumber) {
      binaryNumber=binaryNumber.text.toString().split('').reversed;
      List<dynamic> number = binaryNumber.map(int.parse).toList();
      setState(() {
        decimalNumber=0;
        for (var i = 0; i < number.length; i++) {
          if ((number[i] == 0 || number[i] == 1)&&i<=8) {
            decimalNumber = decimalNumber + number[i] * pow(2, i);
          }
        }  
      });
    } 
    setState(() {
      binaryNumber.text.length > 8 ? _validate = true : _validate = false;
    });
    return Scaffold(

      appBar:AppBar(
          elevation: 0.0,
          title: Center(child:Text('Binary to dycimal'),),
        ),
      body: Column(
        key: formKey,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.only(top: 10,left: 20,right: 20),
          child: TextFormField(
            controller: binaryNumber,
            keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            decoration: InputDecoration(
              hintText: 'Enter the binary number',
              labelText: 'Binary number',
              labelStyle: TextStyle(fontSize: 25,color: Colors.black),
              border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black)),
              errorText:  _validate ? 'Enter the binary number less than 8' : null,

              ),  
          ),),
          Padding(
            padding: const EdgeInsets.only(left: 20,top: 5),
            child: ElevatedButton(
              onPressed: () {
                binaryToDecimal(binaryNumber);
                },
              child: const Text('Convert'),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 10,left: 20,right: 20),
            child:TextFormField(
            //controller: binaryNumber,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            decoration: InputDecoration(
            hintText: '$decimalNumber',
            hintStyle:  TextStyle(fontSize: 25, color: Colors.black),
            border: OutlineInputBorder(
              ),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey))
            ),
            readOnly: true,
          ),),
          
        ],
      ),
    );
  }
}
