import 'package:flutter/material.dart';
import 'package:plusch/Constants/colors.dart';

class SchoolSelectButton extends StatelessWidget {
  const SchoolSelectButton({
    super.key,
    required this.screenSize,
    required this.kindOfSchool,
    required this.kindOfSchoolEng,
  });

  final Size screenSize;
  final String kindOfSchool;
  final String kindOfSchoolEng;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenSize.height*0.08,
      width: screenSize.width*0.9,
      child: Card(
        color: Colors.white,
        child: InkWell(
          splashColor: Colors.grey.shade300,
          onTap: () {
            print('hello');
          },
          child: Column(
            children: [
              Text(kindOfSchool,style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),),
              Text('Tapして$kindOfSchoolを選択',style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
