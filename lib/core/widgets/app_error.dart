import 'package:bloc_arch/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'app_button.dart';
import 'package:bloc_arch/core/utils/extensions/extensions.dart';

class AppError extends StatelessWidget {
  final String msg;
  final Function() retry;
  final Color? color;

  const AppError({
    super.key,
    required this.msg,
    required this.retry,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Assets.lotties.error.lottie(
            //   height: 35,
            //   width: 35,
            // ),
            const SizedBox(width: 10),
            Text(
              msg,
              style: context.textStyles.titleLarge,
            ),
          ],
        ),
        const SizedBox(height: 40),
        AppButton(
          text: LocaleKeys.retry.tr(),
          color: color ?? context.colors.primary,
          textColor: context.colors.onPrimary,
          action: retry,
          customWidth: 120,
        )
      ],
    );
  }
}
