import 'package:flutter_gs_app/models/flight_computer_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ground_station_model.freezed.dart';

@freezed
sealed class GroundStationModel with _$GroundStationModel {
  const factory GroundStationModel({
    required double RSSI,
    required int id,
    required String name,
    required FlightComputerModel? connectedFC,
    required double batteryLevel,
  }) = _GroundStationModel;
}
