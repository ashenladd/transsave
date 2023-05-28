import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:transsave/widgets/AppChatContainer.dart';
import 'package:transsave/widgets/auth/AppButton.dart';

class AppBagikanKodeButton extends StatelessWidget {
  const AppBagikanKodeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const AppButton(
          text: 'BAGIKAN KODE',
          width: 233,
        ),
        const AppChatContainer(
          isActive: true,
        )
      ],
    );
    ;
  }
}
