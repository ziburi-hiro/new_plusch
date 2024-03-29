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
      height: screenSize.height*0.075,
      width: screenSize.width*0.9,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: Colors.white,
        ),
        child: Column(
          children: [
            Text(kindOfSchool,style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),),
            Text('Tapして$kindOfSchoolを選択',style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),),
          ],
        ),
      ),
    );
  }
}
