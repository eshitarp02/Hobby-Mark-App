import 'package:flutter/material.dart';
import 'package:to_do_app/core/consts/asset_images.dart';
import 'package:to_do_app/presentation/widgets/components/stroke_text_field.dart';

void showIamBoredEmptyPopUp({
  required BuildContext context,
}) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) => IAmBoredEmptyPopUp(
      context: context,
    ),
  );
}

class IAmBoredEmptyPopUp extends StatelessWidget {
  final BuildContext context;

  const IAmBoredEmptyPopUp({
    super.key,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          47.0,
        ),
        side: BorderSide(
          color: Color(0XFFFFF9F9),
          width: 3.0,
          style: BorderStyle.solid,
        ),
      ),
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      content: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            47.0,
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0XFFFBF1F4),
              Color(0XFFA61818),
            ],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
                right: 20.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Image.asset(
                      AssetPNGImages.redClose,
                      height: 35.0,
                      width: 35.0,
                    ),
                  ),
                ],
              ),
            ),
            StrokeTextField(
              text: 'No Logs Found',
              fontSize: 18.0,
              fontWeight: FontWeight.w700,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: StrokeTextField(
                text: 'You don’t have any activity',
                fontSize: 14.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: StrokeTextField(
                text: 'logs yet. Try logging a few',
                fontSize: 14.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: StrokeTextField(
                text: 'activities first so we can',
                fontSize: 14.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2.0, bottom: 30.0),
              child: StrokeTextField(
                text: 'suggest something fun!',
                fontSize: 14.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
