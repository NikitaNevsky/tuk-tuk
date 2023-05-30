import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AdaptText extends StatelessWidget {
  final String text;
  final double shortestSide;
  final double? scale;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final Color? fontColor;
  final TextAlign? textAlign;

  const AdaptText(
    this.text,
    this.shortestSide, 
    {
      this.scale,
      this.fontWeight,
      this.fontFamily,
      this.fontColor,
      this.textAlign,
    }
  );

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.center,
      style: TextStyle(
        fontSize: shortestSide / 8 * (scale ?? 1),
        fontWeight: fontWeight ?? FontWeight.normal,
        fontFamily: fontFamily,
        color: fontColor,
      ),
    );
  }
}

class CustomTextForm extends StatelessWidget {
  final String? labelText;
  final bool? obscureText;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixIcon;

  const CustomTextForm(
    {
      super.key,
      this.labelText,
      this.onChanged,
      this.obscureText,
      this.validator,
      this.keyboardType,
      this.inputFormatters,
      this.suffixIcon,
    }
  );
  
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      child: TextFormField(
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        obscureText: obscureText ?? false,
        onChanged: onChanged,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          labelText: labelText,
        ),
        validator: validator,
      ),
    );
  }
}
