import 'package:flutter/material.dart';

class CustomSquareButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final Color color;
  final double dimensions;

  const CustomSquareButton({Key? key,
    required this.child,
    required this.onPressed,
    required this.color,
    required this.dimensions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        GestureDetector(
          onTap: onPressed,
          child: Container(
            height: dimensions,
            width: dimensions,
            decoration: ShapeDecoration(
              color: color,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(2),
              )
            ),
            child: Center(child: child),
          ),
        );
  }
}
