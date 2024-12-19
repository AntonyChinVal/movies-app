import 'package:flutter/material.dart';
import 'package:app/presentation/theme/theme_extension.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isOutlined;
  final bool isLoading;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isOutlined = false,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor:
            isOutlined ? Colors.transparent : context.appTheme.primaryColor,
        foregroundColor:
            isOutlined ? context.appTheme.primaryColor : Colors.white,
        side: isOutlined
            ? BorderSide(color: context.appTheme.primaryColor)
            : null,
        padding: EdgeInsets.symmetric(
          horizontal: context.appTheme.spacingL,
          vertical: context.appTheme.spacingM,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(context.appTheme.radiusM),
        ),
      ),
      child: isLoading
          ? SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(
                  isOutlined ? context.appTheme.primaryColor : Colors.white,
                ),
              ),
            )
          : Text(text, style: context.appTheme.labelLarge),
    );
  }
}
