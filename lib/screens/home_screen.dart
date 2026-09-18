import 'dart:math';

import 'package:bmi_app/model/user_bmi_model.dart';
import 'package:bmi_app/screens/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/gender_widget.dart';
import '../widgets/info_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static String route = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool switchBtn = true;
  bool maleSelected = true;
  bool femaleSelected = false;
  int height = 116;
  int weight = 92;
  int age = 30;
  bool isMale = true;

  @override
  Widget build(BuildContext context) {
    final bool isLight = switchBtn;

    return Scaffold(
      backgroundColor:
          isLight ? Colors.white : const Color(0xff1C2135),

      appBar: AppBar(
        elevation: 0,
        backgroundColor:
            isLight ? Colors.white : const Color(0xff1C2135),

        title: Text(
          "BMI Calculator",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: isLight ? Colors.black : Colors.white,
          ),
        ),

        leading: Switch(
          value: switchBtn,
          onChanged: (value) {
            setState(() {
              switchBtn = value;
            });
          },
          activeColor: const Color(0xffE83D67),
          inactiveThumbColor: Colors.grey,
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Row(
                spacing: 6,
                children: [
                  GenderWidget(
                    image: "assets/icons/male.png",
                    title: "Male",
                    isSelected: maleSelected,
                    isLight: isLight,
                    onTap: () {
                      setState(() {
                        maleSelected = true;
                        femaleSelected = false;
                        isMale = true;
                      });
                    },
                  ),

                  GenderWidget(
                    image: "assets/icons/female.png",
                    title: "Female",
                    isSelected: femaleSelected,
                    isLight: isLight,
                    onTap: () {
                      setState(() {
                        femaleSelected = true;
                        maleSelected = false;
                        isMale = false;
                      });
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: isLight
                      ? const Color(0xffF2F2F2)
                      : const Color(0xff24263B),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Height",
                      style: TextStyle(
                        fontSize: 18,
                        color: isLight
                            ? Colors.grey
                            : const Color(0xff8B8C9E),
                      ),
                    ),

                    const SizedBox(height: 4),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          height.toString(),
                          style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.w600,
                            color: isLight
                                ? Colors.black
                                : Colors.white,
                          ),
                        ),

                        Text(
                          " cm",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: isLight
                                ? Colors.grey
                                : const Color(0xff8B8C9E),
                          ),
                        ),
                      ],
                    ),

                    Slider(
                      min: 50,
                      max: 250,
                      value: height.toDouble(),
                      activeColor: const Color(0xffE83D67),
                      inactiveColor: Colors.grey,
                      onChanged: (value) {
                        setState(() {
                          height = value.toInt();
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 8),

            Expanded(
              child: Row(
                spacing: 6,
                children: [
                  InfoUserWidget(
                    title: "Weight",
                    value: weight,
                    isLight: isLight,
                    add: () {
                      if (weight <= 200) {
                        setState(() {
                          weight++;
                        });
                      }
                    },
                    remove: () {
                      if (weight >= 2) {
                        setState(() {
                          weight--;
                        });
                      }
                    },
                  ),

                  InfoUserWidget(
                    title: "Age",
                    value: age,
                    isLight: isLight,
                    add: () {
                      if (age <= 100) {
                        setState(() {
                          age++;
                        });
                      }
                    },
                    remove: () {
                      if (age >= 1) {
                        setState(() {
                          age--;
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: CustomButtonBMI(
        title: "Calculate",
        onPressed: () {
          var user = UserBmiModel(
            Gender: isMale ? 'male' : 'female',
            Height: height,
            Weight: weight,
            Age: age,
            isLight: isLight,
          );

          Navigator.of(context).pushNamed(
            ResultScreen.route,
            arguments: user,
          );
        },
      ),
    );
  }
}

class CustomButtonBMI extends StatelessWidget {
  const CustomButtonBMI({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      color: const Color(0xffE83D67),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}