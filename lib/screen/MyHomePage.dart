import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import '../viewmodel/MyHomePageViewModel.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<MyHomePageViewModel>.withConsumer(
      viewModelBuilder: () => MyHomePageViewModel(),
      builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times',
                ),
                Text(
                  '${model.getCounter}',
                ),
              ],
            ),
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FloatingActionButton.extended(
                onPressed: () {
                  model.incrementCounter(); //Increament
                },
                label: Icon(Icons.add),
                elevation: 10,
              ),
              FloatingActionButton.extended(
                onPressed: () {
                  model.decrementCounter(); //Decrement
                },
                label: Center(child: Icon(Icons.minimize)),
                elevation: 10,
              ),
            ],
          )),
    );
  }
}
