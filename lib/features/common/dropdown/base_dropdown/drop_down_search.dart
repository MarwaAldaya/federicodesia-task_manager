import 'package:bloc_arch/core/domain/entities/failure.dart';
import 'package:bloc_arch/core/utils/extensions/extensions.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropDownSearch extends StatelessWidget /*with AuthValidations */ {
  const CustomDropDownSearch(
      {Key? key,
      this.asyncItems,
      this.enabled = true,
      this.selectedItem,
      required this.onChanged,
      this.prefixIcon,
      this.suffixIcon,
      this.failure,
      this.images,
      this.validator,
      this.textStyle,
      this.showSearchBox = true,
      this.hint,
      // this.formKey,
      this.items})
      : super(key: key);
  final DropdownSearchOnFind<String>? asyncItems;
  final List<String>? items;
  final List<String>? images;
  final bool enabled;
  final validator;
  final String? selectedItem;
  final Function(String?) onChanged;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool showSearchBox;
  final Failure? failure;
  final TextStyle? textStyle;
  final String? hint;

  // final GlobalKey? formKey;

  @override
  Widget build(BuildContext context) {
    int i = -1;
    return Form(
      // key: formKey,
      child: DropdownSearch<String>(
        // validator: validator,
        asyncItems:
            asyncItems != null ? (String filter) => asyncItems!(filter) : null,
        items: items != null ? items! : [],
        itemAsString: (String u) => u,
        onBeforePopupOpening: (value) async {
          i = -1;
          return true;
        },
        popupProps: PopupPropsMultiSelection.menu(
          showSelectedItems: true,
          showSearchBox: showSearchBox,
          searchFieldProps: TextFieldProps(
            style: context.textStyles.headlineMedium?.copyWith(fontSize: 21.sp),
          ),
          // errorBuilder: (context, value, _) => Text(
          //   value,
          //   style: Get.textTheme.headlineMedium,
          // ),
          itemBuilder: (context, value, selected) {
            i++;
            return Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  if (images != null)
                    Expanded(
                      flex: 1,
                      child: Image.network(
                        images?[i] ?? "",
                        height: 30,
                      ),
                    ),
                  Expanded(
                    flex: 7,
                    child: Text(
                      value,
                      style: selected
                          ? context.textStyles.labelLarge
                              ?.copyWith(fontSize: 22.sp)
                          : context.textStyles.headlineMedium
                              ?.copyWith(fontSize: 20.sp),
                    ),
                  )
                ],
              ),
            );
          },
        ),
        enabled: enabled,
        selectedItem: selectedItem,
        onChanged: (String? data) {
          onChanged(data);
        },
        // dropdownBuilder: (),
        dropdownDecoratorProps: DropDownDecoratorProps(
          baseStyle: textStyle ??
              context.textStyles.bodySmall?.copyWith(fontSize: 20.sp),
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.center,
          dropdownSearchDecoration: InputDecoration(
            suffixIcon: suffixIcon,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            hintText: hint,
          ),
          // dropdownSearchDecoration: InputDecoration(
          //   prefixIcon: prefixIcon,
          //   contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          //   hintStyle:  Get.textTheme.bodySmall
          // border: InputBorder.none,
          // focusedBorder: kUnderlinedBorderGrey,
          // enabledBorder: InputBorder.none,
          // errorBorder: InputBorder.none,
        ),
      ),
      // ),
    );
  }
}
