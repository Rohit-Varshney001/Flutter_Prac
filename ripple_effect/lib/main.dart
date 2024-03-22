import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Ripple Effect'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {

  // late Animation _animation ;
  late AnimationController _animationController;



  @override
  void initState() {
    // TODO: implement initState
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 3),lowerBound: 0.2);
    // _animation = Tween(begin:0.0 , end: 1.0).animate(_animationController);

    _animationController.addListener(() {
      setState(() {});
    });
    _animationController.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var RadiusList =  [150.0,200.0,250.0,300.0];
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            BuildMyContaier(RadiusList[0]),
            BuildMyContaier(RadiusList[1]),
            BuildMyContaier(RadiusList[2]),
            BuildMyContaier(RadiusList[3]),


            Icon(Icons.call, color: Colors.white, size: 30,)
          ]

        ),

      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        _animationController.reset();
        _animationController.forward();
      },
        child: Icon(Icons.touch_app_outlined,color: Colors.white,),
        backgroundColor: Colors.blue,

      ),

    );

  }
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  Widget BuildMyContaier(var radius){
    return  Container(
      width: radius * _animationController.value,
      height: radius * _animationController.value,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue.withOpacity(1.0 - _animationController.value)
      ),
    );
  }
}
