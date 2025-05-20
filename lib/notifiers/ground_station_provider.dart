import 'package:collection/collection.dart';
import 'package:flutter_gs_app/models/device_data.dart';
import 'package:flutter_gs_app/models/flight_computer_model.dart';
import 'package:flutter_gs_app/views/common/color_picker.dart';
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
        data: DeviceData(
          batteryLevel: 0.97,
          id: 101,
          rssi: -52,
          name: 'Falcon Alpha',
          type: DeviceType.fc,
          color: colorOptions[0],
          firmwareVer: '0.0.1',
          conStatus: ConStatus.conLoRa,
        ),
        temperature: 32.0,
        hasGPSLock: true,
        flightName: 'Test Flight 1',
      ):
      Relationship.connected,

  FlightComputerModel(
        position: Vector3(10, 5, 3),
        velocity: Vector3(0.1, 0.2, 0),
        acceleration: Vector3(0, -9.8, 0),
        orientation: Vector4(0.1, 0.2, 0.3, 0.9),
        stage: 1,
        data: DeviceData(
          batteryLevel: 0.58,
          id: 102,
          type: DeviceType.fc,
          rssi: -108,
          name: 'Bravo Node',
          color: colorOptions[1],
          firmwareVer: '0.0.1',
          conStatus: ConStatus.conLoRa,
        ),
        temperature: 29.5,
        hasGPSLock: false,
        flightName: 'Static Fire',
      ):
      Relationship.connected,

  FlightComputerModel(
        position: Vector3(30, -15, 2),
        velocity: Vector3(0, 0, 0),
        acceleration: Vector3.zero(),
        orientation: Vector4(0, 0, 0, 1),
        stage: 0,
        data: DeviceData(
          batteryLevel: 0.12,
          id: 103,
          rssi: -90,
          type: DeviceType.fc,
          name: 'Charlie Tracker',
          color: colorOptions[2],
          firmwareVer: '0.0.1',
          conStatus: ConStatus.conLoRa,
        ),
        temperature: 41.2,
        hasGPSLock: false,
        flightName: 'Scrubbed Launch',
      ):
      Relationship.tryConnect,

  FlightComputerModel(
        position: Vector3(5, 12, -3),
        velocity: Vector3(0.3, -0.1, 0.05),
        acceleration: Vector3(0.0, -9.8, 0.1),
        orientation: Vector4(0.0, 0.7, 0.7, 0.1),
        stage: 2,
        data: DeviceData(
          batteryLevel: 0.75,
          type: DeviceType.fc,
          rssi: -58,
          id: 104,
          name: 'Delta Scout',
          color: colorOptions[3],
          firmwareVer: '0.0.1',
          conStatus: ConStatus.advert,
        ),
        temperature: 35.4,
        hasGPSLock: true,
        flightName: 'Orbital Test',
      ):
      Relationship.doNotConnect,

  FlightComputerModel(
        position: Vector3(-8, 4, 15),
        velocity: Vector3(-0.2, 0.0, -0.3),
        acceleration: Vector3(0.1, -9.7, -0.1),
        orientation: Vector4(0.2, 0.2, 0.9, 0.1),
        stage: 1,
        data: DeviceData(
          batteryLevel: 0.42,
          id: 105,
          name: 'Echo Observer',
          rssi: -75,
          type: DeviceType.fc,
          color: colorOptions[4],
          firmwareVer: '0.0.1',
          conStatus: ConStatus.noCon,
        ),
        temperature: 28.7,
        hasGPSLock: true,
        flightName: 'High Altitude',
      ):
      Relationship.tryConnect,

  FlightComputerModel(
        position: Vector3(20, 0, 20),
        velocity: Vector3(0.0, 0.5, 0.0),
        acceleration: Vector3(0.0, -9.6, 0.0),
        orientation: Vector4(0.5, 0.5, 0.5, 0.5),
        stage: 3,
        data: DeviceData(
          batteryLevel: 0.18,
          id: 106,
          rssi: -85,
          name: 'Foxtrot Probe',
          color: colorOptions[5],
          firmwareVer: '0.0.1',
          type: DeviceType.fc,
          conStatus: ConStatus.noCon,
        ),
        temperature: 45.1,
        hasGPSLock: false,
        flightName: 'Reentry Trial',
      ):
      Relationship.hidden,
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
        data: DeviceData(
          id: 0,
          rssi: -85,
          name: 'Alpha Base GS',
          batteryLevel: 1.0,
          firmwareVer: '0.0.1',
          color: colorOptions[6],
          conStatus: ConStatus.conUSB,
          type: DeviceType.gs,
        ),
        knownFCs: knownFCs,
      ),
      GroundStationModel(
        data: DeviceData(
          id: 1,
          name: 'Bravo Outpost GS',
          rssi: -85,
          batteryLevel: 0.5,
          firmwareVer: '0.0.1',
          color: colorOptions[7],
          type: DeviceType.gs,
          conStatus: ConStatus.conBT,
        ),
        knownFCs: knownFCs,
      ),
      GroundStationModel(
        data: DeviceData(
          id: 2,
          rssi: -85,
          name: 'Charlie Camp GS',
          batteryLevel: 0.1,
          firmwareVer: '0.0.1',
          color: colorOptions[5],
          type: DeviceType.gs,
          conStatus: ConStatus.noCon,
        ),
        knownFCs: {},
      ),
      GroundStationModel(
        data: DeviceData(
          id: 3,
          rssi: -60,
          name: 'Delta Enclave GS',
          batteryLevel: 0.1,
          firmwareVer: '0.0.1',
          color: colorOptions[4],
          type: DeviceType.gs,
          conStatus: ConStatus.advert,
        ),
        knownFCs: {},
      ),
    ];
  }

  /// Adds a new ground station to the list.
  void addGS(GroundStationModel gs) {
    // Optional: Check for duplicate IDs before adding
    if (state.any((existingGs) => existingGs.data.id == gs.data.id)) {
      // Handle error: e.g., throw exception or log
      print('Error: Ground station with ID ${gs.data.id} already exists.');
      return;
    }
    state = [...state, gs];
  }

  /// Removes a ground station from the list by its ID.
  void removeGS(int id) {
    state = state.where((gs) => gs.data.id != id).toList();
    // If the removed GS was the active one, you might want to clear the active ID.
    // This can be handled by watching activeGroundStationIdProvider or in the UI layer.
    final activeIdNotifier = ref.read(activeGroundStationIdProvider.notifier);
    if (activeIdNotifier.state == id) {
      activeIdNotifier.setActive(state.isEmpty ? 0 : state.first.data.id);
    }
  }

  /// Updates an existing ground station in the list.
  /// Ensures the model passed has a valid `id` matching an existing station.
  void updateGS(GroundStationModel updatedGS) {
    state = state.map((gs) => gs.data.id == updatedGS.data.id ? updatedGS : gs).toList();
  }

  /// Retrieves a ground station by its ID from the current list.
  GroundStationModel? getById(int id) {
    return state.firstWhereOrNull((gs) => gs.data.id == id);
  }
}

@Riverpod(keepAlive: true)
class ActiveGroundStationId extends _$ActiveGroundStationId {
  @override
  int? build() {
    final gsList = ref.read(groundStationListProvider);
    return gsList.firstOrNull?.data.id;
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
  return list.firstWhereOrNull((gs) => gs.data.id == id);
}
