import 'package:flutter/material.dart';
import 'package:mapwatch/components/custom_elevated_button.dart';
import 'package:mapwatch/components/favourite_cards.dart';
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
