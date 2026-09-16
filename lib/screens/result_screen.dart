import 'package:bmi_app/model/user_bmi_model.dart';
import 'package:bmi_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});
   static String route = "ResultScreen";

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)?.settings.arguments as UserBmiModel;
    return Scaffold(
      backgroundColor: const Color(0xff1C2135),
      appBar: AppBar(
        elevation: 10,
        backgroundColor: const Color(0xff1C2135),
        title: const Text(
          "BMI Calculator",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              "Your Result",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Color(0xffFFFFFF),
              ),
            ),
            SizedBox(height: 25),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(60),
                decoration: BoxDecoration(
                  color: Color(0xff333244),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 60),
                    Text(
                      arguments.stringView,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color:arguments.categoryColor,
                      ),
                    ),
                    SizedBox(height: 33),

                    Text(
                      arguments.ResulteBmi.toString(),
                      style: TextStyle(
                        fontSize: 64,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                    SizedBox(height: 60),
                    Text(
                      arguments.healthAdvice,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff88C9EE),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          SizedBox(height: 10),
          ],
        ),
      ),
      bottomNavigationBar: CustomButtonBMI(title:"Re - Calculate", onPressed: (){
        Navigator.of(context).pop();
      }),
    );
  }
}