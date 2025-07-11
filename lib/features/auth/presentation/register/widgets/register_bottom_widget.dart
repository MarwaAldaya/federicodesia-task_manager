import 'package:auto_route/auto_route.dart';
import 'package:bloc_arch/features/common/button/custom_elevated_button.dart';
import 'package:bloc_arch/features/common/enums/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_arch/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:bloc_arch/core/utils/extensions/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/routes/app_router.dart';
import '../../../../../core/utils/toaster.dart';
import '../cubit/register_cubit.dart';
import '../cubit/register_state.dart';

class RegisterBottomWidget extends StatelessWidget {
  const RegisterBottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            switch (state.status) {
              case CycleStatus.success:
                context.router.replace(LoginRoute());
                break;
              case CycleStatus.failure:
                Toaster.showError(context,
                    message: state.failure?.message ??
                        LocaleKeys.error_occured.tr());
                break;
              default:
                break;
            }
          },
          builder: (context, state) {
            switch (state.status) {
              case CycleStatus.loading:
                return const CircularProgressIndicator();
              default:
                return CustomElevatedButton(
                  onPressed: () {
                    context.read<RegisterCubit>().register();
                  },
                  text: LocaleKeys.register.tr(),
                  isExpanded: true,
                );
            }
          },
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(LocaleKeys.do_you_have_account.tr(),
                style:
                    context.textStyles.labelSmall?.copyWith(fontSize: 16.sp)),
            TextButton(
              onPressed: () {
                context.router.replace(LoginRoute());
              },
              child: Text(LocaleKeys.login.tr(),
                  style:
                      context.textStyles.bodyMedium?.copyWith(fontSize: 16.sp)),
            ),
          ],
        )
      ],
    );
  }
}
