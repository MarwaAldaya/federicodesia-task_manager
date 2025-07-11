import 'package:auto_route/auto_route.dart';
import 'package:bloc_arch/features/common/text_fields/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../core/app/injectable_config.dart';
import '../../../../../core/utils/text_fields_validation.dart';
import '../cubit/register_cubit.dart';
import '../cubit/register_state.dart';
import '../widgets/register_bottom_widget.dart';
import 'package:bloc_arch/features/common/dropdown/workspace_dropdown/index.dart';
import 'package:bloc_arch/generated/locale_keys.g.dart';

@RoutePage()
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<RegisterCubit>()),
        BlocProvider(
            create: (_) => getIt<WorkspaceDropdownCubit>()..fetchWorkspaces()),
      ],
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(
              child: SingleChildScrollView(
                child: BlocBuilder<RegisterCubit, RegisterState>(
                  builder: (context, state) {
                    final cubit = context.read<RegisterCubit>();
                    return Form(
                      key: cubit.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          FlutterLogo(),
                          const SizedBox(height: 32),
                          CustomTextField(
                            controller: cubit.emailController,
                            keyboardType: TextInputType.emailAddress,
                            hintText: LocaleKeys.email.tr(),
                            validator: Validator.validateEmail,
                          ),
                          const SizedBox(height: 16),
                          CustomTextField(
                            controller: cubit.passwordController,
                            hintText: LocaleKeys.password.tr(),
                            isPassword: true,
                            validator: Validator.validatePassword,
                          ),
                          const SizedBox(height: 16),
                          CustomTextField(
                            controller: cubit.confirmPasswordController,
                            hintText: LocaleKeys.confirm_password.tr(),
                            isPassword: true,
                            validator: (value) =>
                                cubit.passwordController.text == value
                                    ? null
                                    : LocaleKeys.passwords_do_not_match.tr(),
                          ),
                          const SizedBox(height: 16),
                          BlocBuilder<WorkspaceDropdownCubit,
                              WorkspaceDropdownState>(
                            builder: (context, wsState) {
                              return WorkspaceDropdown(
                                showSearchBox: true,
                                onWorkspaceSelected: (workspace) {
                                  cubit.updateWorkspace(workspace);
                                },
                              );
                            },
                          ),
                          const SizedBox(height: 24),
                          RegisterBottomWidget(),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
