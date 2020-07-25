import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:yoga/model/trainer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:yoga/screen/trainerdetail.dart';

class webview_Detail extends StatefulWidget {
  final TrainerData trainerDetail;
  final int index1;
  webview_Detail({
    Key key,
    @required this.trainerDetail,
    @required this.index1,
  }) : super(key: key);
  @override
  _webview_DetailState createState() =>
      _webview_DetailState(trainerDetail, index1);
}
class _webview_DetailState extends State<webview_Detail> {
  TrainerData trainerDetail;
  int index1;
  _webview_DetailState(this.trainerDetail, this.index1);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: WebviewScaffold(
          url: trainerDetail.data[index1].link,
          hidden: true,
          appBar: new AppBar(
            title: Text(
              trainerDetail.data[index1].name,
              style: GoogleFonts.roboto(
                  fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ));

//     return Scaffold(
//         // body: WebView(initialUrl:trainerDetail.data[index1].link,
//      appBar: AppBar(centerTitle: true,
// title: Text('Trainer Detail',
//  style: GoogleFonts.roboto(
//               fontSize: 22.0,
//               fontWeight: FontWeight.bold
// ),),),
//         body:
//         IndexedStack(index: position,
//          children: <Widget>[
//            WebviewScaffold(
//              url: 'https:\/\/1on1yog.com\/experiences\/6',

//             // debuggingEnabled: true,

//         // initialUrl: trainerDetail.data[index1].link,
//         // javascriptMode: JavascriptMode.unrestricted,
//         // onPageFinished: doneLoading,
//         // onPageStarted: startLoading,
//         key: key,
//       ),

//         //  Center(child: CircularProgressIndicator(),
//       // ),
//     ]));
  }
}
