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
  PrefecturesSelectPage(this.schoolTypeEng, {super.key});

  String schoolTypeEng;

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
              HokkaidoArea(screenSize: screenSize,schoolTypeEng: widget.schoolTypeEng,),
              ///東北地方
              TouhokuArea(screenSize: screenSize,schoolTypeEng: widget.schoolTypeEng),
              ///関東地方
              KantouArea(screenSize: screenSize,schoolTypeEng: widget.schoolTypeEng),
              ///中部地方
              TyubuArea(screenSize: screenSize,schoolTypeEng: widget.schoolTypeEng),
              ///近畿地方
              KinkiArea(screenSize: screenSize,schoolTypeEng: widget.schoolTypeEng),
              ///中国地方
              TyugokuArea(screenSize: screenSize,schoolTypeEng: widget.schoolTypeEng),
              ///四国地方
              ShikokuArea(screenSize: screenSize,schoolTypeEng: widget.schoolTypeEng),
              ///九州地方
              KyushuArea(screenSize: screenSize,schoolTypeEng: widget.schoolTypeEng),
            ],
          ),
        ),
      ),
    );
  }
}