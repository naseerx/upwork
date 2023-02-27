import 'package:flutter/material.dart';

import '../Utils/app_utils.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onTap;
  final String name;
  final Color background;

  const CustomElevatedButton({
    Key? key,
    required this.name,
    required this.onTap,
    required this.background,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          name,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: gWhite,
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}

class CustomRoundButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;

  const CustomRoundButton({
    Key? key,
    required this.child,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 120,
        width: 150,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: gBlack,
            backgroundColor: gPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: onTap,
          child: child,
        ),
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  final VoidCallback onTap;
  final String name;

  const CustomTextButton({
    Key? key,
    required this.name,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: TextButton(
        onPressed: onTap,
        child: Text(
          name,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: gBlack,
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}
