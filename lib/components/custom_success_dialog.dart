import 'package:flutter/material.dart';
import 'package:mapwatch/constants.dart';

class CustomInfoDialog extends StatefulWidget {
  final void Function() onSubmitPressed;
  final void Function() onCancelPressed;

  CustomInfoDialog({
    required this.onSubmitPressed,
    required this.onCancelPressed,
  });

  @override
  _CustomInfoDialogState createState() => _CustomInfoDialogState();
}

class _CustomInfoDialogState extends State<CustomInfoDialog> with SingleTickerProviderStateMixin {
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
              color: Colors.green,
            ),
            SizedBox(height: 30),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  TextSpan(text: 'The'),
                  TextSpan(
                    text: ' Ontario Ministry of Natural Resources and Forestry',
                    style: TextStyle(color: Colors.green),
                  ),
                  TextSpan(text: ' will review your submission shortly.'),
                ],
              ),
            ),
            SizedBox(height: 40),
            Row(
              children: [
                ElevatedButton(
                  onPressed: widget.onSubmitPressed,
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 15, horizontal: 35)),
                    shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                        side: BorderSide(color: Colors.green),
                      ),
                    ),
                  ),
                  child: Text(
                    'New Submission',
                    style: Constants.mainFont.copyWith(
                      color: Colors.green,
                      fontWeight: FontWeight.w200,
                      fontSize: 15,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: widget.onSubmitPressed,
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 15, horizontal: 35)),
                    shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                        side: BorderSide(color: Colors.green),
                      ),
                    ),
                  ),
                  child: Text(
                    'Finish',
                    style: Constants.mainFont.copyWith(
                      fontWeight: FontWeight.w200,
                      fontSize: 15,
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
