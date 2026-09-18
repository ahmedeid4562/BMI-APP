import 'package:flutter/material.dart';

class GenderWidget extends StatelessWidget {
  const GenderWidget({
    super.key,
    required this.image,
    required this.title,
    required this.isSelected,
    required this.onTap,
    required this.isLight,
  });

  final String image;
  final String title;
  final bool isSelected;
  final void Function() onTap;
  final bool isLight;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isSelected
                ? (isLight
                    ? const Color(0xffF2F2F2)
                    : const Color(0xff24263B))
                : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                height: 60,
                // لو مختارة وفي الفاتح تاخد اللون الوردي، لو مش مختارة في الفاتح نديها لون رمادي داكن شوية عشان تبان وما تختفيش
                color: isLight
                    ? (isSelected
                        ? const Color(0xffE83D67)
                        : Colors.black54) // لون واضح للغير مختارة في الفاتح
                    : null, // في الدارك مود تس زي ما هي
              ),
              const SizedBox(height: 15),
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: isLight
                      ? Colors.black
                      : const Color(0xff8B8C9E),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}