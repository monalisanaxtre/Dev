import 'package:flutter/material.dart';
import 'package:yoga/service/service.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yoga/model/trainer.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:yoga/screen/webview_detail.dart';

class showTrainserData extends StatefulWidget {
  final TrainerData trainerData;
  showTrainserData({Key key, @required this.trainerData}) : super(key: key);
  @override
  _showTrainserDataState createState() => _showTrainserDataState(trainerData);
}
class _showTrainserDataState extends State<showTrainserData> {
  TrainerData trainerData;
  final FirebaseMessaging _messaging = FirebaseMessaging();
  /// Mark:- Creating variables
  _showTrainserDataState(this.trainerData);
  bool _loading;
  int _index = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _messaging.getToken().then((token) {
      print(token);
    });
    _loading = true;
    Services_Trainer.getTrainerData().then((trainers) {
      setState(() {
        trainerData = trainers;
        _loading = true;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    //trainerData1.data = List<Datum>();

/*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2.1;
    final double itemWidth = size.width / 2;
     return Scaffold(
      //backgroundColor: Colors.grey,
        appBar: new AppBar(
          centerTitle: true,
         title: new Text("1on1yog",
           style: GoogleFonts.roboto(
              fontSize: 22.0,
              fontWeight: FontWeight.bold
          ),),
        ),
        body: Center(
          child: FutureBuilder<TrainerData>(
            future:  Services_Trainer.getTrainerData(),
            // ignore: missing_return
            builder: (context,snapshot){
              if(snapshot.hasData){
                return   GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: itemWidth/itemHeight,
                      // crossAxisSpacing: 50,

                    ),
                      itemCount: snapshot.data.data.length, //trainerData1.data.length,
                     itemBuilder: (BuildContext context,int index){
                   //   TrainerData trainerIndex = snapshot.data.data[index] as TrainerData;
                          return  GridTile(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(9, 4, 9, 0),
                            child:  Container(
                               
                                child: InkWell(
                                  child:  Column(
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          child: Card(
                                            semanticContainer: true,
                                            clipBehavior: Clip.antiAliasWithSaveLayer,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10.0)
                                            ),
                                            child: AspectRatio(
                                              aspectRatio: 20.0/18.0,
                                              child: Image.network(snapshot.data.data[index].picture,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),

                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              snapshot.data.data[index].name.toUpperCase(),
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.robotoCondensed(
                                                  fontSize: 12.5,
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                            SizedBox(height: 1),

                                            Text(
                                              snapshot.data.data[index].description,
                                              style: GoogleFonts.roboto(
                                                fontSize: 13.0,
                                                color: new Color(0xff222222),
                                                //fontWeight: FontWeight.w300
                                              ),
                                            ),
                                            SizedBox(height: 3),

                                            Text("Price:  \$ ${snapshot.data.data[index].price}",
                                              style: GoogleFonts.roboto(
                                                fontSize: 11.0,
                                                // fontWeight: FontWeight.bold,
                                                color: Color(0xff848484),),
                                            )
                                          ],
                                        ),
                                      ]
                                  ),
                                  onTap: (){
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) =>
                                            webview_Detail(index1: index,trainerDetail: snapshot.data)
                                        )
                                    );
                                  },
                                )
                            ),
                          )
                      );
                    });
              }
              return Center(child: CircularProgressIndicator(),);
            },
          ),
        )
   );
     }
  }

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     /*24 is for notification bar on Android*/
//     final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
//     final double itemWidth = size.width / 2;
//     // if(trainerData!=null)
//     return Scaffold(
//         appBar: new AppBar(
//           centerTitle: true,
//           title: new Text(trainerData.data==null?_loading:
//             "1on1yog",
//             style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
//           ),
//         ),
//         body: 
//         GridView.builder(
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisSpacing: 0,
//               crossAxisCount: 2,
//               childAspectRatio: itemWidth / itemHeight,
//             ),
//              itemCount:  trainerData.data.length,                                                       
//             itemBuilder: (BuildContext context, int index,) {
//               return GridTile(
//                   child: Padding(
//                       padding: EdgeInsets.fromLTRB(8, 4, 8, 0),
//                       child: Container(
//                           child: InkWell(
//                               onTap: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => webview_Detail(
//                                         trainerDetail: trainerData,
//                                         index1: index),
//                                     //  builder: (context) =>trainerdetail(trainerData12:_trainerData ,index12: index),
//                                   ),
//                                 );
//                               },
//                               child: Column(children: <Widget>[
//                                 Card(
//                                   semanticContainer: true,
//                                   clipBehavior: Clip.antiAliasWithSaveLayer,
//                                   //  elevation: 1.0,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(10.0),
//                                   ),
//                                   child: AspectRatio(
//                                     aspectRatio: 20.0 / 19.0,
//                                     child: Image.network(
//                                       trainerData.data[index].picture,
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ),
//                                 ),
//                                 new Padding(
//                                     padding:
//                                         EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 2.0),
//                                     child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: <Widget>[
//                                           Text(
//                                             trainerData.data[index].name
//                                                 .toUpperCase(),
//                                             style: GoogleFonts.robotoCondensed(
//                                                 fontSize: 11.0,
//                                                 color: Colors.black,
//                                                 fontWeight: FontWeight.bold),
//                                           ),
//                                           SizedBox(
//                                             height: 1,
//                                           ),
//                                           Text(
//                                             trainerData.data[index].description,
//                                             style: GoogleFonts.roboto(
//                                               fontSize: 14.0,
//                                               color: Hexcolor("#222222"),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 2,
//                                           ),
//                                           Text(
//                                             "Price:${trainerData.data[index].price}",
//                                             style: GoogleFonts.roboto(
//                                               fontSize: 10.0,
//                                               color: Hexcolor('#848484'),
//                                             ),
//                                           ),
//                                         ]))
//                               ])))));
//             }))
//             ;
//           //   else{
//           //     return
               
          
//           // Center(child: CircularProgressIndicator());
              
//           //   }
//   }
// }

//                child:Card(
//               semanticContainer: true,
//            clipBehavior: Clip.antiAliasWithSaveLayer,
//               //  elevation: 1.0,
//   shape: RoundedRectangleBorder(
//     borderRadius: BorderRadius.circular(10.0),
//   ),
//               child: InkWell(
//                  onTap: () {
//   Navigator.push(
//     context,
//     MaterialPageRoute(
//      builder: (context) =>trainerdetail(trainerData12:_trainerData ,index12: index),
//     ),
//   );
// },
//   child: Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: <Widget>[
//       AspectRatio(
//         aspectRatio: 20.0 / 19.0,
//         child: Image.network(
//            _trainerData.data[index].picture,
//           fit: BoxFit.cover,
//         ),
//       ),
//       new Padding(
//         padding: EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 2.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               _trainerData.data[index].name,
//               overflow: TextOverflow.ellipsis,
//               style: GoogleFonts.roboto(
//                 fontSize: 12.0,
//                 fontWeight: FontWeight.bold
//               ),
//             ),
//             SizedBox(height: 2,),
//             Text(
//              _trainerData.data[index].description,
//               style: GoogleFonts.roboto(
//                 fontSize: 15.0,
//                 color: Colors.black,
//                 fontWeight: FontWeight.w300
//               ),
//             ),
//             Text("Price:${
//               _trainerData.data[index].price}",
//               style: GoogleFonts.roboto(
//                 fontSize: 15.0,
//                  fontWeight: FontWeight.w300,
//                  color: Colors.black,
//               ),
//             ),
//           ]
//           )
//       )]
//           )
//                    )
//                )
//                );

//       }
//       )
//       );
//            }
//            }
//pageview
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey,
//       appBar: AppBar(title:Text("Trainers") ,

//       ),
//       body: Center(
//         child: SizedBox(
//           width: 350,
//           height: 350, // card height
//           child: PageView.builder(
//             itemCount: _trainerData.data.length,
//             controller: PageController(viewportFraction: 0.7),
//               onPageChanged: (int index) => setState(() => _index = index),
//             itemBuilder: (BuildContext context, i) {
//               return Transform.scale(
//                 scale: i == _index ? 1 : 0.9,
//                 child: Card(
//                   semanticContainer: true,
//                   clipBehavior: Clip.antiAliasWithSaveLayer,
//                   elevation: 6,
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//                   child:  Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       AspectRatio(
//                         aspectRatio: 20.0 / 19.5,
//                         child: Image.network(
//                           _trainerData.data[i].picture,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                           SizedBox(height: 10),
//                       Padding(
//                           padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
//                         child: Text(_trainerData.data[i].name,style:GoogleFonts.roboto(fontWeight: FontWeight.bold,fontSize: 18.0),
//                         //  TextStyle(
//                         //   fontWeight: FontWeight.bold,
//                         //   fontSize: 18.0
//                         // ),
//                         ),
//                       ),
//                       Padding(padding: EdgeInsets.fromLTRB(10, 4, 10, 0),
//                       child:
//                         Text(
//                    _trainerData.data[i].description,
//                     style: GoogleFonts.roboto( color: Colors.black,fontSize: 12.0,)

//                   ),),
//                   //  Padding(padding: EdgeInsets.fromLTRB(10, 4, 10, 0),
//                   //     child:
//                   //       Text(
//                   //  _trainerData.data[i].rating,
//                   //   style: GoogleFonts.roboto(
//                   //     color: Colors.black,
//                   //     fontSize: 12.0,
//                   //   ),
//                   // ),),

//                    ],
//                   )
//                       // Text("Card ${i+1}"),

//                     ),
//                   );
//             }),
//               )
//               ));

// }
// }
