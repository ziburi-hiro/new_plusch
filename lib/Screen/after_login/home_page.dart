import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plusch/Constants/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentSlider = 0;

  final cards = List.generate(5, (index) => Container(
    height: 300,
    width: 400,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: Colors.white,
    ),
    child: Text('おすすめ履歴${index+1}'),
  ));

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: mainBackColor,
        appBar: AppBar(
          title: const Text('ホーム',style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),),
          automaticallyImplyLeading: false,
          backgroundColor: appbarColor,
        ),
        body: SingleChildScrollView(
          child: ScreenUtilInit(
            designSize: const Size(393, 852),
            child: Column(
              children: [

                const Padding(
                  padding: EdgeInsets.only(top: 10.0,left: 15.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('おすすめ履歴',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: 300,
                      autoPlay: true,
                      viewportFraction: 0.8,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason){
                        setState(() {
                          currentSlider = index;
                        });
                      }
                    ),
                    items: cards
                  ),
                ),
                DotsIndicator(
                  dotsCount: cards.length,
                  position: currentSlider,
                  decorator: const DotsDecorator(
                    activeColor: mainColor,
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.only(top: 10.0, left: 15.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('閲覧した履歴',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),),
                  ),
                ),

                ///閲覧した履歴がない場合は表示しない？
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    height: screenSize.height*0.4,
                    width: screenSize.width*0.93,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                    ),
                    child: Text('閲覧した履歴表示'),
                  ),
                ),

                SizedBox(height: 20,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
