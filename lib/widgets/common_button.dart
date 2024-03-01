import 'package:flutter/material.dart';
import '../utils/text_styles.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final Function onPressed;
  const ButtonWidget({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      width: MediaQuery.of(context).size.width,
      child: OutlinedButton(
        style: Theme.of(context).outlinedButtonTheme.style,
        onPressed: () {
          onPressed();
        },
        child: Text(text, style: TextStyles.textStyleFont20Weight600),
      ),
    );
  }
}
