import 'package:flutter/material.dart';

// Bringing all together
class Product{
  const Product({required this.name});

  final String name;
}

typedef CardChangeCallback = Function(Product product, bool inCard);

class ShoppingListItem extends StatelessWidget{
  ShoppingListItem({
    required this.product,
    required this.inCard,
    required this.onCardChanged,
  }) :super(key: ObjectKey(product));

  final Product product ;
  final bool inCard;
  final CardChangeCallback onCardChanged;

  Color _getColor(BuildContext context){
    return inCard //
        ? Colors.black54
        : Theme.of(context).primaryColor;
  }

  TextStyle? _getTextStyle(BuildContext context){
    if (!inCard) return null;

    return const TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough
    );
  }

  @override
  Widget build(BuildContext context){
    return ListTile(
      onTap: (){
        onCardChanged(product, inCard);
      },

      leading: CircleAvatar(
        backgroundColor: _getColor(context), 
        child: Text(product.name[0]),
      ),

      title: Text(product.name, style: _getTextStyle(context),),
    );
  }
}

class ShoppingList extends StatefulWidget{
  const ShoppingList({required this.products, super.key});

  final List<Product> products;
  
  // The framework calls createState the first time
  // a widget appears at a given location in the tree.
  // If the parent rebuilds and uses the same type of
  // widget (with the same key), the framework re-uses
  // the State object instead of creating a new State object.

  @override
  State<ShoppingList> createState() => _ShoppingListState();

}

class _ShoppingListState extends State<ShoppingList>{
  final _shoppingCard = <Product> {};

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      // When a user changes what's in the cart, you need
      // to change _shoppingCart inside a setState call to
      // trigger a rebuild.
      // The framework then calls build, below,
      // which updates the visual appearance of the app.

      if (!inCart) {
        _shoppingCard.add(product);
      } else {
        _shoppingCard.remove(product);
      }
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping List'),
      ),

      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        children: widget.products.map((product) {
          return ShoppingListItem(
            product: product,
            inCard: _shoppingCard.contains(product),
            onCardChanged: _handleCartChanged,
          );
        }).toList(),
      ),
    );
  }
}

void main(){
  runApp(
    const MaterialApp(
      title: 'Shopping App',
      home: ShoppingList(
        products: [
          Product(name: 'Egg'),
          Product(name: 'Flour'),
          Product(name: 'Chocolate Chips'),
        ],
      ),
    ),
  );
}
// changing widgets with responce to input
// class CounterDisplay extends StatelessWidget {
//   const CounterDisplay({required this.count, super.key});

//   final int count;

//   @override
//   Widget build(BuildContext context) {
//     return Text('Count: $count');
//   }
// }

// class CounterIncrement extends StatelessWidget{
//   const CounterIncrement({required this.onPressed, super.key});

//   final VoidCallback onPressed;

//   @override
//   Widget build(BuildContext context){
//     return ElevatedButton(onPressed: onPressed, child: const Text('Increment'));
//   }
// } 

// class Counter extends StatefulWidget{
//   // This class is the configuration for the state.
//   // It holds the values (in this case nothing) provided
//   // by the parent and used by the build  method of the
//   // State. Fields in a Widget subclass are always marked
//   // "final".

//   const Counter({super.key});

//   @override
//   State<Counter> createState() => _CounterState();
// }

// class _CounterState extends State<Counter> {
//   int _counter = 0;

//   void _increment() {
//     setState(() {
//       // This call to setState tells the Flutter framework
//       // that something has changed in this State, which
//       // causes it to rerun the build method below so that
//       // the display can reflect the updated values. If you
//       // change _counter without calling setState(), then
//       // the build method won't be called again, and so
//       // nothing would appear to happen.
//       _counter++;
//     });
//   }

  // void _decrement(){
  //   setState(() {
  //     _counter --;
  //   });
  // }

//   @override
//   Widget build(BuildContext context){
//     // This method is rerun every time setState is called,
//     // for instance, as done by the _increment method above.
//     // The Flutter framework has been optimized to make
//     // rerunning build methods fast, so that you can just
//     // rebuild anything that needs updating rather than
//     // having to individually changes instances of widgets.
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children:<Widget> [
//         CounterIncrement(onPressed: _increment),
//         const SizedBox(width: 16),
//         CounterDisplay(count: _counter)
//       ],

//     );
//   }
// }

// void main(){
//   runApp(
//     const MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: Counter(),
//         ),
//       ),
//     ),
//   );
// }


// using Material Componenets.

// void main() {
//   runApp(
//     const MaterialApp(
//       title: 'Flutter Tutorial',
//       home: TutorialHome()  ,
//     )
//   );
// }

// class TutorialHome extends StatelessWidget{
//   const TutorialHome({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // scaffold is a layout for the major Material component
//     return Scaffold(
//       appBar: AppBar(
//         leading: const IconButton(
//           tooltip: 'Navigation Menu',
//           onPressed: null, 
//           icon: Icon(Icons.menu)
//         ),

//         title: const Text('Example Title'),
//         actions: const [
//           IconButton(
//             icon: Icon(Icons.search),
//             onPressed: null,
//             tooltip: 'Search',
//           ),
//         ],
//       ),
//       // the body is the bigest part of the screen.
//       body: const Center(
//         child: Text('Hello Kingsley!'),
//       ),

//       floatingActionButton: const FloatingActionButton(
//         onPressed: null,
//         tooltip: 'add',
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }


// Handling gestures
// void main(){
//   runApp(
//     const MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: MyButton(),
//         ),
//       ),
//     ),
//   );
// }

// class MyButton extends StatelessWidget{
//   const MyButton({super.key});
  
//   @override
//   Widget build(BuildContext context){
//     return GestureDetector(
//       onTap: (){
//         print('My button was tapped');
//       },

//       child: Container(
//         height: 100.0,
//         width: 100.0,
//         padding: const EdgeInsets.all(8.0),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(90),
//           color:const Color.fromARGB(255, 20, 194, 221),
//         ),
//         child: const Center(
//           child: Text('Engage'),
//         ),
//       ),
//     );
//   }
  
// }
// class MyAppBar extends StatelessWidget {
//   const MyAppBar({required this.title , super.key});

//   final Widget title;// fields in a widget subclass are always maeked final.

//   @override
//   Widget build(BuildContext context){
//     return Container(
//       height: 56.0,// in logical pixels
//       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//       decoration: BoxDecoration(color: Colors.blue[500]),
//       // row is a horizontal linear layout.
//       child: Row(
//         children: [
//           const IconButton(
//             icon: Icon(Icons.menu),
//             tooltip: 'Navigation Menu',
//             onPressed: null,// null disables the button
//           ),
//           // Expanded expands its child to fill the available space
//           Expanded(child: title,),
//           const IconButton(onPressed: null, icon: Icon(Icons.search), tooltip: 'Search',),
//         ],
//       ),
//     );
//   }
// }

// class MyScaffold extends StatelessWidget {
//   const MyScaffold ({super.key});

//   @override
//   Widget build(BuildContext context){
//     //Material is a conceptual piece of paper on which the ui appears
//     return  Material(
//       // column is a vertical, linear layout
//       child: Column(
//         children: [
//            MyAppBar(
//             title: Text(
//               'Example title',
//               style: Theme.of(context)
//               .primaryTextTheme
//               .titleLarge,

//             ), 
//           ),
//           const Expanded(
//             child: Center(
//               child: Text('Hello Kingsley!'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
