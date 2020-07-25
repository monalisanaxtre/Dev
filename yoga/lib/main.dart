
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yoga/screen/trainerlist.dart';
void main()=>runApp(MyApp());
class MyApp extends StatelessWidget {
  const MyApp({Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
    return MaterialApp(home:  showTrainserData(),
    debugShowCheckedModeBanner: false
    );
  }
}
