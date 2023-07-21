import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const FunnyQuotesApp());
}

class FunnyQuotesApp extends StatelessWidget {
  const FunnyQuotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var count1 = 0;
  var count2 = 0;
  static const List<String> quoteList = [
    'หลังเที่ยงคืน ทุกอย่างคืออดีต',
    'จงเป็นตัวเรา ที่ไม่ต้องเหมือนใคร',
    'ตัวแม่จะแคร์เพื่อ',
    'ถ้าเธอไม่ชอบหน้าร้อน มาชอบหน้าเราก็ได้นะ',
    'ขอโทษนะที่หัวใจไม่แข็งเหมือนคอ',
  ];

  static const List<Color> colorList = [
    Colors.lightGreenAccent,
    Colors.deepPurple,
    Colors.amber,
    Colors.red,
    Colors.cyanAccent,
    Colors.pink,
    Colors.teal,
  ];
  var quote = quoteList[0];
  var colors = colorList[0];



  void handleClickNextQuote(){
    setState(() {
      var rand = Random();
      var rand2 = Random();
      var randomIndex1 = 0;
      var randomIndex2 = 0;

      while (true){
        randomIndex1 = rand.nextInt(quoteList.length);
        if(randomIndex1 != count1){
          break;
        }

      }
      while (true){
        randomIndex2 = rand2.nextInt(colorList.length);
        if(randomIndex2 != count2){
          break;
        }

      }
      // var randomIndex = rand.nextInt(quoteList.length);
      quote = quoteList[randomIndex1];
      colors = colorList[randomIndex2];
      count1 = randomIndex1;
      count2 = randomIndex2;
    });
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('คำคมกวนๆ')),
      floatingActionButton: FloatingActionButton(
        child: Text(' Next\n Quote'),
        onPressed: handleClickNextQuote,
      ),
      body:  Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Text(
            quote,
            style:  TextStyle(
              color: colors,
              fontSize: 50,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
