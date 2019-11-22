import 'package:blemulator_example/model/ble_peripheral.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class PeripheralListState extends Equatable {
  final List<BlePeripheral> peripherals;
  final bool scanningEnabled;

  const PeripheralListState(
      {@required this.peripherals, @required this.scanningEnabled});

  @override
  List<Object> get props => [peripherals, scanningEnabled];
}

class InitialPeripheralList extends PeripheralListState {
  const InitialPeripheralList()
      : super(peripherals: const [], scanningEnabled: false);
}

class PeripheralList extends PeripheralListState {
  const PeripheralList({@required peripherals, @required scanningEnabled})
      : super(peripherals: peripherals, scanningEnabled: scanningEnabled);
}

class NavigateToPeripheralDetails extends PeripheralListState {
  const NavigateToPeripheralDetails({@required peripherals, @required scanningEnabled})
      : super(peripherals: peripherals, scanningEnabled: scanningEnabled);
}
