import 'package:bmiapp/Core/Function/Navigation.dart';
import 'package:bmiapp/Core/Styles/AppColors.dart';
import 'package:bmiapp/features/Pages/Bmiindex.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class result extends StatelessWidget {
  const result({super.key, required this.bmi, required this.bmiString});
  final String bmi;
  final String bmiString;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backGround,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.mainwhite),
          onPressed: () {
            PushTo(context, const Bmiindex());
          },
        ),
      ),
      backgroundColor: AppColors.backGround,
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Your Result",
              style: TextStyle(
                color: AppColors.mainwhite,
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Gap(30),
            Container(
              width: double.infinity,
              height: 550,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: AppColors.itemColorOff,
              ),
              child: Column(
                children: [
                  const Gap(20),
                  Expanded(
                    child: Text(
                      bmiString,
                      style: const TextStyle(
                        color: AppColors.mainwhite,
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      bmi,
                      style: const TextStyle(
                        color: AppColors.mainwhite,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTU5ceodcYnbiSaQLNzSuRxfofV6iZMQERlQDxTCN6JeQ&s=10",
                      height: 270,
                      width: 270,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const Gap(20),
                ],
              ),
            ),
            const Gap(30),
            SizedBox(
              width: double.infinity,
              height: 70,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  backgroundColor: AppColors.itemColorOn,
                ),
                onPressed: () {
                  PushTo(context, const Bmiindex());
                },
                child: const Text(
                  "Recalculate",
                  style: TextStyle(
                    color: AppColors.mainwhite,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
