import 'package:flutter/material.dart';
import '../widgets/info_widget.dart';
import '../widgets/gender_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool switchBtn = false;

  bool maleSelected = true;
  bool femaleSelected = false;

  int height = 116;
  int weight = 92;
  int age = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1C2135),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff1C2135),
        title: const Text(
          "BMI Calculator",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        leading: Switch(
          value: switchBtn,
          onChanged: (value) {
            setState(() {
              switchBtn = value;
            });
          },
          activeColor: const Color(0xff3D81E8),
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
                    onTap: () {
                      setState(() {
                        maleSelected = true;
                        femaleSelected = false;
                      });
                    },
                  ),
                  GenderWidget(
                    image: "assets/icons/female.png",
                    title: "Female",
                    isSelected: femaleSelected,
                    onTap: () {
                      setState(() {
                        femaleSelected = true;
                        maleSelected = false;
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
                  color: const Color(0xff24263B),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Height",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xff8B8C9E),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          height.toString(),
                          style: const TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          " cm",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff8B8C9E),
                          ),
                        ),
                      ],
                    ),
                    Slider(
                      min: 50,
                      max: 250,
                      value: height.toDouble(),
                      activeColor: const Color(0xff3D81E8),
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
                    add: () {
                      if (age <= 120) {
                        setState(() {
                          age++;
                        });
                      }
                    },
                    remove: () {
                      if (age >= 2) {
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
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 75,
        color: const Color(0xff3D81E8),
        child: MaterialButton(
          onPressed: () {},
          child: const Text(
            "Calculate",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}