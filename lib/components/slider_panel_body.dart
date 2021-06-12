import 'package:flutter/material.dart';
import 'package:mapwatch/components/custom_elevated_button.dart';
import 'package:mapwatch/components/favourite_cards.dart';
import 'package:mapwatch/components/guide_cards.dart';
import 'package:mapwatch/constants.dart';

class SliderPanelBody extends StatefulWidget {
  @override
  _SliderPanelBodyState createState() => _SliderPanelBodyState();
}

class _SliderPanelBodyState extends State<SliderPanelBody> {
  List<Widget> generateFavouriteCards() {
    return [
      FavouriteCard(
        color: Color(0xFFDDA15E),
        icon: Icons.wb_sunny,
        title: 'Wasaga',
        subtitle: 'Ontario, Canada',
      ),
      SizedBox(width: 20),
      FavouriteCard(
        color: Color(0xFF606C38),
        icon: Icons.park,
        title: 'Algonquin',
        subtitle: 'Ontario, Canada',
      ),
      SizedBox(width: 20),
      FavouriteCard(
        color: Color(0xFF283618),
        icon: Icons.terrain,
        title: 'Tobermory',
        subtitle: 'Ontario, Canada',
      ),
      SizedBox(width: 20),
      Column(
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: Color(0x55E5E5E5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.add_box_outlined,
              size: 50,
              color: Color(0xFF939393),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Add New',
            style: Constants.mainFont.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ],
      ),
    ];
  }

  List<Widget> generateGuideCards() {
    return [
      GuideCards(
        imageUrl: 'https://images.unsplash.com/photo-1461654929682-e0f99f05f37c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1650&q=80',
        title: 'Beginner\'s Guide',
        description: 'What you need to know about spotting wildlife',
      ),
      SizedBox(width: 20),
      GuideCards(
        imageUrl: 'https://images.unsplash.com/photo-1620065529103-092107d3f37a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1593&q=80',
        title: 'Semi-aquatic animals',
        description: 'A guide to spotting turtles, otters and more',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Favourites',
                  style: Constants.mainFont.copyWith(fontSize: 24),
                ),
                SizedBox(height: 21),
                Container(
                  height: 120,
                  width: double.infinity,
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: this.generateFavouriteCards(),
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'Guides',
                  style: Constants.mainFont.copyWith(fontSize: 24),
                ),
                SizedBox(height: 21),
                Container(
                  height: 215,
                  width: double.infinity,
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: this.generateGuideCards(),
                  ),
                ),
                SizedBox(height: 30),
                CustomElevatedButton(label: 'Submit a Spotting', onPressed: () {}),
                SizedBox(height: 30),
                Text(
                  'Submissions Status',
                  style: Constants.mainFont.copyWith(fontSize: 24),
                ),
                SizedBox(height: 800),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
