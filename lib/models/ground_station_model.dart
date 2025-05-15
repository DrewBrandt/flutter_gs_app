import 'package:flutter/material.dart';
import 'package:flutter_gs_app/models/flight_computer_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ground_station_model.freezed.dart';

enum Relationship
{
  connected,
  tryConnect,
  doNotConnect,
}

@freezed
sealed class GroundStationModel with _$GroundStationModel {
  const factory GroundStationModel({
    required int id,
    required String name,
    required double batteryLevel,
    required String firmwareVersion,
    required bool conViaUSB,
    required Map<FlightComputerModel, Relationship> knownFCs,
    required bool isConnected,
    required Color? color,
  }) = _GroundStationModel;
}
