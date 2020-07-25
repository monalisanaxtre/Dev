// To parse this JSON data, do
//
//     final tranerRequest = tranerRequestFromJson(jsonString);

import 'dart:convert';

TranerRequest tranerRequestFromJson(String str) => TranerRequest.fromJson(json.decode(str));

String tranerRequestToJson(TranerRequest data) => json.encode(data.toJson());

class TranerRequest {
  TranerRequest({
    this.hostId,
    this.hostName,
    this.name,
    this.email,
    this.planSelected,
    this.date,
    this.time,
    this.state,
    this.city,
    this.message,
  });

  int hostId;
  String hostName;
  String name;
  String email;
  String planSelected;
  String date;
  //DateTime date;
  String time;
  int state;
  int city;
  String message;

  factory TranerRequest.fromJson(Map<String, dynamic> json) => TranerRequest(
    hostId: json["host_id"],
    hostName: json["host_name"],
    name: json["name"],
    email: json["email"],
    planSelected: json["plan_selected"],
    //date: DateTime.parse(json["date"]),
    date : json["date"],
    time: json["time"],
    state: json["state"],
    city: json["city"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "host_id": hostId,
    "host_name": hostName,
    "name": name,
    "email": email,
    "plan_selected": planSelected,
   // "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "date" : date,
    "time": time,
    "state": state,
    "city": city,
    "message": message,
  };
}




    /// USER RESPPONCE CLASSMODEL



// To parse this JSON data, do
//
//     final tranerResponse = tranerResponseFromJson(jsonString);


TranerResponse tranerResponseFromJson(String str) => TranerResponse.fromJson(json.decode(str));

String tranerResponseToJson(TranerResponse data) => json.encode(data.toJson());

class TranerResponse {
  TranerResponse({
    this.status,
    this.msg,
  });

  int status;
  String msg;

  factory TranerResponse.fromJson(Map<String, dynamic> json) => TranerResponse(
    status: json["status"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
  };
}








