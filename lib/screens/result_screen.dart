import 'package:bmi_app/model/user_bmi_model.dart';
import 'package:bmi_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});
  static String route = "ResultScreen";

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)?.settings.arguments as UserBmiModel;
    
    // استخدام المتغير لتحديد هل الصفحة فاتحة ولا غامقة
    final bool isLight = arguments.isLight;

    return Scaffold(
      backgroundColor: isLight ? Colors.white : const Color(0xff1C2135),
      appBar: AppBar(
        elevation: 10,
        backgroundColor: isLight ? Colors.white : const Color(0xff1C2135),
        iconTheme: IconThemeData(
          color: isLight ? Colors.black : Colors.white, // لون زر الرجوع
        ),
        title: Text(
          "BMI Calculator",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: isLight ? Colors.black : Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your Result",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: isLight ? Colors.black : const Color(0xffFFFFFF),
              ),
            ),
            const SizedBox(height: 25),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(40),
                decoration: BoxDecoration(
                  // لون خلفية الكارت يتغير حسب المود
                  color: isLight ? const Color(0xffF2F2F2) : const Color(0xff333244),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      arguments.stringView,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: arguments.categoryColor,
                      ),
                    ),
                    const SizedBox(height: 33),
                    Text(
                      arguments.ResulteBmi.toString(),
                      style: TextStyle(
                        fontSize: 64,
                        fontWeight: FontWeight.bold,
                        color: isLight ? Colors.black : const Color(0xffFFFFFF),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Text(
                      arguments.healthAdvice,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: isLight ? const Color(0xff3D81E8) : const Color(0xff88C9EE),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
      bottomNavigationBar: CustomButtonBMI(
        title: "Re - Calculate",
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}