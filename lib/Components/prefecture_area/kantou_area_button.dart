import 'package:flutter/material.dart';

class KantouArea extends StatefulWidget {
  const KantouArea({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  State<KantouArea> createState() => _KantouAreaState();
}

class _KantouAreaState extends State<KantouArea> {
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
            title: const Text('関東地方(7)',style: TextStyle(
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
                    child: Text('東京都'),
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
                    child: Text('茨城県'),
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
                    child: Text('栃木県'),
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
                    child: Text('群馬県'),
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
                    child: Text('埼玉県'),
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
                    child: Text('千葉県'),
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
                    child: Text('神奈川県'),
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
