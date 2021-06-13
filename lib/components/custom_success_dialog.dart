import 'package:flutter/material.dart';
import 'package:mapwatch/constants.dart';

class CustomSuccessDialog extends StatefulWidget {
  final void Function() onCancelPressed;

  CustomSuccessDialog({
    required this.onCancelPressed,
  });

  @override
  _CustomSuccessDialogState createState() => _CustomSuccessDialogState();
}

class _CustomSuccessDialogState extends State<CustomSuccessDialog> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  );

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInExpo,
  );

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      setState(() {});
    });

    _controller.forward();
  }

  @override
  void dispose() {
    this._controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        titlePadding: EdgeInsets.only(top: 45, left: 23, right: 30, bottom: 5),
        title: Text(
          'Success!',
          textAlign: TextAlign.center,
          style: Constants.mainFont.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_outline_rounded,
              size: 100,
              color: CustomColorScheme.primaryColor,
            ),
            SizedBox(height: 30),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  TextSpan(text: 'The'),
                  TextSpan(
                    text: ' Ontario Ministry of Natural Resources and Forestry',
                    style: TextStyle(color: CustomColorScheme.primaryColor),
                  ),
                  TextSpan(text: ' will review your submission shortly.'),
                ],
              ),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: widget.onCancelPressed,
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 15, horizontal: 0)),
                      shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                          side: BorderSide(color: CustomColorScheme.primaryColor),
                        ),
                      ),
                    ),
                    child: Text(
                      'New Submission',
                      style: Constants.mainFont.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: CustomColorScheme.primaryColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: widget.onCancelPressed,
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 15, horizontal: 0)),
                      shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
                      backgroundColor: MaterialStateProperty.all<Color>(CustomColorScheme.primaryColor),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                          side: BorderSide(color: CustomColorScheme.primaryColor),
                        ),
                      ),
                    ),
                    child: Text(
                      'Finish',
                      style: Constants.mainFont.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
