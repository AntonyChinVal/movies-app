import 'package:flutter/material.dart';
import 'package:app/presentation/theme/theme_extension.dart';

class ErrorDialog extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback? onRetry;

  const ErrorDialog({
    super.key,
    this.title = 'Error',
    required this.message,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title, style: context.appTheme.titleLarge),
      content: Text(message, style: context.appTheme.bodyMedium),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            'Close',
            style: context.appTheme.labelLarge.copyWith(
              color: context.appTheme.textSecondaryColor,
            ),
          ),
        ),
        if (onRetry != null)
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              onRetry?.call();
            },
            child: Text(
              'Retry',
              style: context.appTheme.labelLarge.copyWith(
                color: context.appTheme.primaryColor,
              ),
            ),
          ),
      ],
    );
  }
}
