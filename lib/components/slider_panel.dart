import 'package:flutter/material.dart';
import 'package:mapwatch/components/slider_panel_body.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SliderPanel extends StatefulWidget {
  final Widget body;

  SliderPanel({
    required this.body,
  });

  @override
  _SliderPanelState createState() => _SliderPanelState();
}

class _SliderPanelState extends State<SliderPanel> {
  Widget _panelBuilder(ScrollController sc) {
    return Stack(
      children: [
        ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          controller: sc,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 14),
              child: SliderPanelBody(),
            ),
          ],
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.only(top: 0),
            child: Container(
              width: double.maxFinite,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Colors.white,
              ),
              child: Center(
                child: Container(
                  height: 6,
                  width: 99,
                  decoration: BoxDecoration(
                    color: Color(0xFFC4C4C4),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24.0),
        topRight: Radius.circular(24.0),
      ),
      backdropEnabled: true,
      maxHeight: MediaQuery.of(context).size.height - 80,
      minHeight: 40,
      margin: EdgeInsets.symmetric(horizontal: 10),
      body: widget.body,
      panelBuilder: this._panelBuilder,
    );
  }
}
