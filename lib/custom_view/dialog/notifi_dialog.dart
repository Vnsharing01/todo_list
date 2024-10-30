import 'package:flutter/material.dart';

import '../button_text_view.dart';

class NotifiDialog extends StatelessWidget {
  const NotifiDialog({
    super.key,
    this.title,
    this.btnName,
    this.onOK,
    this.background,
  });

  final String? title, btnName;
  final void Function()? onOK;
  final Color? background;

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16))),
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title ?? '',
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal),
              ),
              const SizedBox(height: 8),
              ButtonTextView(
                btnName: btnName ?? 'Ok',
                background: background,
                borderRadius: 16,
                onTap: onOK,
              ),
            ],
          ),
        ));
  }
}