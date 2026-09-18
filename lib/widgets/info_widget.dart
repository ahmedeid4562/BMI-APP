import 'package:flutter/material.dart';

class InfoUserWidget extends StatelessWidget {
  const InfoUserWidget({
    super.key,
    required this.title,
    required this.value,
    required this.add,
    required this.remove,
    required this.isLight,
  });

  final String title;
  final int value;
  final void Function() add;
  final void Function() remove;
  final bool isLight;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: isLight
              ? const Color(0xffF2F2F2)
              : const Color(0xff24263B),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: isLight
                    ? Colors.grey
                    : const Color(0xff8B8C9E),
              ),
            ),

            Text(
              value.toString(),
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: isLight
                    ? Colors.black
                    : const Color(0xffFFFFFF),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: const Color(0xff8B8C9E),
                    elevation: 5,
                    shadowColor: Colors.grey,
                  ),
                  onPressed: remove,
                  icon: const Icon(
                    Icons.remove,
                    color: Color(0xffFFFFFF),
                  ),
                ),

                IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: const Color(0xff8B8C9E),
                    elevation: 5,
                    shadowColor: Colors.grey,
                  ),
                  onPressed: add,
                  icon: const Icon(
                    Icons.add,
                    color: Color(0xffFFFFFF),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

