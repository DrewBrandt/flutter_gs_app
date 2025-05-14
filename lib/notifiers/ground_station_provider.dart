import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_gs_app/models/ground_station_model.dart';

part 'ground_station_provider.g.dart';

/// Manages the list of all available ground stations.
@Riverpod(
  keepAlive: true,
) // Keep this provider alive throughout the app lifecycle
class GroundStationList extends _$GroundStationList {
  @override
  List<GroundStationModel> build() {
    // Initialize with default data or load from a persistent source
    return [
      const GroundStationModel(
        id: 0,
        name: 'Alpha Base GS',
        batteryLevel: 1.0,
        firmwareVersion: '0.0.1',
        knownFCs: {},
        conViaUSB: true,
        isConnected: true,
      ),
      const GroundStationModel(
        id: 1,
        name: 'Bravo Outpost GS',
        batteryLevel: 0.5,
        firmwareVersion: '0.0.1',
        knownFCs: {},
        conViaUSB: false,
        isConnected: true,
      ),
      const GroundStationModel(
        id: 2,
        name: 'Charlie Camp GS',
        batteryLevel: 0.1,
        firmwareVersion: '0.0.1',
        knownFCs: {},
        conViaUSB: false,
        isConnected: false,
      ),
    ];
  }

  /// Adds a new ground station to the list.
  void addGS(GroundStationModel gs) {
    // Optional: Check for duplicate IDs before adding
    if (state.any((existingGs) => existingGs.id == gs.id)) {
      // Handle error: e.g., throw exception or log
      print('Error: Ground station with ID ${gs.id} already exists.');
      return;
    }
    state = [...state, gs];
  }

  /// Removes a ground station from the list by its ID.
  void removeGS(int id) {
    state = state.where((gs) => gs.id != id).toList();
    // If the removed GS was the active one, you might want to clear the active ID.
    // This can be handled by watching activeGroundStationIdProvider or in the UI layer.
    final activeIdNotifier = ref.read(activeGroundStationIdProvider.notifier);
    if (activeIdNotifier.state == id) {
      activeIdNotifier.setActive(state.isEmpty ? 0 : state.first.id);
    }
  }

  /// Updates an existing ground station in the list.
  /// Ensures the model passed has a valid `id` matching an existing station.
  void updateGS(GroundStationModel updatedGS) {
    state = state.map((gs) => gs.id == updatedGS.id ? updatedGS : gs).toList();
  }

  /// Retrieves a ground station by its ID from the current list.
  GroundStationModel? getById(int id) {
    return state.firstWhereOrNull((gs) => gs.id == id);
  }
}

@Riverpod(keepAlive: true)
class ActiveGroundStationId extends _$ActiveGroundStationId {
  @override
  int? build() {
    final gsList = ref.read(groundStationListProvider);
    return gsList.firstOrNull?.id;
  }

  void setActive(int? id) {
    state = id;
  }

  void updateActive(GroundStationModel updatedGS) {
    ref.read(groundStationListProvider.notifier).updateGS(updatedGS);
  }
}

@riverpod
GroundStationModel? activeGroundStation(Ref ref) {
  final id = ref.watch(activeGroundStationIdProvider);
  final list = ref.watch(groundStationListProvider);
  return list.firstWhereOrNull((gs) => gs.id == id);
}
