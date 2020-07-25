import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:yoga/model/booking.dart';
import 'package:yoga/model/trainer.dart';
class Services_Trainer{
  static const String url = "https://oakremote.com/1on1yog_api/trainer_list.php";
  static Future<TrainerData> getTrainerData() async {
    try{
      final response = await http.get(url);
      if(response.statusCode == 200){
        final TrainerData trainerData = trainerDataFromJson(response.body);
        return trainerData;
      }else{
        return TrainerData();
      }
    }catch(e){
      return TrainerData();
    }
  }
}
Future<TranerRequest> createTrainer( String name1,String email1) async{
  final String apiUrl = "http://oakremote.com/1on1yog_api/booking.php";

  final http.Response  response = await http.post(apiUrl,
      headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode(<String, String>{

        "hostid":'12'.toString(),
        "hostname":'mona',
        "PlanSelected":'30 classes (USD 15 per class)',
    "name": name1,
    "email": email1,
     "date" : '2020-06-30',
    "time": '12.52',
    "state": '2',
    "city": '3',
    "message": 'hi mona',

   }),
  );
  if(response.statusCode == 200){
   debugPrint("One Trainer Inserted");
   debugPrint(response.body);
    return TranerRequest.fromJson(json.decode(response.body));

  }else{
    debugPrint("error");
  }
}
