import 'package:flutter_bloc/flutter_bloc.dart';

import 'AbstractState.dart';
import 'Position.dart';

class PositionState extends AbstractState<List<Position>> {
  PositionState(List<Position> data) : super(data);
}

class PositionModel extends Cubit<PositionState> {
  List<Position> _all = [];

  PositionModel() : super(PositionState([])..waiting = true) {
    _load();
  }

  void _load() async {
    await Future.delayed(Duration(seconds: 1));
    _all = [
      Position()
        ..num = 1
        ..roll = 'рулон1'
        ..batch = '001'
        ..dimensions = '12x144'
        ..quantity = 123.11,
      Position()
        ..num = 2
        ..roll = 'рулон2'
        ..batch = '005'
        ..dimensions = '111x11'
        ..quantity = 34543543.11,
      Position()
        ..num = 3
        ..roll = 'рулон3'
        ..batch = '011'
        ..dimensions = '8x15'
        ..quantity = 0.123,
    ];
    emit(PositionState(_all));
  }

  void filter(String s) {
    var ss = s.toLowerCase();
    emit(PositionState(_all.where((v) => v.roll.toLowerCase().contains(ss)).toList()));
  }
}
