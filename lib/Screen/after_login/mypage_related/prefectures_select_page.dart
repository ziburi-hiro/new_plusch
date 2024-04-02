import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plusch/Components/prefecture_area/hokkaido_area_button.dart';
import 'package:plusch/Components/prefecture_area/kantou_area_button.dart';
import 'package:plusch/Components/prefecture_area/kinki_area_button.dart';
import 'package:plusch/Components/prefecture_area/kyushu_area_button.dart';
import 'package:plusch/Components/prefecture_area/shikoku_area_button.dart';
import 'package:plusch/Components/prefecture_area/tohoku_area_button.dart';
import 'package:plusch/Components/prefecture_area/tyubu_area_button.dart';
import 'package:plusch/Components/prefecture_area/tyugoku_area_button.dart';
import 'package:plusch/Constants/colors.dart';

class PrefecturesSelectPage extends StatefulWidget {
  const PrefecturesSelectPage({super.key});

  @override
  State<PrefecturesSelectPage> createState() => _PrefecturesSelectPageState();
}

class _PrefecturesSelectPageState extends State<PrefecturesSelectPage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: mainBackColor,
      appBar: AppBar(
        title: const Text('都道府県を選択',style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),),
        backgroundColor: appbarColor,
      ),
      body: SingleChildScrollView(
        child: ScreenUtilInit(
          designSize: const Size(393, 852),
          child: Column(
            children: [

              ///北海道地方
              HokkaidoArea(screenSize: screenSize),
              ///東北地方
              TouhokuArea(screenSize: screenSize),
              ///関東地方
              KantouArea(screenSize: screenSize),
              ///中部地方
              TyubuArea(screenSize: screenSize),
              ///近畿地方
              KinkiArea(screenSize: screenSize),
              ///中国地方
              TyugokuArea(screenSize: screenSize),
              ///四国地方
              ShikokuArea(screenSize: screenSize),
              ///九州地方
              KyushuArea(screenSize: screenSize),
            ],
          ),
        ),
      ),
    );
  }
}