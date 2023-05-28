import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:transsave/widgets/AppChatContainer.dart';
import 'package:transsave/widgets/transaction_seller/AppChoiceButton.dart';

class AppNegoButton extends StatelessWidget {
  const AppNegoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const AppChoiceButton(
          isAgree: true,
        ),
        const AppChoiceButton(
          isAgree: false,
        ),
        const AppChatContainer(
          isActive: true,
        )
      ],
    );
  }
}
