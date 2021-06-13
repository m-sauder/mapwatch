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

class _CustomInfoDialogState extends State<CustomInfoDialog>
    with SingleTickerProviderStateMixin {
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
        insetPadding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        titlePadding: EdgeInsets.only(top: 45, left: 23, right: 30, bottom: 5),
        title: Text(
          'Information',
          style: Constants.mainFont.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text:
                            'Based on the location, your input will be sent to the'),
                    TextSpan(
                      text:
                          ' Ontario Ministry of Natural Resources and Forestry',
                      style: TextStyle(color: CustomColorScheme.primaryColor),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              TextField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: CustomColorScheme.primaryColor),
                  ),
                  labelText: 'Animal',
                  fillColor: Colors.grey,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                maxLines: 3,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: CustomColorScheme.primaryColor),
                  ),
                  labelText: 'Description',
                  fillColor: Colors.grey,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: CustomColorScheme.primaryColor),
                  ),
                  labelText: 'Full Name',
                  fillColor: Colors.grey,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: CustomColorScheme.primaryColor),
                  ),
                  labelText: 'Email',
                  fillColor: Colors.grey,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: CustomColorScheme.primaryColor),
                  ),
                  labelText: 'Phone Number',
                  fillColor: Colors.grey,
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(vertical: 15, horizontal: 37)),
                        shadowColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            CustomColorScheme.primaryColor),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      child: Text(
                        'Upload a Photo (Optional)',
                        style: Constants.mainFont.copyWith(
                          fontWeight: FontWeight.w200,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: widget.onCancelPressed,
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(vertical: 15, horizontal: 35)),
                        shadowColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                            side: BorderSide(
                                color: CustomColorScheme.primaryColor),
                          ),
                        ),
                      ),
                      child: Text(
                        'Cancel',
                        style: Constants.mainFont.copyWith(
                          color: Colors.green,
                          fontWeight: FontWeight.w200,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: widget.onSubmitPressed,
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(vertical: 15, horizontal: 35)),
                        shadowColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            CustomColorScheme.primaryColor),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                            side: BorderSide(
                                color: CustomColorScheme.primaryColor),
                          ),
                        ),
                      ),
                      child: Text(
                        'Submit',
                        style: Constants.mainFont.copyWith(
                          fontWeight: FontWeight.w200,
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
      ),
    );
  }
}
