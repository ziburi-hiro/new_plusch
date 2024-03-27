import 'package:flutter/material.dart';

class HistorySearchButton extends StatelessWidget {
  const HistorySearchButton({
    super.key,
    required this.screenSize,
    required this.name,
  });

  final Size screenSize;
  final String name;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenSize.height*0.1,
      width: screenSize.width*0.46,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: Colors.white,
        ),
        child: Row(
          children: [
            Text(name,style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),),

            const Spacer(),

            Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
              child: const Center(
                child: Text('Image'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
