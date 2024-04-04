import 'package:flutter/material.dart';

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
    );
  }
}
