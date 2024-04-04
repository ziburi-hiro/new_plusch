import 'package:flutter/material.dart';
import 'package:plusch/Components/prefecture_area/municipalities_list.dart';
import 'package:plusch/Models/school.dart';

class HokkaidoArea extends StatefulWidget {
  const HokkaidoArea({
    super.key,
    required this.screenSize,
    required this.schoolTypeEng,
  });

  final Size screenSize;
  final String schoolTypeEng;

  @override
  State<HokkaidoArea> createState() => _HokkaidoAreaState();
}

class _HokkaidoAreaState extends State<HokkaidoArea> {

  List cities = municipalitiesMap['01']!;
  String city = '札幌市';
  int selectedTile = -1;

  @override
  Widget build(BuildContext context) {
    Future<List<School>>? _schoolList =  School.getSchoolList(1,city,widget.schoolTypeEng);

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
                  Column(
                    children: [
                      Divider(),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        key: Key(selectedTile.toString()),
                        itemCount: cities.length,
                        itemBuilder: (context,index) {
                          return ExpansionTile(
                            initiallyExpanded: index == selectedTile,
                            title: Padding(
                              padding: const EdgeInsets.only(left: 30.0),
                              child: Text(cities[index]),
                            ),
                            onExpansionChanged: (bool changed){
                              if(changed) {
                                setState(() {
                                  selectedTile = index;
                                });
                              }else{
                                setState(() {
                                  selectedTile = -1;
                                });
                              }
                              setState(() {
                                city = cities[index];
                              });
                              },
                            children: [
                              FutureBuilder(
                                future: _schoolList,
                                builder: (BuildContext context, AsyncSnapshot<List<School>> snapshot) {
                                  if (snapshot.connectionState == ConnectionState.done) {
                                    if (snapshot.hasData) {
                                      List<School> data = snapshot.data!;
                                      return SafeArea(
                                        child: SingleChildScrollView(
                                          child: ListView.builder(
                                            itemCount: data?.length,
                                            shrinkWrap: true,
                                            physics: const NeverScrollableScrollPhysics(),
                                            itemBuilder: (BuildContext context,int index) {
                                              return Card(
                                                  child: ListTile(
                                                    title: Text(data[index].name),
                                                    onTap: () async {},
                                                  )
                                                );
                                              },
                                            ),
                                          ),
                                        );
                                      } else {
                                        return const Center(
                                          child: Icon(
                                            Icons.error_outline,
                                            color: Colors.red,
                                            size: 60,
                                          ),
                                        );
                                      }
                                    } else if (snapshot.connectionState == ConnectionState.waiting) {
                                      return  const Center(
                                        child: Icon(
                                          Icons.error_outline,
                                          color: Colors.red,
                                          size: 60,
                                        ),
                                      );
                                    } else {
                                      return const Center(
                                        child: Icon(
                                          Icons.error_outline,
                                          color: Colors.red,
                                          size: 60,
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ],
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
