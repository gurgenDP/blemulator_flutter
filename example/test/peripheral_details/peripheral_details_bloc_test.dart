import 'package:blemulator_example/model/ble_peripheral.dart';
import 'package:blemulator_example/peripheral_details/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mock/mocks.dart';
import '../mock/sample_ble_peripheral.dart';

void main() {
  PeripheralDetailsBloc peripheralDetailsBloc;
  MockBleAdapter bleAdapter;
  BlePeripheral peripheral;

  setUp(() {
    bleAdapter = MockBleAdapter();
    peripheral = SampleBlePeripheral();

    peripheralDetailsBloc =
        PeripheralDetailsBloc(bleAdapter, peripheral);
  });

  tearDown(() {
    peripheralDetailsBloc.close();
    bleAdapter = null;
  });

  test('close does not emit new states', () {
    // when
    peripheralDetailsBloc.close();

    // then
    expectLater(
      peripheralDetailsBloc,
      emitsInOrder([PeripheralDetailsState(peripheral: peripheral), emitsDone]),
    );
  });
}
