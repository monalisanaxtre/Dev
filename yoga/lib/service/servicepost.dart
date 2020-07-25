// import 'package:flutter/cupertino.dart';
// import 'package:http/http.dart' as http;
// import 'package:yoga/model/booking.dart';




// Future<TranerRequest>createTrainer(String name,String email)  async{
//   final String url="https://oakremote.com/1on1yog_api/trainer_list.php";

//   final response=await http.post(url,body:{
// "name":name,
// "email":email,
// "hostid":24,
// "hostName":"monalisa",
// "planselected":"2345",
// "date":"454",
// "time":"2611",
// "state":23,
// "city":1,
// "message":"inserted",
//   });
//   if(response.statusCode==200){
//     final String responseString=response.body;
//     return tranerRequestFromJson(responseString);
//     debugPrint(responseString);
//   }
//   else{
//     debugPrint("error");
//   }

  
// }
