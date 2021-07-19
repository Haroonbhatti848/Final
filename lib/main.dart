import 'dart:core';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_final/First_Screen.dart';
import 'package:ui_final/Second_Screen.dart';
import 'package:ui_final/View_Screen.dart';
import 'package:ui_final/indicator.dart';

int? isViewed;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences =  await SharedPreferences.getInstance();
  isViewed = preferences.getInt('onboard');
 // await preferences.setInt('initScreen', 1);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blueGrey[200]
      ),
      debugShowCheckedModeBanner: false,

      // initialRoute: initScreen == 0  ? "onboard": "view",
      // routes: {
      //   'onboard': (context)=> MyHomePage(),
      //   'view': (context) => ViewScreen(),
      // },
      home: isViewed != 0? MyHomePage():ViewScreen()
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  CarouselController buttonCarouselController = CarouselController();

  List<Widget> list = [

    FirstScreen(),
    SecondScreen(),
  ];
  @override
  void initState() {
    _currentPage = 0;
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
@override
_storeInfo ()async{
   int isViewed = 0;
   SharedPreferences preferences= await SharedPreferences.getInstance();
   await preferences.setInt('onboard', isViewed);
}
  @override
  Widget build(BuildContext context) {
    var getScreenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(children: [
        CarouselSlider.builder(
          itemCount: 2,

          carouselController: buttonCarouselController,
          itemBuilder: (_, i, pageI){
            return list[i];
          },

          options: CarouselOptions(
            height: getScreenHeight,

            viewportFraction: 1,
            initialPage: _currentPage,

            onPageChanged: (int index, reason) {
              setState(() {
                _currentPage = index;
              });
            },
          ),
        ),
       // Stack(children: [
          Container(
            margin: EdgeInsets.only(top: 315),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 4; i++)
                  if (i == _currentPage)
                    Dots(isActive: true)
                  else
                    Dots(isActive: false)
              ],
            ),
          ),
        //]),
        Positioned(
          bottom: 10,
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    if(_currentPage == list.length-1){
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_)=> ViewScreen()
                      ));
                    }
                    _currentPage = ++_currentPage;
                    buttonCarouselController.nextPage();
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(color: Colors.blueGrey, fontSize: 15),
                  ),
                ),
                FloatingActionButton(
                  onPressed: () async {
                    _storeInfo();
                    if(_currentPage == list.length-1){
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (_)=> ViewScreen(),


                      ));
                    }


                    _currentPage = ++_currentPage;
                    buttonCarouselController.nextPage();
                    setState(() {
                    });
                    print(_currentPage);
                  },
                  backgroundColor: Colors.deepOrange,
                  child: Icon(
                    Icons.navigate_next,
                    color: Colors.white,
                    size: 30,
                  ),
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
