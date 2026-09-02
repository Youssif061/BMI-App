import 'package:bmiapp/Core/Styles/AppColors.dart';
import 'package:flutter/material.dart';

class ContainerForWeightAndAge extends StatefulWidget {
  const ContainerForWeightAndAge({
    super.key,
    this.title = '',
    this.weight,
    this.age,
    this.onweightChanged,
    this.onAgeChanged,
  });
  final String title;
  final double? weight;
  final int? age;
  final ValueChanged<double>? onweightChanged;
  final ValueChanged<int>? onAgeChanged;
  @override
  State<ContainerForWeightAndAge> createState() =>
      _ContainerForWeightAndAgeState();
}

class _ContainerForWeightAndAgeState extends State<ContainerForWeightAndAge> {
  late double counterForweight;
  late int counterForAge;

  @override
  void initState() {
    super.initState();
    counterForweight = widget.weight ?? 50.5;
    counterForAge = widget.age ?? 20;
  }

  @override
  Widget build(BuildContext context) {
    final bool isweight = widget.title == "Weight";
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.itemColorOff,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              color: AppColors.mainwhite,
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            isweight
                ? counterForweight.toStringAsFixed(2)
                : counterForAge.toString(),
            style: const TextStyle(
              color: AppColors.mainwhite,
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton.filled(
                onPressed: () {
                  setState(() {
                    if (isweight) {
                      counterForweight -= 0.50;
                      widget.onweightChanged?.call(counterForweight);
                    } else {
                      counterForAge--;
                      widget.onAgeChanged?.call(counterForAge);
                    }
                  });
                },
                icon: const Icon(Icons.remove),
                color: AppColors.itemColorOff,
              ),
              IconButton.filled(
                onPressed: () {
                  setState(() {
                    if (isweight) {
                      counterForweight += 5;
                      widget.onweightChanged?.call(counterForweight);
                    } else {
                      counterForAge++;
                      widget.onAgeChanged?.call(counterForAge);
                    }
                  });
                },
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
