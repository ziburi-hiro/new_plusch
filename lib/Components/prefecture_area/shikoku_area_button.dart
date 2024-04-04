import 'package:flutter/material.dart';

class ShikokuArea extends StatefulWidget {
  const ShikokuArea({
    super.key,
    required this.screenSize,
    required this.schoolTypeEng
  });

  final Size screenSize;
  final String schoolTypeEng;

  @override
  State<ShikokuArea> createState() => _ShikokuAreaState();
}

class _ShikokuAreaState extends State<ShikokuArea> {
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
    );
  }
}