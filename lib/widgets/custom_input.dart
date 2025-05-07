import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CustomTextForm extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? Function(String?)? validator;
  final double? width;
  final double? height;
  final TextInputType? keyboardType;
  final int? maxLength;
  final bool readOnly;
  final bool? enableInteractiveSelection;
  final TextAlign textAlign;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onChanged;
  final Function()? onTap;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
  final String label;
  final bool? showLabel;

  const CustomTextForm({
    super.key,
    required this.controller,
    required this.hintText,
    this.validator,
    required this.width,
    required this.height,
    required this.keyboardType,
    required this.onChanged,
    this.maxLength,
    this.readOnly = false,
    this.enableInteractiveSelection,
    this.inputFormatters,
    this.textAlign = TextAlign.start,
    this.suffixIcon,
    this.onTap,
    this.prefixIcon,
    this.onFieldSubmitted,
    this.focusNode,
    required this.label,
    this.showLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: showLabel ?? true,
          child: Text(
            label,
            style: TextStyle(
              color: Colors.black,
              fontSize: Get.width * 0.05,
              fontWeight: FontWeight.w600,
              fontFamily: 'Rubik',
            ),
          ),
        ),
        Visibility(
          visible: showLabel ?? true,
          child: const SizedBox(height: 10),
        ),
        SizedBox(
          width: width,
          height: 55,
          child: TextFormField(
            controller: controller,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: keyboardType!,
            maxLength: maxLength,
            onTap: onTap,
            readOnly: readOnly,
            textAlign: textAlign,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
            focusNode: focusNode,
            inputFormatters: inputFormatters,
            enableInteractiveSelection: enableInteractiveSelection,
            decoration: InputDecoration(
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              hintText: hintText,
              counterText: '',
              prefixIconConstraints: BoxConstraints(
                minWidth: 30,
                minHeight: 30,
              ),
              hintStyle: const TextStyle(
                color: Colors.grey,
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black.withOpacity(0.4),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 16,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black.withOpacity(0.4),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black.withOpacity(0.2),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              errorStyle: TextStyle(fontSize: 0),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.redAccent),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onChanged: onChanged,
            validator: validator,
            onFieldSubmitted: onFieldSubmitted,
          ),
        ),
      ],
    );
  }
}
