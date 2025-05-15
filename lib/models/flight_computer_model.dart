import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vector_math/vector_math.dart';

part 'flight_computer_model.freezed.dart';

@freezed
sealed class FlightComputerModel with _$FlightComputerModel {
  const factory FlightComputerModel({
    //Rocket State
    required Vector3 position,
    required Vector3 velocity,
    required Vector3 acceleration,
    required Vector4 orientation,
    required int stage,
    //metadata
    required double batteryLevel,
    required double RSSI,
    required int id,
    required String name,
    required double temperature,
    required bool hasGPSLock,
    required String flightName,
    required Color? color,
  }) = _FlightComputerModel;
}
