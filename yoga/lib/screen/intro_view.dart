// import 'package:flutter/material.dart';
// import 'package:intro_views_flutter/Models/page_view_model.dart';
// import 'package:intro_views_flutter/intro_views_flutter.dart';

// import 'package:yoga/screen/trainerlist.dart';

// class IntroView extends StatelessWidget {
//   //making list of pages needed to pass in IntroViewsFlutter constructor.
//   final pages = [
//     PageViewModel(
//         pageColor: const Color(0xFF03A9F4),
//         // iconImageAssetPath: 'assets/air-hostess.png',
// //        bubble: Image.asset('asset/image/pos.jpg'),
//         body: Text(
//           'Do your Practice of Physical exercise and relaxation',
//         ),


'
//         title: Text(
//           ' Practise Yoga',
//         ),
//         titleTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
//         bodyTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
//         mainImage: Image.asset(
//           'asset/image/pos2.jpg',
// //          height: 285.0,
// //          width: 285.0,
//           alignment: Alignment.center,
//         )),
//     PageViewModel(
//       pageColor: const Color(0xFF8BC34A),
// //      iconImageAssetPath: 'asset/image/pos.jpg',
//       body: Text(
//         'Meditation is the key to Productivity,Happiness & Logivity',
//       ),
//       title: Text('Meditation'),
//       mainImage: Image.asset(
//         'assets/images/yoga.png',
//         height: 500.0,
//         width: 500.0,
//         alignment: Alignment.center,
//       ),
//       titleTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
//       bodyTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
//     ),
//     PageViewModel(
//       pageColor: const Color(0xFF607D8B),
// //      iconImageAssetPath: 'asset/image/food.jpg',
//       body: Text(
//         'Develop the habit of eating what makes you healthy and Energy',
//       ),
//       title: Text('Eat Helathy'),
//       mainImage: Image.asset(
//         'assets/images/food.jpg',
//         height: 285.0,
//         width: 285.0,
//         alignment: Alignment.center,
//       ),
//       titleTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
//       bodyTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'IntroViews Flutter', //title of app
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ), //ThemeData
//       home: Builder(
//         builder: (context) => IntroViewsFlutter(
//           pages,
//           showNextButton: true,
//           showBackButton: true,
//           onTapDoneButton: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => showTrainserData(),
//               ), //MaterialPageRoute
//             );
//           },
//           pageButtonTextStyles: TextStyle(
//             color: Colors.white,
//             fontSize: 18.0,
//           ),
//         ), //IntroViewsFlutter
//       ), //Builder
//     ); //Material App
//   }
// }
