import 'package:flutter/material.dart';
import 'package:plusch/Components/prefecture_area/municipalities_list.dart';
import 'package:plusch/Models/school.dart';

class TyubuArea extends StatefulWidget {
  const TyubuArea({
    super.key,
    required this.screenSize,
    required this.schoolTypeEng,
  });

  final Size screenSize;
  final String schoolTypeEng;

  @override
  State<TyubuArea> createState() => _TyubuAreaState();
}

class _TyubuAreaState extends State<TyubuArea> {
  List<List> cities = [
    municipalitiesMap['15']!,
    municipalitiesMap['16']!,
    municipalitiesMap['17']!,
    municipalitiesMap['18']!,
    municipalitiesMap['19']!,
    municipalitiesMap['20']!,
    municipalitiesMap['21']!,
    municipalitiesMap['22']!,
    municipalitiesMap['23']!
  ];
  List prefectureList = ['新潟県','富山県','石川県','福井県','山梨県','長野県','岐阜県','静岡県','愛知県'];
  String city = '';
  int prefectureNum = 0;
  int selectedMunicipalityTile = -1;
  int selectedPrefectureTile = -1;

  @override
  Widget build(BuildContext context) {
    Future<List<School>>? schoolList =  School.getSchoolList(prefectureNum,city,widget.schoolTypeEng);

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
            title: const Text('中部地方(9)',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),),
            onExpansionChanged: (bool changed) {

            },
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  key: Key(selectedPrefectureTile.toString()),
                  itemCount: prefectureList.length,
                  itemBuilder: (context, findex){
                    return ExpansionTile(
                      initiallyExpanded: findex == selectedPrefectureTile,
                      title: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(prefectureList[findex]),
                      ),
                      onExpansionChanged: (bool changed) {
                        setState(() {
                          selectedMunicipalityTile = -1;
                        });
                        if(changed) {
                          setState(() {
                            selectedPrefectureTile = findex;
                          });
                        }else{
                          setState(() {
                            selectedPrefectureTile = -1;
                          });
                        }
                      },
                      children: [
                        Column(
                          children: [
                            const Divider(),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              key: Key(selectedMunicipalityTile.toString()),
                              itemCount: cities[findex].length,
                              itemBuilder: (context,index) {
                                return ExpansionTile(
                                  initiallyExpanded: index == selectedMunicipalityTile,
                                  title: Padding(
                                    padding: const EdgeInsets.only(left: 30.0),
                                    child: Text(cities[findex][index]),
                                  ),
                                  onExpansionChanged: (bool changed){
                                    if(changed) {
                                      setState(() {
                                        selectedMunicipalityTile = index;
                                      });
                                    }else{
                                      setState(() {
                                        selectedMunicipalityTile = -1;
                                      });
                                    }
                                    setState(() {
                                      city = cities[findex][index];
                                      prefectureNum =  findex + 15;
                                    });
                                  },
                                  children: [
                                    FutureBuilder(
                                      future: schoolList,
                                      builder: (BuildContext context, AsyncSnapshot<List<School>> snapshot) {
                                        if (snapshot.connectionState == ConnectionState.done) {
                                          if (snapshot.hasData) {
                                            List<School> data = snapshot.data!;
                                            return SafeArea(
                                              child: SingleChildScrollView(
                                                child: ListView.builder(
                                                  itemCount: data.length,
                                                  shrinkWrap: true,
                                                  physics: const NeverScrollableScrollPhysics(),
                                                  itemBuilder: (BuildContext context,int index) {
                                                    return Card(
                                                        child: ListTile(
                                                          title: Text(data[index].schoolName),
                                                          onTap: () async {
                                                            Navigator.pop(context,[data[index].schoolName.toString(),data[index].schoolId.toString()]);
                                                          },
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
                            const Divider(),
                          ],
                        ),
                      ],
                    );
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
