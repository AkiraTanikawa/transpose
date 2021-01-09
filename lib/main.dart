import 'package:flutter/material.dart';

void main() {
  runApp(AkiraApp());
}

class AkiraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(title: 'Akira App'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  TextEditingController _inputController = TextEditingController();
  TextEditingController _outputController = TextEditingController();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  void dispose() {
    _inputController.dispose();
    _outputController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _inputController.addListener(transpose);
  }

  void transpose() {
    setState(() {
      _outputController.text = _inputController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildinputRow(),
          SizedBox(
            height: 40,
          ),
          buildTransposeRow(),
          buildoutputRow(),
        ],
      ),
    );
  }

  Row buildTransposeRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          iconSize: 60,
          icon: Icon(Icons.arrow_circle_down),
          onPressed: _decrementCounter,
        ),
        SizedBox(width: 20),
        Text(
          '$_counter',
          style: Theme.of(context).textTheme.headline4,
        ),
        SizedBox(width: 20),
        IconButton(
          iconSize: 60,
          icon: Icon(
            Icons.arrow_circle_up,
          ),
          onPressed: _incrementCounter,
        ),
      ],
    );
  }

  Widget buildoutputRow() {
    return Container(
      padding: EdgeInsets.all(12),
      width: 350,
      child: TextField(
        controller: _outputController,
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget buildinputRow() {
    return Container(
      width: 350,
      child: TextFormField(
        controller: _inputController,
        decoration: InputDecoration(
          labelText: 'コードを入力してください',
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
