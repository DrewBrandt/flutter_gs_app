// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ground_station_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$activeGroundStationHash() =>
    r'75e4b74f8ba01542608e83171df082484cfaf82f';

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
String _$groundStationListHash() => r'8f09effff3b250f9d9c4671b5e204a3d704251b1';

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
    r'ac6097a78a1084627d8f7c31397a2f452c359d59';

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
