import 'package:flutter_gs_app/models/device_data.dart';
import 'package:flutter_gs_app/models/flight_computer_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ground_station_model.freezed.dart';

enum Relationship
{
  connected,
  tryConnect,
  doNotConnect,
  hidden, // hidden and do not connect. If hidden and try to connect, will simply be forgotten. Only works for currently offline flight computers.
}

@freezed
sealed class GroundStationModel with _$GroundStationModel {
  const factory GroundStationModel({
    required Map<FlightComputerModel, Relationship> knownFCs,
    required DeviceData data,
  }) = _GroundStationModel;
}
