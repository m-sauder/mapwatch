import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutterinit/pages/web_view_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutterinit/components/custom_square_button.dart';
import '../constants.dart';

class MainPageWidget extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MainPageWidget> {
  int _bottomNavIndex = 1;

  //Url Launcher
  void _launchUrl() async {
    if (await canLaunch(Constants.url1)) {
      await launch(Constants.url1);
    } else {
      throw 'Could not launch ${Constants.url1}';
    }
  }

  void openWebViewPage() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WebViewPageWidget(),
      ),
    );
  }

  void onBottomNavBarChange(int index) {
    setState(() {
      _bottomNavIndex = index;
    });
  }

  //UI of the Main Page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: CustomColorScheme.primaryButton,
              ),
              child: Image.asset('images/logo.png'),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: CustomSquareButton(
                  onPressed: openWebViewPage,
                  label: 'Web View',
                ),
              ),
              Expanded(
                child: CustomSquareButton(
                  onPressed: _launchUrl,
                  label: 'URL Launcher',
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add),
        backgroundColor: CustomColorScheme.primaryButton,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: [Icons.home, Icons.gamepad, Icons.list, Icons.baby_changing_station],
        activeIndex: _bottomNavIndex,
        onTap: onBottomNavBarChange,
        gapLocation: GapLocation.center,
        leftCornerRadius: 20,
        rightCornerRadius: 20,
        notchSmoothness: NotchSmoothness.softEdge,
        activeColor: CustomColorScheme.primaryButton,
      ),
    );
  }
}
