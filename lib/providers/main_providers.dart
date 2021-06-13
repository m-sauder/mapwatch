// For state management

import 'package:flutter_map/flutter_map.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

final panelControllerProvider = StateProvider<PanelController>((ProviderReference ref) => PanelController());

final isAddingNewCoordinate = StateProvider<bool>((ProviderReference ref) => false);

final markerList = StateProvider<List<Marker>>((ProviderReference ref) => []);
