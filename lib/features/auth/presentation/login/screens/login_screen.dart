import 'package:auto_route/auto_route.dart';
import 'package:bloc_arch/core/app/injectable_config.dart';
import 'package:bloc_arch/features/auth/presentation/login/widgets/login_bottom_widget.dart';
import 'package:bloc_arch/features/common/dropdown/workspace_dropdown/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_arch/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../core/utils/text_fields_validation.dart';
import '../../../../common/text_fields/custom_text_field.dart';
import '../cubit/login_cubit.dart';
import '../cubit/login_state.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<LoginCubit>()),
        BlocProvider(create: (_) => getIt<WorkspaceDropdownCubit>()),
      ],
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(
              child: SingleChildScrollView(
                child: Builder(builder: (context) {
                  return BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      final cubit = context.read<LoginCubit>();
                      return Form(
                        key: formKey,
                        child: Column(
                          children: [
                            FlutterLogo(),
                            const SizedBox(height: 32),
                            CustomTextField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              hintText: LocaleKeys.email.tr(),
                              validator: Validator.validateEmail,
                              onChanged: (value) {
                                cubit.emailChanged(value);
                              },
                              onFieldSubmitted: (value) {
                                cubit.emailChanged(value);
                              },
                              onEditingComplete: () {
                                cubit.emailChanged(emailController.text);
                              },
                            ),
                            const SizedBox(height: 16),
                            CustomTextField(
                              controller: passwordController,
                              hintText: LocaleKeys.password.tr(),
                              isPassword: true,
                              validator: Validator.validatePassword,
                              onChanged: (value) {
                                cubit.passwordChanged(value);
                              },
                            ),
                            const SizedBox(height: 16),
                            BlocConsumer<LoginCubit, LoginState>(
                              listenWhen: (previous, current) =>
                                  previous.email != current.email &&
                                  current.isEmailValid,
                              listener: (context, state) {
                                if (state.isEmailValid) {
                                  context
                                      .read<WorkspaceDropdownCubit>()
                                      .fetchWorkspaces(
                                        isForUser: true,
                                        email: state.email,
                                      );
                                }
                              },
                              builder: (context, loginState) {
                                return BlocBuilder<WorkspaceDropdownCubit,
                                    WorkspaceDropdownState>(
                                  builder: (context, wsState) {
                                    return WorkspaceDropdown(
                                      readOnly: !(loginState.isEmailValid),
                                      onWorkspaceSelected: (workspace) {
                                        cubit.workspaceChanged(workspace?.id);
                                      },
                                      showSearchBox: false,
                                    );
                                  },
                                );
                              },
                            ),
                            const SizedBox(height: 16),
                            LoginBottomWidget(formKey: formKey),
                          ],
                        ),
                      );
                    },
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
