import 'package:bloc_arch/core/app/bloc/app_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_arch/generated/locale_keys.g.dart';
import 'package:bloc_arch/core/utils/extensions/extensions.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: context.colors.primary,
            ),
            child: Text(
              LocaleKeys.settings.tr(),
              style: context.textStyles.titleLarge?.copyWith(
                color: context.colors.onPrimary,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.logout, color: context.colors.error),
            title: Text(
              LocaleKeys.logout.tr(),
              style: context.textStyles.bodyLarge
                  ?.copyWith(color: context.colors.error),
            ),
            onTap: () => context.read<AppCubit>().logout(),
          ),
        ],
      ),
    );
  }
}
