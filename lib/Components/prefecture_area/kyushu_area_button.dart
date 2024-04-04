import 'package:flutter/material.dart';

class KyushuArea extends StatefulWidget {
  const KyushuArea({
    super.key,
    required this.screenSize,
    required this.schoolTypeEng,
  });

  final Size screenSize;
  final String schoolTypeEng;

  @override
  State<KyushuArea> createState() => _KyushuAreaState();
}

class _KyushuAreaState extends State<KyushuArea> {
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
            title: const Text('九州地方(8)',style: TextStyle(
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
                    child: Text('福岡県'),
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
                    child: Text('佐賀県'),
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
                    child: Text('長崎県'),
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
                    child: Text('大分県'),
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
                    child: Text('熊本県'),
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
                    child: Text('宮崎県'),
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
                    child: Text('鹿児島県'),
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
                    child: Text('沖縄県'),
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
