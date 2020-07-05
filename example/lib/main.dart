import 'package:circularmenu/circular_layout.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> widgetList = List();

  @override
  void initState() {
    widgetList.add(_getMenuWidget(Icons.add));
    widgetList.add(_getMenuWidget(Icons.access_alarm));
    widgetList.add(_getMenuWidget(Icons.access_time));
    widgetList.add(_getMenuWidget(Icons.accessibility));
    widgetList.add(_getMenuWidget(Icons.accessible));
    widgetList.add(_getMenuWidget(Icons.accessible_forward));
    widgetList.add(_getMenuWidget(Icons.account_box));
    super.initState();
  }

  _getMenuWidget(IconData icon) {
    return Container(
      height: 60,
      width: 60,
      child: Icon(
        icon,
        color: Colors.blue,
      ),
      decoration: _getBoxDecoration(),
    );
  }

  _getBoxDecoration() {
    return BoxDecoration(
      shape: BoxShape.circle,color: Colors.orange
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: CircularLayout(widgetList),
      ),
    );
  }
}
