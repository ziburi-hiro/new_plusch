import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: screenSize.width*1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                  child: ExpansionTile(
                    title: const Text('北海道地方(1)',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),),
                    onExpansionChanged: (bool changed) {

                    },
                    children: [
                      Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: const Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text('北海道'),
                          ),
                          onExpansionChanged: (bool changed) {},
                          children: [],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              ///東北地方
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: screenSize.width*1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                  child: ExpansionTile(
                    title: const Text('東北地方(6)',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),),
                    onExpansionChanged: (bool changed) {

                    },
                    children: [
                      Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: const Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text('青森県'),
                          ),
                          onExpansionChanged: (bool changed) {},
                          children: [],
                        ),
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: const Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text('岩手県'),
                          ),
                          onExpansionChanged: (bool changed) {},
                          children: [],
                        ),
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: const Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text('宮城県'),
                          ),
                          onExpansionChanged: (bool changed) {},
                          children: [],
                        ),
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: const Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text('秋田県'),
                          ),
                          onExpansionChanged: (bool changed) {},
                          children: [],
                        ),
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: const Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text('山形県'),
                          ),
                          onExpansionChanged: (bool changed) {},
                          children: [],
                        ),
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: const Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text('福島県'),
                          ),
                          onExpansionChanged: (bool changed) {},
                          children: [],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              ///関東地方
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: screenSize.width*1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                  child: ExpansionTile(
                    title: const Text('関東地方(7)',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),),
                    onExpansionChanged: (bool changed) {

                    },
                    children: [
                      Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: const Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text('東京都'),
                          ),
                          onExpansionChanged: (bool changed) {},
                          children: [],
                        ),
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: const Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text('茨城県'),
                          ),
                          onExpansionChanged: (bool changed) {},
                          children: [],
                        ),
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: const Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text('栃木県'),
                          ),
                          onExpansionChanged: (bool changed) {},
                          children: [],
                        ),
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: const Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text('群馬県'),
                          ),
                          onExpansionChanged: (bool changed) {},
                          children: [],
                        ),
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: const Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text('埼玉県'),
                          ),
                          onExpansionChanged: (bool changed) {},
                          children: [],
                        ),
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: const Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text('千葉県'),
                          ),
                          onExpansionChanged: (bool changed) {},
                          children: [],
                        ),
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: const Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text('神奈川県'),
                          ),
                          onExpansionChanged: (bool changed) {},
                          children: [],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              ///中部地方
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: screenSize.width*1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                  child: ExpansionTile(
                    title: const Text('中部地方(9)',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),),
                    onExpansionChanged: (bool changed) {

                    },
                    children: [
                      Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: const Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text('新潟県'),
                          ),
                          onExpansionChanged: (bool changed) {},
                          children: [],
                        ),
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: const Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text('富山県'),
                          ),
                          onExpansionChanged: (bool changed) {},
                          children: [],
                        ),
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: const Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text('石川県'),
                          ),
                          onExpansionChanged: (bool changed) {},
                          children: [],
                        ),
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: const Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text('福井県'),
                          ),
                          onExpansionChanged: (bool changed) {},
                          children: [],
                        ),
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: const Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text('山梨県'),
                          ),
                          onExpansionChanged: (bool changed) {},
                          children: [],
                        ),
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: const Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text('長野県'),
                          ),
                          onExpansionChanged: (bool changed) {},
                          children: [],
                        ),
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: const Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text('岐阜県'),
                          ),
                          onExpansionChanged: (bool changed) {},
                          children: [],
                        ),
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: const Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text('静岡県'),
                          ),
                          onExpansionChanged: (bool changed) {},
                          children: [],
                        ),
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: const Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text('愛知県'),
                          ),
                          onExpansionChanged: (bool changed) {},
                          children: [],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              ///近畿地方
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: screenSize.width*1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                  child: ExpansionTile(
                    title: const Text('近畿地方(7)',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),),
                    onExpansionChanged: (bool changed) {

                    },
                    children: [
                      Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: const Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text('京都府'),
                          ),
                          onExpansionChanged: (bool changed) {},
                          children: [],
                        ),
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: const Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text('大阪府'),
                          ),
                          onExpansionChanged: (bool changed) {},
                          children: [],
                        ),
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: const Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text('三重県'),
                          ),
                          onExpansionChanged: (bool changed) {},
                          children: [],
                        ),
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: const Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text('滋賀県'),
                          ),
                          onExpansionChanged: (bool changed) {},
                          children: [],
                        ),
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: const Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text('兵庫県'),
                          ),
                          onExpansionChanged: (bool changed) {},
                          children: [],
                        ),
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: const Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text('奈良県'),
                          ),
                          onExpansionChanged: (bool changed) {},
                          children: [],
                        ),
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: const Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text('和歌山県'),
                          ),
                          onExpansionChanged: (bool changed) {},
                          children: [],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              ///中国地方
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: screenSize.width*1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                  child: ExpansionTile(
                    title: const Text('中国地方(5)',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),),
                    onExpansionChanged: (bool changed) {

                    },
                    children: [
                      Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: const Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text('鳥取県'),
                          ),
                          onExpansionChanged: (bool changed) {},
                          children: [],
                        ),
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: const Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text('島根県'),
                          ),
                          onExpansionChanged: (bool changed) {},
                          children: [],
                        ),
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: const Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text('岡山県'),
                          ),
                          onExpansionChanged: (bool changed) {},
                          children: [],
                        ),
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: const Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text('広島県'),
                          ),
                          onExpansionChanged: (bool changed) {},
                          children: [],
                        ),
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: const Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text('山口県'),
                          ),
                          onExpansionChanged: (bool changed) {},
                          children: [],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              ///四国地方
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: screenSize.width*1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                  child: ExpansionTile(
                    title: const Text('四国地方(4)',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),),
                    onExpansionChanged: (bool changed) {

                    },
                    children: [
                      Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: const Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text('徳島県'),
                          ),
                          onExpansionChanged: (bool changed) {},
                          children: [],
                        ),
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: const Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text('香川県'),
                          ),
                          onExpansionChanged: (bool changed) {},
                          children: [],
                        ),
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: const Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text('愛媛県'),
                          ),
                          onExpansionChanged: (bool changed) {},
                          children: [],
                        ),
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: const Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text('高知県'),
                          ),
                          onExpansionChanged: (bool changed) {},
                          children: [],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              ///九州地方
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: screenSize.width*1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                  child: ExpansionTile(
                    title: const Text('九州地方(8)',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),),
                    onExpansionChanged: (bool changed) {

                    },
                    children: [
                      Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: const Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text('福岡県'),
                          ),
                          onExpansionChanged: (bool changed) {},
                          children: [],
                        ),
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: const Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text('佐賀県'),
                          ),
                          onExpansionChanged: (bool changed) {},
                          children: [],
                        ),
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: const Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text('長崎県'),
                          ),
                          onExpansionChanged: (bool changed) {},
                          children: [],
                        ),
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: const Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text('大分県'),
                          ),
                          onExpansionChanged: (bool changed) {},
                          children: [],
                        ),
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: const Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text('熊本県'),
                          ),
                          onExpansionChanged: (bool changed) {},
                          children: [],
                        ),
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: const Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text('宮崎県'),
                          ),
                          onExpansionChanged: (bool changed) {},
                          children: [],
                        ),
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: const Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text('鹿児島県'),
                          ),
                          onExpansionChanged: (bool changed) {},
                          children: [],
                        ),
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: const Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text('沖縄県'),
                          ),
                          onExpansionChanged: (bool changed) {},
                          children: [],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
