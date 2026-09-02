import 'package:bmiapp/Core/Styles/AppColors.dart';
import 'package:flutter/material.dart';

class ContainerSex extends StatefulWidget {
  const ContainerSex({
    super.key,
    required this.ontap,
    required this.ico,
    required this.Sex,
    required this.Issex,
  });
  final IconData ico;
  final VoidCallback ontap;
  final String Sex;
  final bool Issex;
  @override
  State<ContainerSex> createState() => _ContainerSexState();
}

class _ContainerSexState extends State<ContainerSex> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.ontap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          color: widget.Issex ? AppColors.itemColorOn : AppColors.itemColorOff,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(widget.ico, color: AppColors.mainwhite, size: 150),
            Text(
              widget.Sex,
              style: const TextStyle(
                color: AppColors.mainwhite,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
