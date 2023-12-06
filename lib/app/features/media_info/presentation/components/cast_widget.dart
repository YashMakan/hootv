import 'package:flutter/material.dart';
import 'package:hootv/app/features/media_info/data/models/credits_model.dart';
import 'package:hootv/app/shared/config/constants/extensions.dart';
import 'package:hootv/app/shared/config/theme/theme.dart';

class CastWidget extends StatelessWidget {
  final CreditsModel? credit;

  const CastWidget({super.key, this.credit});

  bool get isApiLoaded => credit != null;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: SizedBox(
        width: (42 * 2.2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 42,
              backgroundImage:
                  isApiLoaded ? NetworkImage(credit!.profilePathImage ?? "") : null,
              onBackgroundImageError: isApiLoaded ? (obj, _) {} : null,
              backgroundColor: Colors.grey.withOpacity(0.3),
            ).toShimmer(!isApiLoaded),
            const SizedBox(height: 8),
            if (isApiLoaded)...[
              SizedBox(
                width: (42 * 2.2),
                child: Center(
                  child: Text(
                    credit!.name,
                    overflow: TextOverflow.fade,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style: context.bodyMedium?.copyWith(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                width: (42 * 2.2),
                child: Center(
                  child: Text(
                    "(${credit!.character})",
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.fade,
                    style: context.bodyMedium?.copyWith(color: Colors.white),
                  ),
                ),
              )
            ]
            else
              Container(
                width: 32,
                height: 16,
                color: Colors.grey.withOpacity(0.3),
              ).toShimmer(!isApiLoaded)
          ],
        ),
      ),
    );
  }
}
