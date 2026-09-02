import 'package:bmiapp/Core/Function/Navigation.dart';
import 'package:bmiapp/Core/Styles/AppColors.dart';
import 'package:bmiapp/features/Pages/result.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../widget/container_for_weight_and_age.dart';
import '../widget/container_sex.dart';

class Bmiindex extends StatefulWidget {
  const Bmiindex({super.key});

  @override
  State<Bmiindex> createState() => _BmiindexState();
}

class _BmiindexState extends State<Bmiindex> {
  String selectedSex = '';
  double height = 150.0;
  double weight = 50.5;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backGround,
        leading: const Icon(Icons.local_pizza_sharp, color: Color(0xffef9a66)),
        title: const Text(
          "Bmiindex",
          style: TextStyle(color: AppColors.mainwhite),
        ),
      ),
      backgroundColor: AppColors.backGround,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ContainerSex(
                      ico: Icons.male,
                      Sex: "Male",
                      Issex: selectedSex == "Male",
                      ontap: () {
                        setState(() {
                          selectedSex = "Male";
                        });
                      },
                    ),
                  ),
                  const Gap(16),
                  Expanded(
                    child: ContainerSex(
                      ico: Icons.female,
                      Sex: "Female",
                      Issex: selectedSex == "Female",
                      ontap: () {
                        setState(() {
                          selectedSex = "Female";
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            const Gap(20),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: AppColors.itemColorOff,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Height",
                      style: TextStyle(
                        color: AppColors.mainwhite,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "${height.toStringAsFixed(2)}cm",
                      style: const TextStyle(
                        color: AppColors.mainwhite,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Slider(
                      value: height,
                      onChanged: (value) {
                        setState(() {
                          height = value;
                        });
                      },
                      min: 120.0,
                      max: 230.0,
                      thumbColor: AppColors.itemColorOn,
                      activeColor: AppColors.itemColorOn,
                    ),
                  ],
                ),
              ),
            ),
            const Gap(20),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ContainerForWeightAndAge(
                      title: "Weight",
                      weight: 40,
                      onweightChanged: (value) {
                        setState(() {
                          weight = value;
                        });
                      },
                    ),
                  ),
                  const Gap(16),
                  Expanded(
                    child: ContainerForWeightAndAge(
                      title: "Age",
                      age: 15,
                      onAgeChanged: (value) {
                        setState(() {
                          age = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            const Gap(16),

            SizedBox(
              height: 55,
              width: double.infinity,

              child: ElevatedButton(
                onPressed: () {
                  String bmiCategory;

                  double heightcm = height / 100;
                  double bmi = weight / (heightcm * heightcm);
                  if (bmi < 18.5) {
                    bmiCategory = " Underweight";
                  } else if (18.5 >= bmi && bmi < 24.9) {
                    bmiCategory = " Healthy";
                  } else if (25 >= bmi && bmi < 29.9) {
                    bmiCategory = " Overweight";
                  } else {
                    bmiCategory = " Obese";
                  }
                  PushReplacement(
                    context,
                    result(bmi: bmi.toStringAsFixed(3), bmiString: bmiCategory),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.itemColorOn,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  "Calculate",
                  style: TextStyle(color: AppColors.mainwhite, fontSize: 20),
                ),
              ),
            ),
            const Gap(10),
          ],
        ),
      ),
    );
  }
}
