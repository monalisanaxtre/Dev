import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:yoga/model/trainer.dart';
import'package:yoga/screen/bookinglist.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

class trainerdetail extends StatefulWidget {
final TrainerData trainerData12;
final int index12;

trainerdetail({Key key,@required this.trainerData12,@required this.index12,}):super(key:key);

  
  @override
  _trainerdetailState createState() => _trainerdetailState(trainerData12,index12);
}
class _trainerdetailState extends State<trainerdetail> { 
    TrainerData trainerData12;
    final int index12;
   
    _trainerdetailState(this.trainerData12,this.index12);
    
 
  final _pageController = PageController();
  final _currentPageNotifier = ValueNotifier<int>(0);
  final _boxHeight = 250.0;
  

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Trainer Detail'),
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              _buildPageView(),
               _buildCircleIndicator(),
            ],
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
    new Padding(
    padding: EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 2.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
    Text(trainerData12.data[index12].name,
    
    maxLines: 1,
    style: TextStyle(
    fontSize: 18.0,
   color: Colors.black,
    fontWeight: FontWeight.w500,
    ),
    ),
    //   SizedBox(height: 20),
    // Column(
    // crossAxisAlignment: CrossAxisAlignment.start,
    // children: <Widget>[
    // Text(
    // "Conduct 3 Session Per Day",
    // overflow: TextOverflow.ellipsis,
    // maxLines: 1,
    // style: TextStyle(
    // fontSize: 18.0,
    // color: Colors.black,
    // fontWeight: FontWeight.w300,
    // ),
    // ),
    GetTags(this.trainerData12, this.index12),
    specialization(this.trainerData12, this.index12),
     HostDetails(this.trainerData12,this.index12),
      Participate(this.trainerData12,this.index12),
      necessary(this.trainerData12,this.index12),
      DropDown(),
      Booked(this.trainerData12,this.index12),
              ]
                  .map((item) => Padding(
                child: item,
                padding: EdgeInsets.all(6.0),
              ))
                  .toList(),
            ),
          )])),
        ],
    );
         

  }
  _buildPageView() {
    return Container(
      color: Colors.black87,
      height: _boxHeight,
      child: PageView.builder(
          itemCount:  trainerData12.data[index12].images.length,
          controller: _pageController,
          itemBuilder: (BuildContext context, int index,) {
            return Center(
              child:Image.network(trainerData12.data[index12].images[index].toString()),
                     );
          },
          onPageChanged: (int index) {
            _currentPageNotifier.value = index;
          }),
    );
  }
          onPageChanged (int index) {
            _currentPageNotifier.value = index;
          }
    
  

  _buildCircleIndicator() {
    return Positioned(
      left: 0.0,
      right: 0.0,
      bottom: 0.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CirclePageIndicator(
          itemCount:  trainerData12.data[index12].images.length,
          currentPageNotifier: _currentPageNotifier,
        ),
      ),
    );
  }

}

class GetTags extends StatelessWidget {
  final TrainerData trainerData12;
  final int index12;
  // Duration duration;
 
  GetTags(this.trainerData12, this.index12);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
      height: 35.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          InkWell(
            onTap: () => {},
            child: Container(
              width: 100.0,
              height: 35.0,
              margin: EdgeInsets.only(
                left: 5.0,
                right: 5.0,
              ),

              child: Center(
                 child: Text(
                     trainerData12.data[index12].duration,
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () => {},
            child: Container(
              width: 100.0,
              height: 70.0,
              margin: EdgeInsets.only(
                left: 5.0,
                right: 5.0,
              ),

              child: Center(
                child: Text(
                  'Class Time\nAs per Your Convenience',
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () => {},
            child: Container(
              width: 100.0,
              height: 35.0,
              margin: EdgeInsets.only(
                left: 5.0,
                right: 5.0,
              ),

              child: Center(
                child: Text(
                   trainerData12.data[index12].hostin,
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
class specialization extends StatelessWidget {
   final TrainerData trainerData12;
  final int index12;
  specialization(this.trainerData12, this.index12);

  @override
  Widget build(BuildContext context) {
    return Container(
        
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
               Text(
            "whatYouWillDo",
           
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 20,),
            Text(
            trainerData12.data[index12].whatYouWillDo,
           
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
              SizedBox(height: 20),

      

]));

  }
}
class HostDetails extends StatelessWidget {
   final TrainerData trainerData12;
  final int index12;
  HostDetails(this.trainerData12, this.index12);
 
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        Text(
        "Your Host",
        maxLines: 1,
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.black,
          fontWeight: FontWeight.w400,
        ),
      ),
          SizedBox(height: 10),
          new Container(
              width: 130.0,
              height: 130.0,
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(trainerData12.data[index12].picture),
                  )
              )),
          Text(
            trainerData12.data[index12].name,
            maxLines: 1,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 20),
          Text(
            trainerData12.data[index12].aboutme,
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.black,
            ),
          ),
    ]));
  }
}
class Participate extends StatelessWidget {
  final TrainerData trainerData12;
  final int index12;
  Participate(this.trainerData12, this.index12);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: new Padding(
        padding: EdgeInsets.fromLTRB(0.0, 10.0, 4.0, 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        Text(
        "How to participate",
        maxLines: 1,
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.black,
          fontWeight: FontWeight.w400,
        ),
      ),
          SizedBox(height: 20),
          Text( trainerData12.data[index12].participate,
           
            style: TextStyle(

              fontSize: 15.0,
              color: Colors.black,
            ),
          ),
      ])
    ));
  }
}
class necessary extends StatelessWidget {
  final TrainerData trainerData12;
  final int index12;
  necessary(this.trainerData12, this.index12);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

        Text(
          trainerData12.data[index12].bring,
        maxLines: 1,
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.black,
          fontWeight: FontWeight.w400,
        ),
      ),
        //   SizedBox(height: 20),
        //   Text("1. Computer or mobile phone.",style: TextStyle(

        //     fontSize: 15.0,
        //     color: Colors.black,
        //   ),),
        //   Padding(
        //     padding:EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
        //     child:Container(
        //       height:1.0,
        //       width:380.0,
        //       color:Colors.black,),),
        //   SizedBox(height: 20),
        //   Text("2. Stable internet connection.",style: TextStyle(

        //     fontSize: 15.0,
        //     color: Colors.black,
        //   ),),
        //   Padding(
        //     padding:EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
        //     child:Container(
        //       height:1.0,
        //       width:380.0,
        //       color:Colors.black,),),

        //   SizedBox(height: 20),
        //   Text("3. Yoga Mat.",
        //   style: TextStyle(
        //     fontSize: 15.0,
        //     color: Colors.black,
        //   ),),
        //   Padding(
        //     padding:EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
        //     child:Container(
        //       height:1.0,
        //       width:380.0,
        //       color:Colors.black,),),
        //   SizedBox(height: 20),
        //   Text("4. Flexible/Stretchable comfortable clothing.",
        //     style: TextStyle(
        //       fontSize: 15.0,
        //       color: Colors.black,
        //     ),),
        //   Padding(
        //     padding:EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
        //     child:Container(
        //       height:1.0,
        //       width:380.0,
        //       color:Colors.black,),),
        //   SizedBox(height: 20),
        //   Text("5. Please ensure an empty stomach condition.",
        //     style: TextStyle(
        //       fontSize: 15.0,
        //       color: Colors.black,
        //     ),),
        //   Padding(
        //     padding:EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
        //     child:Container(
        //       height:1.0,
        //       width:380.0,
        //       color:Colors.black,),),
        //   SizedBox(height: 20),
        //   Text("6. It will be good if you maintain a conducive environment for the practice. It is best if you are not disturbed for the entire duration of the class.",
        //     style: TextStyle(
        //       fontSize: 15.0,
        //       color: Colors.black,
        //     ),),
        //   Padding(
        //     padding:EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
        //     child:Container(
        //       height:1.0,
        //       width:380.0,
        //       color:Colors.black,),),
        //   SizedBox(height: 40),
        //   Text(
        //     "Availability",
        //     maxLines: 1,
        //     style: TextStyle(
        //       fontSize: 20.0,
        //       color: Colors.black,
        //       fontWeight: FontWeight.w400,
        //     ),
        //   ),
        //   SizedBox(height: 20),
        // Text(
        //     "Conducts maximum 3 classes of one hour in a day, class time can be scheduled as per your convenience",
        //   style: TextStyle(
        //   fontSize: 15.0,
        //   color: Colors.black,
        //         ),),
          SizedBox(height: 50),
    ]));
  }
}
class DropDown extends StatefulWidget {
  @override
  _DropDownState createState() => _DropDownState();
}
class _DropDownState extends State<DropDown> {
  String _dropDownValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(6)),
      child: DropdownButton(
      hint: _dropDownValue == null
          ? Text('1 class(USD 20 per class)')
          : Text(
        _dropDownValue,
        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
      ),
      isExpanded: true,
      iconSize: 42.0,
      style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),
      items: ['1 class(USD 20 per class)', '10 class(USD 18 per class)', '30 class(USD  15 per class)'].map(
            (val) {
          return DropdownMenuItem<String>(
            value: val,
            child: Text(val),
          );
        },
      ).toList(),
      onChanged: (val) {
        setState(
              () {
            _dropDownValue = val;
          },
        );
      },
    ),
    );
  }
  }

  class Booked extends StatelessWidget {
     final TrainerData trainerdata12;
  final int index12;
  Booked(this.trainerdata12,this.index12);
    @override
    Widget build(BuildContext context) {
      return Center(
          child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[ const SizedBox(height: 30),
            RaisedButton(
              onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Booking(trainerData12: trainerdata12, index12: index12,)),
        );

              },
              textColor: Colors.white,
              padding: const EdgeInsets.all(0.0),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      Color(0xFF0D47A1),
                      Color(0xFF1976D2),
                      Color(0xFF42A5F5),
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(10.0),
                child:
                const Text('Book your seat', style: TextStyle(fontSize: 20)),
              ),
            ),
          ],
          ),
      );
    }
  }




















// class HomePage extends StatefulWidget {
  

//   @override
//   HomePageState createState() {
//     return new HomePageState();
//   }
// }
// class HomePageState extends State<HomePage> {
  

//   final _items = [
//     Colors.blue,
//     Colors.orange,
//     Colors.green,
//     Colors.pink,
//     Colors.red,
//     Colors.amber,
//     Colors.brown,
//     Colors.yellow,
//     Colors.blue,
//   ];
//   final _pageController = PageController();
//   final _currentPageNotifier = ValueNotifier<int>(0);
//   final _boxHeight = 250.0;
  

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Trainer Detail'),
//       ),
//       body: _buildBody(),
//     );
//   }

//   _buildBody() {
//     return Column(
//         children: <Widget>[
//           Stack(
//             children: <Widget>[
//               _buildPageView(),
//               _buildCircleIndicator(),
//             ],
//           ),
//           Expanded(
//             child: ListView(
//               scrollDirection: Axis.vertical,
//               children: <Widget>[
//     new Padding(
//     padding: EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 2.0),
//     child: Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: <Widget>[
//     Text(trainerData12.data[index12].name,
    
//     maxLines: 1,
//     style: TextStyle(
//     fontSize: 18.0,
//    color: Colors.black,
//     fontWeight: FontWeight.w500,
//     ),
//     ),
//       SizedBox(height: 20),
//     Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: <Widget>[
//     Text(
//     "Conduct 3 Session Per Day",
//     overflow: TextOverflow.ellipsis,
//     maxLines: 1,
//     style: TextStyle(
//     fontSize: 18.0,
//     color: Colors.black,
//     fontWeight: FontWeight.w300,
//     ),
//     ),
//     GetTags(),
//     specialization(),
//      HostDetails(),
//       Participate(),
//       necessary(),
//       DropDown(),
//       Booked(),
//               ]
//                   .map((item) => Padding(
//                 child: item,
//                 padding: EdgeInsets.all(6.0),
//               ))
//                   .toList(),
//             ),
//           ])),
//         ],
//     )
//           )
//           ]

//           );

//   }
//   _buildPageView() {
//     return Container(
//       color: Colors.black87,
//       height: _boxHeight,
//       child: PageView.builder(
//           itemCount: _items.length,
//           controller: _pageController,
//           itemBuilder: (BuildContext context, int index) {
//             return Center(
//               child: FlutterLogo(
//                 colors: _items[index],
//                 size: 50.0,
//               ),
//             );
//           },
//           onPageChanged: (int index) {
//             _currentPageNotifier.value = index;
//           }),
//     );
//   }

//   _buildCircleIndicator() {
//     return Positioned(
//       left: 0.0,
//       right: 0.0,
//       bottom: 0.0,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         // child: CirclePageIndicator(
//         //   itemCount: _items.length,
//         //   currentPageNotifier: _currentPageNotifier,
//         // ),
//       ),
//     );
//   }


// }
// class GetTags extends StatelessWidget {
//   GetTags();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.center,
//       margin: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
//       height: 35.0,
//       child: ListView(
//         scrollDirection: Axis.horizontal,
//         children: <Widget>[
//           InkWell(
//             onTap: () => {},
//             child: Container(
//               width: 100.0,
//               height: 35.0,
//               margin: EdgeInsets.only(
//                 left: 5.0,
//                 right: 5.0,
//               ),

//               child: Center(
//                  child: Text(
//                   'Duration\n60min',
//                   style: TextStyle(fontSize: 16.0, color: Colors.black),
//                 ),
//               ),
//             ),
//           ),
//           InkWell(
//             onTap: () => {},
//             child: Container(
//               width: 100.0,
//               height: 70.0,
//               margin: EdgeInsets.only(
//                 left: 5.0,
//                 right: 5.0,
//               ),

//               child: Center(
//                 child: Text(
//                   'Class Time\nAs per Your Convenience',
//                   style: TextStyle(fontSize: 16.0, color: Colors.black),
//                 ),
//               ),
//             ),
//           ),
//           InkWell(
//             onTap: () => {},
//             child: Container(
//               width: 100.0,
//               height: 35.0,
//               margin: EdgeInsets.only(
//                 left: 5.0,
//                 right: 5.0,
//               ),

//               child: Center(
//                 child: Text(
//                   'Hosted in\nEnglish,Hindi',
//                   style: TextStyle(fontSize: 16.0, color: Colors.black),
//                 ),
//               ),
//             ),
//           ),

//         ],
//       ),
//     );
//   }
// }
// class specialization extends StatelessWidget {
//   specialization();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         child: new Padding(
//           padding: EdgeInsets.fromLTRB(0.0, 4.0, 4.0, 2.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//             Text(
//             "What you'll do",
//             maxLines: 1,
//             style: TextStyle(
//               fontSize: 20.0,
//               color: Colors.black,
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//               SizedBox(height: 20),

//        Text(
//         "I specialize and bring to my class Shatkarma, Asana, Pranayama, Mudra, and Dhyana techniques. I inculcate in-depth understanding of Yoga Philosophy. I introduce people into traditional Hathayoga, Ashtanga Vinyasa, and Ayurveda.",
//         style: TextStyle(

//           fontSize: 15.0,
//           color: Colors.black,
//         ),
//       ),

// ])));

//   }
// }
// class HostDetails extends StatelessWidget {
//   HostDetails();
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//         Text(
//         "Your Host",
//         maxLines: 1,
//         style: TextStyle(
//           fontSize: 20.0,
//           color: Colors.black,
//           fontWeight: FontWeight.w400,
//         ),
//       ),
//           SizedBox(height: 10),
//           new Container(
//               width: 130.0,
//               height: 130.0,
//               decoration: new BoxDecoration(
//                   shape: BoxShape.circle,
//                   image: new DecorationImage(
//                       fit: BoxFit.fill,
//                       image: AssetImage("asset/image/aakruti.jpg")
//                   )
//               )),
//           Text(
//             "Aakriti Rana",
//             maxLines: 1,
//             style: TextStyle(
//               fontSize: 20.0,
//               color: Colors.black,
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//           SizedBox(height: 20),
//           Text(
//             "Dynamic Yoga teacher with advanced training in all aspects of Yoga. Encourages holistic growth and inspires to improve wellness and commit to long term health goals. Aims to motivate students to explore their potential and heal through the power of Yoga.",
//             style: TextStyle(

//               fontSize: 15.0,
//               color: Colors.black,
//             ),
//           ),
//     ]));
//   }
// }
// class Participate extends StatelessWidget {
//   Participate();
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         child: new Padding(
//         padding: EdgeInsets.fromLTRB(0.0, 10.0, 4.0, 2.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//         Text(
//         "How to participate",
//         maxLines: 1,
//         style: TextStyle(
//           fontSize: 20.0,
//           color: Colors.black,
//           fontWeight: FontWeight.w400,
//         ),
//       ),
//           SizedBox(height: 20),
//           Text(
//             "The classes will be hosted online. Once you book, you’ll receive an email with a link and details on how to join. We will do all of this in the comfort of our homes. Grab your yoga mats, lit some incense sticks and get some distraction free time because we are making this time worth it!",
//             style: TextStyle(

//               fontSize: 15.0,
//               color: Colors.black,
//             ),
//           ),
//       ])
//     ));
//   }
// }
// class necessary extends StatelessWidget {
//   necessary();
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[

//         Text(
//         "What to bring",
//         maxLines: 1,
//         style: TextStyle(
//           fontSize: 20.0,
//           color: Colors.black,
//           fontWeight: FontWeight.w400,
//         ),
//       ),
//           SizedBox(height: 20),
//           Text("1. Computer or mobile phone.",style: TextStyle(

//             fontSize: 15.0,
//             color: Colors.black,
//           ),),
//           Padding(
//             padding:EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
//             child:Container(
//               height:1.0,
//               width:380.0,
//               color:Colors.black,),),
//           SizedBox(height: 20),
//           Text("2. Stable internet connection.",style: TextStyle(

//             fontSize: 15.0,
//             color: Colors.black,
//           ),),
//           Padding(
//             padding:EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
//             child:Container(
//               height:1.0,
//               width:380.0,
//               color:Colors.black,),),

//           SizedBox(height: 20),
//           Text("3. Yoga Mat.",
//           style: TextStyle(
//             fontSize: 15.0,
//             color: Colors.black,
//           ),),
//           Padding(
//             padding:EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
//             child:Container(
//               height:1.0,
//               width:380.0,
//               color:Colors.black,),),
//           SizedBox(height: 20),
//           Text("4. Flexible/Stretchable comfortable clothing.",
//             style: TextStyle(
//               fontSize: 15.0,
//               color: Colors.black,
//             ),),
//           Padding(
//             padding:EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
//             child:Container(
//               height:1.0,
//               width:380.0,
//               color:Colors.black,),),
//           SizedBox(height: 20),
//           Text("5. Please ensure an empty stomach condition.",
//             style: TextStyle(
//               fontSize: 15.0,
//               color: Colors.black,
//             ),),
//           Padding(
//             padding:EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
//             child:Container(
//               height:1.0,
//               width:380.0,
//               color:Colors.black,),),
//           SizedBox(height: 20),
//           Text("6. It will be good if you maintain a conducive environment for the practice. It is best if you are not disturbed for the entire duration of the class.",
//             style: TextStyle(
//               fontSize: 15.0,
//               color: Colors.black,
//             ),),
//           Padding(
//             padding:EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
//             child:Container(
//               height:1.0,
//               width:380.0,
//               color:Colors.black,),),
//           SizedBox(height: 40),
//           Text(
//             "Availability",
//             maxLines: 1,
//             style: TextStyle(
//               fontSize: 20.0,
//               color: Colors.black,
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//           SizedBox(height: 20),
//         Text(
//             "Conducts maximum 3 classes of one hour in a day, class time can be scheduled as per your convenience",
//           style: TextStyle(
//           fontSize: 15.0,
//           color: Colors.black,
//                 ),),
//           SizedBox(height: 50),
//     ]));
//   }
// }
// class DropDown extends StatefulWidget {
//   @override
//   _DropDownState createState() => _DropDownState();
// }
// class _DropDownState extends State<DropDown> {
//   String _dropDownValue;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           color: Colors.grey,
//           borderRadius: BorderRadius.circular(6)),
//       child: DropdownButton(
//       hint: _dropDownValue == null
//           ? Text('1 class(USD 20 per class)')
//           : Text(
//         _dropDownValue,
//         style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
//       ),
//       isExpanded: true,
//       iconSize: 42.0,
//       style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),
//       items: ['1 class(USD 20 per class)', '10 class(USD 18 per class)', '30 class(USD  15 per class)'].map(
//             (val) {
//           return DropdownMenuItem<String>(
//             value: val,
//             child: Text(val),
//           );
//         },
//       ).toList(),
//       onChanged: (val) {
//         setState(
//               () {
//             _dropDownValue = val;
//           },
//         );
//       },
//     ),

//     );
//   }
//   }

//   class Booked extends StatelessWidget {
//   Booked();
//     @override
//     Widget build(BuildContext context) {
//       return Center(
//           child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[ const SizedBox(height: 30),
//             RaisedButton(
//               onPressed: () {
//         // Navigator.push(
//         //   context,
//         //   MaterialPageRoute(builder: (context) => Booking()),
//         // );


//               },
//               textColor: Colors.white,
//               padding: const EdgeInsets.all(0.0),
//               child: Container(
//                 decoration: const BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: <Color>[
//                       Color(0xFF0D47A1),
//                       Color(0xFF1976D2),
//                       Color(0xFF42A5F5),
//                     ],
//                   ),
//                 ),
//                 padding: const EdgeInsets.all(10.0),
//                 child:
//                 const Text('Book your seat', style: TextStyle(fontSize: 20)),
//               ),
//             ),
//           ],
//           ),
//       );
//     }
//   }










