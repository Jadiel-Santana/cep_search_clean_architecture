import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final IconData icon;
  final Function() onPressed;

  const Button({
    Key? key,
    required this.title,
    required this.backgroundColor,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: FloatingActionButton.extended(
        heroTag: UniqueKey(),
        label: Text(
          title,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
        icon: Icon(
          icon,
          size: 18,
          color: Colors.white,
        ),
        backgroundColor: backgroundColor,
        onPressed: onPressed,
      ),
    );
  }
}