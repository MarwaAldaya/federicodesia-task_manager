import 'package:auto_route/auto_route.dart';
import 'package:bloc_arch/core/widgets/loading_widget.dart';
import 'package:bloc_arch/features/common/enums/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_arch/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:bloc_arch/core/utils/extensions/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/routes/app_router.dart';
import '../../../../../core/utils/toaster.dart';
import '../../../../common/button/custom_elevated_button.dart';
import '../cubit/login_cubit.dart';
import '../cubit/login_state.dart';

class LoginBottomWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const LoginBottomWidget({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            switch (state.status) {
              case CycleStatus.success:
                context.router.replace(TaskListWrapperRoute());
                break;
              case CycleStatus.failure:
                Toaster.showError(context,
                    message:
                        state.errorMessage ?? LocaleKeys.error_occured.tr());
                break;
              default:
                break;
            }
          },
          builder: (context, state) {
            switch (state.status) {
              case CycleStatus.loading:
                return const LoadingWidget();
              default:
                return CustomElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      context.read<LoginCubit>().loginSubmitted();
                    }
                  },
                  text: LocaleKeys.login.tr(),
                  isExpanded: true,
                );
            }
          },
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(LocaleKeys.dont_have_account.tr(),
                style:
                    context.textStyles.labelSmall?.copyWith(fontSize: 16.sp)),
            TextButton(
              onPressed: () {
                context.router.replace(RegisterRoute());
              },
              child: Text(LocaleKeys.register_now.tr(),
                  style:
                      context.textStyles.bodyMedium?.copyWith(fontSize: 16.sp)),
            ),
          ],
        )
      ],
    );
  }
}
