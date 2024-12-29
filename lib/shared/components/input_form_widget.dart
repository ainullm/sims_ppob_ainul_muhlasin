import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:sims_ppob_ainul_muhlasin/shared/style/app_style.dart';

import '../style/app_colors.dart';

class MyInputForm extends StatelessWidget {
  const MyInputForm({
    super.key,
    this.initialValue,
    required this.name,
    this.label,
    this.hintText,
    this.preffixWidget,
    this.suffixWidget,
    this.enabled = true,
    this.obscureText = false,
    this.validators,
    this.valueTransformer,
    this.keyboardType = TextInputType.text,
    this.autovalidateMode,
    this.errorIcon,
    this.onChanged,
    this.focusNode,
    this.withIcon = false,
    this.autoFocus = false,
    this.controller,
    this.maxLines = 1,
    this.contentPadding,
    this.isDense,
    this.hintStyle,
  });

  final String? label;
  final String? initialValue;
  final String name;
  final String? hintText;
  final Widget? preffixWidget;
  final Widget? suffixWidget;
  final bool enabled;
  final bool? autoFocus;
  final bool obscureText;
  final bool? isDense;
  final String? Function(String?)? validators;
  final dynamic Function(String?)? valueTransformer;
  final TextInputType? keyboardType;
  final AutovalidateMode? autovalidateMode;
  final Image? errorIcon;
  final Function(String? data)? onChanged;
  final FocusNode? focusNode;
  final bool withIcon;
  final TextEditingController? controller;
  final int? maxLines;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? hintStyle;

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<String>(
      key: key,
      name: name,
      initialValue: initialValue,
      validator: validators,
      valueTransformer: valueTransformer,
      autovalidateMode: autovalidateMode ?? AutovalidateMode.disabled,
      onChanged: (String? data) {
        if (onChanged != null) {
          onChanged!(data);
        }
      },
      focusNode: focusNode,
      builder: (FormFieldState<dynamic> field) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              autofocus: autoFocus ?? false,
              controller: controller,
              maxLines: maxLines,
              enabled: enabled,
              onTap: () {
                if (focusNode != null) {
                  FocusScope.of(context).requestFocus(focusNode);
                }
              },
              obscureText: obscureText,
              focusNode: focusNode,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.grey.withOpacity(0.5),
                    width: 1.5,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.grey,
                    width: 1.5,
                  ),
                ),
                disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.grey,
                    width: 1.5,
                  ),
                ),
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.error,
                    width: 1.5,
                  ),
                ),
                isDense: isDense,
                fillColor: field.errorText != null
                    ? AppColors.error
                    : Colors.transparent,
                labelText: label,
                hintText: hintText,
                hintStyle: hintStyle ??
                    AppStyle.body1.copyWith(
                      color: AppColors.grey,
                    ),
                contentPadding:
                    contentPadding ?? const EdgeInsets.fromLTRB(20, 12, 20, 12),
                suffixIcon: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    suffixWidget ?? const SizedBox.shrink(),
                  ],
                ),
                prefixIcon: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    preffixWidget ?? const SizedBox.shrink(),
                  ],
                ),
              ),
              style: Theme.of(context).textTheme.bodyLarge,
              keyboardType: keyboardType,
              onChanged: (String value) {
                field.didChange(value);
              },
            ),
            field.errorText != null
                ? withIcon || errorIcon != null
                    ? Column(
                        children: [
                          const SizedBox(height: 8),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(height: 4),
                              errorIcon ??
                                  const Icon(
                                    Icons.close_rounded,
                                    color: AppColors.error,
                                    size: 12,
                                  ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  field.errorText ?? '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(color: AppColors.error),
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    : Column(
                        children: [
                          const SizedBox(height: 8),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(width: 12),
                              Text(
                                field.errorText ?? '',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(color: Colors.red.shade700),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        ],
                      )
                : const SizedBox(),
          ],
        );
      },
    );
  }
}
