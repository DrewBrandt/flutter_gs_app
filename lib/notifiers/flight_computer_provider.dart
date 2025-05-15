import 'package:flutter/material.dart' as fm;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/flight_computer_model.dart';
import 'package:vector_math/vector_math.dart';

final flightComputerProvider =
    NotifierProvider<FlightComputerNotifier, FlightComputerModel>(
      () => FlightComputerNotifier(),
    );

class FlightComputerNotifier extends Notifier<FlightComputerModel> {
  @override
  FlightComputerModel build() {
    return FlightComputerModel(
      position: Vector3.zero(),
      velocity: Vector3.zero(),
      acceleration: Vector3.zero(),
      orientation: Vector4(0, 0, 0, 1),
      stage: 0,
      batteryLevel: 0.0,
      RSSI: -100,
      id: 0,
      name: 'Unknown',
      temperature: 0,
      hasGPSLock: false,
      flightName: 'Test Flight 001',
      color: fm.Colors.blue,
    );
  }

  void updateFromData(FlightComputerModel newData) {
    state = newData;
  }

  void updatePartial({Vector3? position, double? battery}) {
    state = state.copyWith(
      position: position ?? state.position,
      batteryLevel: battery ?? state.batteryLevel,
    );
  }
}
