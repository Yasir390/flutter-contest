import 'package:flutter/material.dart';

import '../gen/colors.gen.dart';

class CustomTextFormField extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final double? height;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final EdgeInsets? contentPadding;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool isPrefixIcon;
  final double borderRadius;
  final VoidCallback? onSuffixIconTap;
  final String? iconpath;
  final int maxline;
  final int? minLines;
  final bool readOnly;
  final bool isBorder;
  final Color fillColor;
  // final Color? textInputColor;
  final Color? focusBorderColor;
  final Color? enableBorderColor;
  final Color? cursorColor;
  final TextStyle? hintStyle;
  final TextStyle? textInputStyle;
  final TextInputAction? textInputAction;
  final TextAlign? textAlign;
  const CustomTextFormField({
    super.key,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.validator,
    this.borderRadius = 10.0, // Set to 10 pixels
    required this.isPrefixIcon,
    this.iconpath,
    this.onSuffixIconTap,
    this.readOnly = false,
    this.maxline = 1,
    this.isBorder = false,
    this.fillColor = AppColors.scaffoldColor,
    this.hintStyle,
    this.contentPadding,
    this.height,
    this.minLines,
    // this.textInputColor,
    this.textAlign,
    this.textInputStyle,
    this.focusBorderColor,
    this.enableBorderColor,
    this.cursorColor,
    this.textInputAction,
  });

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        //  isFocused = focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
      child: TextFormField(
      maxLength: 500,
        textInputAction: widget.textInputAction,
        textAlign: widget.textAlign ?? TextAlign.start,
        readOnly: widget.readOnly,
        maxLines: widget.maxline,
        minLines: widget.minLines,
        focusNode: _focusNode,
        cursorColor: widget.cursorColor,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText,
        onChanged: widget.onChanged,
        validator: widget.validator,
        decoration: InputDecoration(

          filled: true,
          fillColor: widget.fillColor,
          labelText: widget.labelText,
          hintText: widget.hintText,
          hintStyle: widget.hintStyle,
          prefixIcon: widget.isPrefixIcon ? widget.prefixIcon : null,
          suffixIcon: widget.suffixIcon,
          // suffixIcon: widget.suffixIcon != null
          //     ? GestureDetector(
          //   onTap: widget.onSuffixIconTap,
          //   child: Padding(
          //     padding: EdgeInsets.only(right: 16.w),
          //     child: Icon(
          //       widget.suffixIcon,
          //       color: _isFocused
          //           ? AppColors.allPrimaryColor
          //           : AppColors.cffffff,
          //     ),
          //   ),
          // )
          //     : null,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: widget.isBorder == true
                ? BorderSide(
              // width: 1,
              color: widget.enableBorderColor ??
                  AppColors.c000000, // Adjust the border width if needed
            )
                : BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: BorderSide(
              width: 1,
              color: widget.focusBorderColor ??
                  AppColors
                      .allPrimaryColor, // Adjust the border width if needed
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: const BorderSide(color: Colors.red),
          ),
          disabledBorder: InputBorder.none,
          contentPadding: widget.contentPadding,
        ),
        style: widget.textInputStyle,
      ),
    );
  }
}
