import 'package:flutter/material.dart';
import 'package:blocdemo/increment_bloc.dart';

void main() => runApp(new MaterialApp(
      home: new CounterPage(),
    ));

class CounterPage extends StatelessWidget {
  final IncrementBloc bloc = IncrementBloc();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Stream version of the Counter App'),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: bloc.outCounter,
          initialData: 0,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            return Text("You hit me: ${snapshot.data} times");
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // 注意这里,事件发送
          bloc.incrementCounter.add(null);
        },
      ),
    );
  }
}
