import 'package:bloc_arch/core/domain/entities/failure.dart';
import 'package:bloc_arch/core/utils/extensions/extensions.dart';
import 'package:bloc_arch/core/utils/resources/color_manager.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomMultiSelectionDropDownSearch
    extends StatelessWidget /*with AuthValidations */ {
  const CustomMultiSelectionDropDownSearch(
      {Key? key,
      this.asyncItems,
      this.enabled = true,
      this.suffixIcon,
      required this.selectedItems,
      // required this.selectedItem,
      required this.onChanged,
      this.prefixIcon,
      this.failure,
      this.validator,
      this.textStyle,
      this.textController,
      this.showSearchBox = true,
      // this.formKey,
      this.items})
      : super(key: key);
  final DropdownSearchOnFind<String>? asyncItems;
  final List<String>? items;
  final List<String> selectedItems;
  final bool enabled;
  final Widget? suffixIcon;
  final validator;
  final TextEditingController? textController;

  // final String selectedItem;
  final Function(List<String>?) onChanged;
  final Widget? prefixIcon;
  final bool showSearchBox;
  final Failure? failure;
  final TextStyle? textStyle;

  // final GlobalKey? formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      // key: formKey,
      child: Row(
        children: [
          Expanded(
            flex: 9,
            child: DropdownSearch<String>.multiSelection(
              asyncItems: asyncItems != null
                  ? (String filter) => asyncItems!(filter)
                  : null,
              selectedItems: selectedItems,
              squareColor: ColorManager.darkGrey.withOpacity(0.1),
              textSquareStyle: context.textStyles.bodyMedium,
              removeIconColor: ColorManager.primary,
              items: items != null ? items! : [],
              itemAsString: (String u) => u,
              autoValidateMode: AutovalidateMode.always,
              enabled: enabled,
              popupProps: PopupPropsMultiSelection.menu(
                showSelectedItems: true,
                showSearchBox: showSearchBox,
                constraints: BoxConstraints(maxHeight: 350.h),
                searchFieldProps: TextFieldProps(
                  style: context.textStyles.headlineMedium
                      ?.copyWith(fontSize: 21.sp),
                ),
                itemBuilder: (context, value, selected) => Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          value,
                          style: selected
                              ? context.textStyles.labelLarge
                                  ?.copyWith(fontSize: 24.sp)
                              : context.textStyles.headlineMedium
                                  ?.copyWith(fontSize: 21.sp),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              onChanged: (List<String>? data) {
                onChanged(data);
              },
              dropdownDecoratorProps: DropDownDecoratorProps(
                baseStyle:
                    context.textStyles.displaySmall!.copyWith(fontSize: 20.sp),
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.center,
                dropdownSearchDecoration: InputDecoration(
                  suffixIcon: suffixIcon,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                ),
              ),
            ),
          ),
          // Expanded(
          //   flex: 1,
          //   child: Container(
          //     height: 50,
          //     decoration: BoxDecoration(
          //       color: ColorManager.green,
          //       borderRadius: const BorderRadiusDirectional.only(
          //         topEnd: Radius.circular(10),
          //         bottomEnd: Radius.circular(10),
          //       ),
          //     ),
          //     child: Icon(
          //       Icons.add,
          //       color: ColorManager.background,
          //     ),
          //   ),
          // ),
        ],
      ),
      // ),
    );
  }
}
