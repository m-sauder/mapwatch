import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mapwatch/components/slider_panel_body.dart';
import 'package:mapwatch/providers/main_providers.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SliderPanel extends HookWidget {
  final Widget body;

  SliderPanel({
    required this.body,
  });

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
                color: Color(0xFFECECEC),
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
    PanelController _pc = useProvider(panelControllerProvider).state;

    return SlidingUpPanel(
      controller: _pc,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24.0),
        topRight: Radius.circular(24.0),
      ),
      backdropEnabled: true,
      maxHeight: MediaQuery.of(context).size.height - 80,
      minHeight: 40,
      margin: EdgeInsets.symmetric(horizontal: 10),
      body: body,
      color: Color(0xFFECECEC),
      panelBuilder: this._panelBuilder,
    );
  }
}
