import 'package:collection/collection.dart';
import 'package:flutter/material.dart' as fm;
import 'package:flutter_gs_app/models/flight_computer_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_gs_app/models/ground_station_model.dart';
import 'package:vector_math/vector_math.dart';

part 'ground_station_provider.g.dart';

final Map<FlightComputerModel, Relationship> knownFCs = {
  FlightComputerModel(
        position: Vector3(0, 0, 0),
        velocity: Vector3(0, 0, 0),
        acceleration: Vector3(0, 0, 0),
        orientation: Vector4(0, 0, 0, 1),
        stage: 0,
        batteryLevel: 0.97,
        RSSI: -52,
        id: 101,
        name: 'Falcon Alpha',
        temperature: 32.0,
        hasGPSLock: true,
        flightName: 'Test Flight 1',
        color: fm.Colors.amber,
      ):
      Relationship.connected,

  FlightComputerModel(
        position: Vector3(10, 5, 3),
        velocity: Vector3(0.1, 0.2, 0),
        acceleration: Vector3(0, -9.8, 0),
        orientation: Vector4(0.1, 0.2, 0.3, 0.9),
        stage: 1,
        batteryLevel: 0.58,
        RSSI: -68,
        id: 102,
        name: 'Bravo Node',
        temperature: 29.5,
        hasGPSLock: false,
        flightName: 'Static Fire',
        color: fm.Colors.blue,
      ):
      Relationship.tryConnect,

  FlightComputerModel(
        position: Vector3(30, -15, 2),
        velocity: Vector3(0, 0, 0),
        acceleration: Vector3.zero(),
        orientation: Vector4(0, 0, 0, 1),
        stage: 0,
        batteryLevel: 0.12,
        RSSI: -90,
        id: 103,
        name: 'Charlie Tracker',
        temperature: 41.2,
        hasGPSLock: false,
        flightName: 'Scrubbed Launch',
        color: fm.Colors.deepOrange,
      ):
      Relationship.doNotConnect,

  // Three more with random/mock values:
  FlightComputerModel(
        position: Vector3(5, 12, -3),
        velocity: Vector3(0.3, -0.1, 0.05),
        acceleration: Vector3(0.0, -9.8, 0.1),
        orientation: Vector4(0.0, 0.7, 0.7, 0.1),
        stage: 2,
        batteryLevel: 0.75,
        RSSI: -58,
        id: 104,
        name: 'Delta Scout',
        temperature: 35.4,
        hasGPSLock: true,
        flightName: 'Orbital Test',
        color: fm.Colors.deepPurple,
      ):
      Relationship.connected,

  FlightComputerModel(
        position: Vector3(-8, 4, 15),
        velocity: Vector3(-0.2, 0.0, -0.3),
        acceleration: Vector3(0.1, -9.7, -0.1),
        orientation: Vector4(0.2, 0.2, 0.9, 0.1),
        stage: 1,
        batteryLevel: 0.42,
        RSSI: -75,
        id: 105,
        name: 'Echo Observer',
        temperature: 28.7,
        hasGPSLock: true,
        flightName: 'High Altitude',
        color: fm.Colors.green,
      ):
      Relationship.tryConnect,

  FlightComputerModel(
        position: Vector3(20, 0, 20),
        velocity: Vector3(0.0, 0.5, 0.0),
        acceleration: Vector3(0.0, -9.6, 0.0),
        orientation: Vector4(0.5, 0.5, 0.5, 0.5),
        stage: 3,
        batteryLevel: 0.18,
        RSSI: -85,
        id: 106,
        name: 'Foxtrot Probe',
        temperature: 45.1,
        hasGPSLock: false,
        flightName: 'Reentry Trial',
        color: fm.Colors.indigo,
      ):
      Relationship.doNotConnect,
};


/// Manages the list of all available ground stations.
@Riverpod(
  keepAlive: true,
) // Keep this provider alive throughout the app lifecycle
class GroundStationList extends _$GroundStationList {
  @override
  List<GroundStationModel> build() {
    // Initialize with default data or load from a persistent source
    return [
      GroundStationModel(
        id: 0,
        name: 'Alpha Base GS',
        batteryLevel: 1.0,
        firmwareVersion: '0.0.1',
        knownFCs: knownFCs,
        conViaUSB: true,
        isConnected: true,
        color: fm.Colors.lime,
      ),
      GroundStationModel(
        id: 1,
        name: 'Bravo Outpost GS',
        batteryLevel: 0.5,
        firmwareVersion: '0.0.1',
        knownFCs: knownFCs,
        conViaUSB: false,
        isConnected: true,
        color: fm.Colors.pinkAccent,
      ),
      GroundStationModel(
        id: 2,
        name: 'Charlie Camp GS',
        batteryLevel: 0.1,
        firmwareVersion: '0.0.1',
        knownFCs: {},
        conViaUSB: false,
        isConnected: false,
        color: fm.Colors.teal,
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
