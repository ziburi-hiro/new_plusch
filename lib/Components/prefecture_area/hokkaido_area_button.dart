import 'package:flutter/material.dart';
import 'package:plusch/Components/prefecture_area/municioalities_list.dart';
import 'package:plusch/Screen/after_login/mypage_related/school_list_page.dart';

class HokkaidoArea extends StatefulWidget {
  const HokkaidoArea({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  State<HokkaidoArea> createState() => _HokkaidoAreaState();
}

class _HokkaidoAreaState extends State<HokkaidoArea> {

  final List cities = municipalitiesMap['01']!;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: widget.screenSize.width*1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            title: const Text('北海道地方(1)',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),),
            onExpansionChanged: (bool changed) {},
            children: [
              ExpansionTile(
                title: const Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Text('北海道'),
                ),
                onExpansionChanged: (bool changed) {},
                children: [
                  for (int i = 0; i < cities.length; i++)
                    Column(
                      children: [
                        Divider(),
                        ListTile(
                          title: Padding(
                            padding: const EdgeInsets.only(left: 30.0),
                            child: Text(cities[i]),
                          ),
                          onTap: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => SchoolListPage({'number':1, 'prefecture':'札幌市','schoolType':'Kindergarten'}),
                                  fullscreenDialog: true,
                                )
                            );
                          },
                        ),
                      ],
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
