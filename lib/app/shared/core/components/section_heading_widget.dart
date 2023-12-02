import 'package:flutter/material.dart';
import 'package:hootv/app/shared/config/theme/theme.dart';

class SectionHeadingWidget extends StatelessWidget {
  final String title;
  final Widget child;

  const SectionHeadingWidget(
      {super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Row(
            children: [
              Text(
                title,
                style: context.bodyLarge?.copyWith(color: Colors.white),
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.arrow_forward_ios_outlined,
                size: 14,
                color: Colors.white54,
              )
            ],
          ),
        ),
        const SizedBox(height: 14),
        child
      ],
    );
  }
}
