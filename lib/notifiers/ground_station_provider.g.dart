// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ground_station_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$activeGroundStationHash() =>
    r'9d1d34901a410abf16ad8c7cd3c0365240de9e80';

/// See also [activeGroundStation].
@ProviderFor(activeGroundStation)
final activeGroundStationProvider =
    AutoDisposeProvider<GroundStationModel?>.internal(
      activeGroundStation,
      name: r'activeGroundStationProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$activeGroundStationHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ActiveGroundStationRef = AutoDisposeProviderRef<GroundStationModel?>;
String _$groundStationListHash() => r'd52c1b06227a3a5ca0079286730d788e56d724d5';

/// Manages the list of all available ground stations.
///
/// Copied from [GroundStationList].
@ProviderFor(GroundStationList)
final groundStationListProvider =
    NotifierProvider<GroundStationList, List<GroundStationModel>>.internal(
      GroundStationList.new,
      name: r'groundStationListProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$groundStationListHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$GroundStationList = Notifier<List<GroundStationModel>>;
String _$activeGroundStationIdHash() =>
    r'10918a18d25449af3acb77bea5e4931f9d5b7016';

/// See also [ActiveGroundStationId].
@ProviderFor(ActiveGroundStationId)
final activeGroundStationIdProvider =
    NotifierProvider<ActiveGroundStationId, int?>.internal(
      ActiveGroundStationId.new,
      name: r'activeGroundStationIdProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$activeGroundStationIdHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$ActiveGroundStationId = Notifier<int?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
