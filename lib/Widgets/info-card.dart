import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    this.iconColor = Colors.red,
    this.backgroundColor = Colors.green,
  });

  final IconData icon;
  final String title;
  final String value;
  final Color iconColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(18)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          spacing: 8,
          children: [
            Icon(icon, color: iconColor),
            RichText(
              text: TextSpan(
                text: "$title: ",
                children: [
                  TextSpan(
                    text: value,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
