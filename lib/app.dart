import 'package:flutter/material.dart';
import 'package:flutter_date_picker_issue/view/home.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {
  static late AppState instance;

  bool isChangedStructure = false;

  @override
  void initState() {
    super.initState();
    instance = this;
  }

  @override
  Widget build(BuildContext context) {
    print('MyAppState rebuild');
    bool isChangStruct = isChangedStructure;
    isChangedStructure = false;
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: !isChangStruct ? Home() : Container(child: Home()),
      // home: MyHomePage(), // home: const MyHomePage()  // 有 const 与 无 const 是有区别的
    );
  }
}
