import 'dart:async';

import 'package:hue_dart/hue_dart.dart';
import 'package:hue_dart/src/configuration/pushlink_bloc.dart';
import 'package:hue_dart/src/core/bridge_exception.dart';
import 'package:hue_dart/src/core/discovery_result.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'pushlink_test.mocks.dart';

@GenerateMocks([
  PushlinkStorage,
  BridgeDiscovery,
])
void main() {
  late PushlinkBloc sut;
  late MockPushlinkStorage storage;
  late MockBridgeDiscovery bridgeDiscovery;

  setUp(() {
    storage = MockPushlinkStorage();
    bridgeDiscovery = MockBridgeDiscovery();
    sut = PushlinkBloc(storage, bridgeDiscovery);
  });

  tearDown(() {
    resetMockitoState();
  });

  void mockHasUsername(bool hasUsername) {
    when(storage.usernameExists()).thenAnswer((_) => Future.value(hasUsername));
  }

  List<DiscoveryResult> mockAutomaticBridgeResult(int amount) {
    final results = List.generate(amount, (index) {
      return DiscoveryResult();
    });
    when(bridgeDiscovery.automatic()).thenAnswer((_) {
      return Future.value(results);
    });
    return results;
  }

  BridgeException mockFailingAutomaticBridgeResult() {
    final result = BridgeException();
    when(bridgeDiscovery.automatic()).thenThrow(result);
    return result;
  }

  DiscoveryResult mockManualBridgeResult() {
    final result = DiscoveryResult();
    when(bridgeDiscovery.manual(any)).thenAnswer((_) {
      return Future.value(result);
    });
    return result;
  }

  BridgeException mockFailingManualBridgeResult(String ip) {
    final result = BridgeException();
    when(bridgeDiscovery.manual(ip)).thenThrow(result);
    return result;
  }

  test('storage has username', () async {
    mockHasUsername(true);
    await sut.init();
    sut.dispose();
    expect(sut.hasUsername, emitsInOrder([true]));
  });

  test('storage has no username', () async {
    mockHasUsername(false);
    await sut.init();
    sut.dispose();
    expect(sut.hasUsername, emitsInOrder([false]));
  });

  test('automatic search returns search results on listen', () async {
    mockHasUsername(false);
    final result = mockAutomaticBridgeResult(3);
    await sut.init();
    expect(sut.discoveryResults, emits(result));
  });

  test('automatic search fails on listen', () async {
    mockHasUsername(false);
    final result = mockFailingAutomaticBridgeResult();
    await sut.init();
    expect(sut.discoveryResults, emitsError(result));
  });

  test('manual search returns search result', () async {
    mockHasUsername(false);
    final result = mockManualBridgeResult();
    await sut.init();
    sut.manualSearch.add('192.1.1.1');
    expect(sut.manualSearchResult, emits(result));
  });

  test('manual search fails search result', () async {
    mockHasUsername(false);
    final ip = '192.1.1.1';
    final result = mockFailingManualBridgeResult(ip);
    await sut.init();
    sut.manualSearch.add(ip);
    expect(sut.manualSearchResult, emitsError(result));
  });
}
