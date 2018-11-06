

import 'dart:async';

class IncrementBloc {
  int _counter;

  StreamController<int> _counterController = StreamController<int>()
  StreamSink<int> get _inAdd => _counterController.sink;
  Stream<int> get outCounter => _counterController.stream;

  StreamController _actionController = StreamController();
  StreamSink get incrementCounter => _actionController.sink;

  IncrementBloc(){
    _counter = 0;
    _actionController.stream.listen( _handleLogin);
  }

  void _handleLogin(data) {
    _counter = _counter + 1;
    _inAdd.add( _counter);
  }

}