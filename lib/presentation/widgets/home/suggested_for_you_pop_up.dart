import 'package:flutter/material.dart';
import 'package:to_do_app/core/consts/asset_images.dart';
import 'package:to_do_app/presentation/widgets/components/stroke_text_field.dart';

void showSuggestedForYouPopUp({
  required BuildContext context,
  required bool isShowBackArrow,
  required bool isShowForwardArrow,
  required String contentText,
  VoidCallback? onPreviousPressed,
  VoidCallback? onNextPressed,
}) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) => SuggestedForYouPopUp(
      context: context,
      contentText: contentText,
      isShowBackArrow: isShowBackArrow,
      isShowForwardArrow: isShowForwardArrow,
      onPreviousPressed: onPreviousPressed,
      onNextPressed: onNextPressed,
    ),
  );
}

class SuggestedForYouPopUp extends StatelessWidget {
  final BuildContext context;
  final String contentText;
  final bool isShowBackArrow;
  final bool isShowForwardArrow;
  final VoidCallback? onPreviousPressed;
  final VoidCallback? onNextPressed;

  const SuggestedForYouPopUp({
    super.key,
    required this.context,
    required this.contentText,
    required this.isShowBackArrow,
    required this.isShowForwardArrow,
    this.onPreviousPressed,
    this.onNextPressed,
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
              Color(0XFFFFD48E),
              Color(0XFFC38B3D),
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
                      height: 45.0,
                      width: 45.0,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 12.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10.0,
                children: [
                  if (isShowBackArrow)
                    InkWell(
                      onTap: () {
                        if (onPreviousPressed != null) {
                          Navigator.of(context).maybePop();
                          onPreviousPressed!();
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5.0,
                          vertical: 5.0,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0XFFD9D9D9),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        child: Image.asset(
                          AssetPNGImages.arrowLeft,
                          height: 30.0,
                          width: 30.0,
                        ),
                      ),
                    ),
                  StrokeTextField(
                    text: 'Suggested For You',
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                  ),
                  if (isShowForwardArrow)
                    InkWell(
                      onTap: () {
                        if (onNextPressed != null) {
                          Navigator.of(context).maybePop();
                          onNextPressed!();
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5.0,
                          vertical: 5.0,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0XFFD9D9D9),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        child: Image.asset(
                          AssetPNGImages.arrowRight,
                          height: 30.0,
                          width: 30.0,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 18.0,
              ),
              child: StrokeTextField(
                text: contentText,
                maxLines: 4,
                fontSize: 14.0,
                fontWeight: FontWeight.w700,
                textColor: Colors.black,
                strokeColor: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .30,
                child: ElevatedButton(
                  onPressed: () {
                    if (isShowForwardArrow && onNextPressed != null) {
                      Navigator.of(context).maybePop();
                      onNextPressed!();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0XFF534FCF),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 2.0,
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                  child: Text(
                    'Next',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: isShowForwardArrow
                              ? Colors.white
                              : Color(0XFF7F7B7B),
                        ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
