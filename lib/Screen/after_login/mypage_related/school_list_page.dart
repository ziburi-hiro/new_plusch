import 'package:flutter/material.dart';
import 'package:plusch/Models/school.dart';

class SchoolListPage extends StatefulWidget {
  SchoolListPage(this.schoolInfo,{super.key});

  Map schoolInfo;

  @override
  State<SchoolListPage> createState() => _SchoolListPageState();
}

class _SchoolListPageState extends State<SchoolListPage> {
  @override
  Widget build(BuildContext context) {
    Future<List<School>>? _schoolList =  School.getSchoolList(widget.schoolInfo['number'], widget.schoolInfo['prefecture'], widget.schoolInfo['schoolType']);

    return Scaffold(
      appBar: AppBar(
        title: Text('学校リスト'),
      ),
      body: FutureBuilder(
        future: _schoolList,
        builder: (BuildContext context, AsyncSnapshot<List<School>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            print(snapshot);
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
                            onTap: () async{},
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
                // child: Padding(
                //   padding: const EdgeInsets.only(top: 16),
                //   child: Text('Error: ${snapshot.error}'),
                // );
              );
            }
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return  const Center(
              child: Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              // child: Padding(
              //   padding: const EdgeInsets.only(top: 16),
              //   child: Text('Error: ${snapshot.error}'),
              // );
            );
          } else {
            return const Center(
              child: Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              // child: Padding(
              //   padding: const EdgeInsets.only(top: 16),
              //   child: Text('Error: ${snapshot.error}'),
              // );
            );
          }
        },
      ),
    );
  }
}
