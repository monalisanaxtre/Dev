
  import'package:flutter/material.dart';
  import'package:intl/intl.dart';
  // import'package:yoga/Service/servicepost.dart';
  import 'package:yoga/model/booking.dart';
import 'package:yoga/service/service.dart';
  import 'package:yoga/model/trainer.dart';
  import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
  

  class Booking extends StatefulWidget {
    final TrainerData trainerData12;
    final int index12;

     TranerRequest  trainerRequest;
      Booking({Key key,@required this.trainerData12,@required this.index12,this.trainerRequest}):super(key:key);
    @override
    _BookingState createState() => _BookingState(trainerData12,index12,trainerRequest);
  }

  class _BookingState extends State<Booking> {



    String _dropDownValue;
      TrainerData trainerData12;
      final int index12;
      Future<TranerRequest>  tranerRequest;
     TranerRequest  trainerRequest;
      _BookingState(this.trainerData12,this.index12,this.trainerRequest);





    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Booking Details'),
        ),
        body: details(),
      );
    }

    details() {
      return Column(

          children: <Widget>[
        Expanded(
            child: ListView(
               scrollDirection: Axis.vertical,
             children: <Widget>[
               new Padding(
                   padding: EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 2.0),
                   child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                     trainerData12.data[index12].name,
                     maxLines: 1,
                      style: TextStyle(
                      fontSize: 22.0,
                        color: Colors.black,
                       fontWeight: FontWeight.w500,
                         ),
                       ),
                    SizedBox(height: 30),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                       borderRadius: BorderRadius.circular(18),
                       child: Image.network(trainerData12.data[index12].picture),
                          ),
                        ),
                        ]
                  )
               ),
                SizedBox(height: 30),
                Container(
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

      ),
             confirmbooking(),


      ],
      ),

      )
      ]
      );

    }

  }
  class confirmbooking extends StatefulWidget {

    confirmbooking();
    final format = DateFormat("yyyy-MM-dd");

    @override
    _confirmbookingState createState() => _confirmbookingState();
  }

  class _confirmbookingState extends State<confirmbooking>
  {

    ///  Mark:- Creating Variables

    final TextEditingController nameController              = TextEditingController();
    final TextEditingController emailController             = TextEditingController();
    final TextEditingController hostname          = TextEditingController();
    final TextEditingController planselected      = TextEditingController();
    final TextEditingController date              = TextEditingController();
    final TextEditingController time              = TextEditingController();
    final TextEditingController city              = TextEditingController();
    final TextEditingController message           = TextEditingController();

    String name,email;
     Future<TranerRequest>  tranerRequest;
     TranerRequest  trainerRequest;
     DateTime _dateTime;
  //  final format = DateFormat("HH:mm");
    final format = DateFormat("yyyy-MM-dd HH:mm");
    GlobalKey<FormState> _key = new GlobalKey();
    bool _validate = false;
    String _dropDownValue;
    String _dropDownValue1;
    double screenHeight;
    //Country _selected;
    @override
    Widget build(BuildContext context) {
      Text('Basic date field (${format.pattern})');
      DateTimeField(
      format: format,
      onShowPicker: (context, currentValue) {
      return showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      initialDate: currentValue ?? DateTime.now(),
      lastDate: DateTime(2100));
      },
      );
      screenHeight = MediaQuery
          .of(context)
          .size
          .height;
      return Form(
        key: _key,
        autovalidate: _validate,
        child: Column(
          children: <Widget>[
             Container(
                margin: EdgeInsets.only(top: screenHeight / 9),
                padding: EdgeInsets.only(left: 10, right: 10),

              child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 8,
                  child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Align(
                              alignment: Alignment.center,
                              child: Center(child: Text(
                                "Confirm Booking",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              ),
                            ),

                            SizedBox(height: 10,),

                            TextFormField(
                              controller: nameController,
                             //textCapitalization: TextCapitalization.characters,
                              style: TextStyle(color: Colors.black),
                              cursorColor: Colors.greenAccent,
                              cursorRadius: Radius.circular(8.0),
                              //maxLines: 1,
                              maxLength: 32,
                              decoration: InputDecoration(hintText: " Name",
                                  labelText: "Name",
                                  border: OutlineInputBorder()
                              ),
                              validator: validateName,
                              onSaved: (String val){
                                name = val;
                              },
                            ),

                            SizedBox(height: 20,),

                            TextFormField(
                              controller: emailController,
                              // textCapitalization: TextCapitalization.characters,
                              style: TextStyle(color: Colors.black),
                              cursorColor: Colors.greenAccent,
                              cursorRadius: Radius.circular(8.0),
                              //maxLines: 1,
                              maxLength: 32,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(hintText: " Email",
                                  labelText: "Email",
                                  border: OutlineInputBorder()
                              ),
                              validator: validateEmail,
                              onSaved: (String value){
                                email = value;
                              },
                            ),
                            SizedBox(height: 20,),
                            Text('Basic date & time field (${format.pattern})'),
                            DateTimeField(
                              controller: date,
                              format: format,
                              
                              onShowPicker: (context, currentValue) async {
                                final date = await showDatePicker(
                                    context: context,
                                    firstDate: DateTime(1900),
                                    initialDate: currentValue ?? DateTime.now(),
                                    lastDate: DateTime(2100));
                                if (date != null) {
                                  final time = await showTimePicker(
                                    context: context,
                                    initialTime:
                                    TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                                  );
                                  return DateTimeField.combine(date, time);
                                } else {
                                  return currentValue;
                                }
                              },
                            ),
                            SizedBox(height: 30),
                            Container(

                              decoration: BoxDecoration(

                             borderRadius: BorderRadius.circular(6)),
                              child: DropdownButtonFormField(
                                hint: _dropDownValue == null
                                    ? Text('State')
                                    : Text(
                                  _dropDownValue,
                                  

                                  style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                                ),
                                  validator: (value) => value == null ? 'field required' : null,
                                isExpanded: true,
                                iconSize: 42.0,
                                style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),
                                items: ['odisha', 'punjab', 'delhi'].map(
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
                              //      CountryPicker(
                              //        showDialingCode: true,
                              //        onChanged: (Country country) {
                              //          setState(() {
                              //            _selected = country;
                              //          });
                              //        },
                              //        selectedCountry: _selected,
                              //      ),

                            ),
                            SizedBox(height: 30),
                            Container(

                              decoration: BoxDecoration(

                                  borderRadius: BorderRadius.circular(6)),
                              child: DropdownButtonFormField(
                                hint: _dropDownValue1 == null
                                    ? Text('City')
                                    : Text(
                                  _dropDownValue1,
                                  style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                                ),
                                  validator: (value) => value == null ? 'field required' : null,
                                isExpanded: true,
                                iconSize: 42.0,
                                style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),
                                items: ['bhubaneswar', 'chandigarh', 'delhi'].map(
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
                                      _dropDownValue1 = val;

                                    },
                                  );
                                },
                              ),
                            ),



                            SizedBox(height: 10,),
                            TextFormField(
                              controller: message,
                              textCapitalization: TextCapitalization.characters,
                              style: TextStyle(color: Colors.black),
                              cursorColor: Colors.greenAccent,
                              cursorRadius: Radius.circular(8.0),
                              maxLines: 3,
                              decoration: InputDecoration(hintText: " message",
                                  labelText: "Message",
                                  border: OutlineInputBorder()
                              ),
                            ),


                            SizedBox(height:20),


                            FlatButton(

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
                                const Text('Confirm', style: TextStyle(fontSize: 20)),
                                ),
                                onPressed: _sendToServer,
                                
//                              onPressed:
//                                  () {
//                                setState(() {
//                                  tranerRequest = createTrainer(name,email) ;
//                                }
//                                );
//
//                                showDialog(
//                                    context: context,
//                                    builder: (context) {
//                                      return Dialog(
//                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                                          elevation: 8,
//                                          child: Container(
//                                            height: 100,
//                                            width: 250,
//
//                                            child: Center(
//                                              child: Text(
//                                                "Data Inserted Sucessfully",
//                                                style: TextStyle(fontSize: 20, color: Colors.blue, fontWeight: FontWeight.bold),
//                                              ),
//                                            ),
//                                          )
//                                      );
//                                    }
//                                );
//                              },
                            ),


                          ]
                      )
                  )
                 )
            )
          ],
        ),
      );
  }
  
  
  String validateName(String value) {
  String patttern = r'(^[a-zA-Z ]*$)';
  RegExp regExp = new RegExp(patttern);
  if (value.length == 0) {

    return "Name is Required";
  } else if (!regExp.hasMatch(value)) {
    return "Name must be a-z and A-Z";
  }
  return null;
}
String validateEmail(String value) {
  String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = new RegExp(pattern);
  if (value.length == 0) {
    return "Email is Required";
  } else if(!regExp.hasMatch(value)){
    return "Invalid Email";
  }else {
    return null;
  }
}
    _sendToServer() {
      
      if (_key.currentState.validate()) {
        // No any error in validation
        _key.currentState.save();
        print("Name $name");

        print("Email $email");
      } else {
        // validation error
        setState(() {
          _validate = true;
           tranerRequest = createTrainer(nameController.text,emailController.text) ;
          
        }
        );
                               showDialog(
                                   context: context,
                                   builder: (context) {
                                     return Dialog(
                                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                         elevation: 8,
                                         child: Container(
                                           height: 100,
                                           width: 250,
                                           child: Center(
                                             child: Text(
                                               "Data Inserted Sucessfully",
                                               style: TextStyle(fontSize: 20, color: Colors.blue, fontWeight: FontWeight.bold),
                                             ),
                                           ),
                                         )
                                     );
                                   });
      }
    }
  }