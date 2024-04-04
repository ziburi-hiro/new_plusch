import 'package:flutter/material.dart';

class KinkiArea extends StatelessWidget {
  const KinkiArea({
    super.key,
    required this.screenSize,
    required this.schoolTypeEng
  });

  final Size screenSize;
  final String schoolTypeEng;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: screenSize.width*1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
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
    );
  }
}
