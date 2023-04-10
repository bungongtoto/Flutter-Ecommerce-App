import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
  debugPaintSizeEnabled = false;
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
   const MyApp({super.key});
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Layout demo',
      home: buildHomePage('Strawberry Pavlova Recipe'),
    );
  }

  Widget buildHomePage(String title){

    const titleText = Padding(
      padding: EdgeInsets.all(20),
      child: Text(
        'Strawberry Pavlova',
        style: TextStyle(
          fontWeight: FontWeight.w800,
          letterSpacing: 0.5,
          fontSize: 30,
        ),
      ),
    );

    var stars = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.star, color: Colors.green[500],),
        Icon(Icons.star, color: Colors.green[500],),
        Icon(Icons.star, color: Colors.green[500],),
        const Icon(Icons.star, color: Colors.black,),
        const Icon(Icons.star, color: Colors.black,),
      ],
    );

    const subTitle = Text(
      'Pavlova is a meringue-based dessert named after the Russian ballerina '
      'Anna Pavlova. Pavlova features a crisp crust and soft, light inside, '
      'topped with fruit and whipped cream.',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'Georgia',
        fontSize: 25,
      ),
    );
    
    final ratings = Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          stars,
          const Text(
            '170 Reviews',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontFamily: 'Roboto',
              letterSpacing: 0.5,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );

  const descTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w800,
    fontFamily: 'Roboto',
    letterSpacing: 0.5,
    fontSize: 18,
    height: 2,
  );

  final iconList = DefaultTextStyle.merge(
    style: descTextStyle,
    child: Container(
      padding: const EdgeInsets.all(20),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        
        children: [
          Column(
            children: [
              Icon(Icons.kitchen, color: Colors.green[500],),
              const Text('PREP:'),
              const Text('25 min'),
            ],
          ),

          Column(
            children: [
              Icon(Icons.timer, color: Colors.green[500],),
              const Text('COOK'),
              const Text('1 hr'),
            ],
          ),

          Column(
            children: [
              Icon(Icons.restaurant, color: Colors.green[500],),
              const Text('FREEDS:'),
              const Text('4-6'),
            ],
          ),
        ],
      ),
    ),
    
  );

  final leftColumn = Container(
    padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
    child: Column(
      children: [
        titleText,
        subTitle,
        ratings,
        iconList,
      ],
    ),
  );

  final mainImage = Image.asset('images/img3.jfif', fit: BoxFit.cover,);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.fromLTRB(0, 40, 0, 30),
          height: 600,
          child: Card(
            child: Row(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 350,
                  child: leftColumn,
                ),
                //mainImage,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

