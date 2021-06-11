import 'package:flutter/material.dart';
import 'package:flutterinit/components/custom_elevated_button.dart';
import 'package:flutterinit/components/custom_flat_button.dart';
import '../constants.dart';
import '../utils.dart';
import 'main_page.dart';

class LoginPageWidget extends StatefulWidget {
  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  /// Event handler for the Login button
  void onLoginButtonPressed(BuildContext context) async {
    await Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MainPageWidget(),
      ),
    );
  }

  /// Event handler for the "Create an account" button
  void onCreateAccountPressed(BuildContext context) async {
    // TODO: Create Account Page
  }

  /// Executes when page is destroyed
  @override
  void dispose() {
    this._controller.dispose();
    super.dispose();
  }

  /// UI of the [LoginPageWidget]
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => unfocus(context),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width,
              maxHeight: MediaQuery.of(context).size.height * 1,
            ),
            decoration: BoxDecoration(
              color: Color(0xFFEEEEEE),
              shape: BoxShape.rectangle,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 100.0),
                      child: ScaleTransition(
                        scale: this._animation,
                        child: Container(
                          width: 200,
                          height: 200,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(Constants.logoImage),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: CustomElevatedButton(
                        onPressed: () => this.onLoginButtonPressed(context),
                        label: 'Log in',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 0, bottom: 30),
                      child: CustomFlatButton(
                        onPressed: () => this.onCreateAccountPressed(context),
                        label: 'Create an account',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
