import 'package:flutter/material.dart';
import 'package:plusch/Constants/colors.dart';
import 'package:plusch/Screen/after_login/mypage_related/check_info_page.dart';
import 'package:plusch/Screen/after_login/mypage_related/enter_info_page.dart';

class SchoolSelectButton extends StatefulWidget {
  SchoolSelectButton({
    super.key,
    required this.screenSize,
    required this.kindOfSchool,
    required this.kindOfSchoolEng,
    required this.graduatedSchoolName
  });

  final Size screenSize;
  final String kindOfSchool;
  final String kindOfSchoolEng;
  String graduatedSchoolName;

  @override
  State<SchoolSelectButton> createState() => _SchoolSelectButtonState();
}

class _SchoolSelectButtonState extends State<SchoolSelectButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.screenSize.height*0.075,
      width: widget.screenSize.width*0.9,
      child: ElevatedButton(
        onPressed: () async {
          if(widget.graduatedSchoolName == ''){
            await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => EnterInfoPage({'school':widget.kindOfSchool, 'schoolEng':widget.kindOfSchoolEng}),
                )
            ).then((value) {
              setState(() {
                widget.graduatedSchoolName = value;
              });
            });
          }else{
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CheckInfoPage(),
              )
            );
          }
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: Colors.white,
        ),
        child: Column(
          children: [
            Text(widget.kindOfSchool,style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),),
            (widget.graduatedSchoolName.isEmpty) ?
            Text('Tapして${widget.kindOfSchool}を選択',style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),)
                :
            Text(widget.graduatedSchoolName,style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),)
          ],
        ),
      ),
    );
  }
}
