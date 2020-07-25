// To parse this JSON data, do
//
//     final trainerData = trainerDataFromJson(jsonString);

// To parse this JSON data, do
//
//     final trainerData = trainerDataFromJson(jsonString);

import 'dart:convert';
TrainerData trainerDataFromJson(String str) => TrainerData.fromJson(json.decode(str));

String trainerDataToJson(TrainerData data) => json.encode(data.toJson());

class TrainerData {
    TrainerData({
        this.status,
        this.message,
        this.data,
    });

    int status;
    String message;
    List<Datum> data;

    factory TrainerData.fromJson(Map<String, dynamic> json) => TrainerData(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.title,
        this.intId,
        this.description,
        this.location,
        this.rating,
        this.duration,
        this.groupsize,
        this.hostin,
        this.whatYouWillDo,
        this.picture,
        this.name,
        this.aboutme,
        this.participate,
        this.bring,
        this.price,
        this.review,
        this.tags,
        this.images,
        this.link,
    });

    String title;
    String intId;
    String description;
    String location;
    String rating;
    String duration;
    // Duration duration;
    String groupsize;
    String hostin;
    // Hostin hostin;
    String whatYouWillDo;
    String picture;
    String name;
    String aboutme;
    String participate;
    String bring;
    // Bring bring;
    String price;
    String review;
    String tags;
    List<String> images;
    String link;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        title: json["title"],
        intId: json["intID"],
        description: json["description"],
        location: json["location"],
        rating: json["rating"],
        // duration: durationValues.map[json["duration"]],
        duration: json["duration"],
        groupsize: json["groupsize"],
        hostin: json["hostin"],
        // hostin: hostinValues.map[json["hostin"]],
        whatYouWillDo: json["what_you_will_do"],
        picture: json["picture"],
        name: json["name"],
        aboutme: json["aboutme"],
        participate: json["participate"],
        bring:json["bring"],
        // bring: bringValues.map[json["bring"]],
        price: json["price"],
        review: json["review"],
        tags: json["tags"],
        images: List<String>.from(json["images"].map((x) => x)),
        link: json["link"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "intID": intId,
        "description": description,
        "location": location,
        "rating": rating,
        "duration":duration,
        // "duration": durationValues.reverse[duration],
        "groupsize": groupsize,
        // "hostin": hostinValues.reverse[hostin],
        "hostin":hostin,
        "what_you_will_do": whatYouWillDo,
        "picture": picture,
        "name": name,
        "aboutme": aboutme,
        "participate": participate,
        "bring":bring,
        // "bring": bringValues.reverse[bring],
        "price": price,
        "review": review,
        "tags": tags,
        "images": List<dynamic>.from(images.map((x) => x)),
        "link": link,
    };
}

enum Bring { THE_1_COMPUTER_OR_MOBILE_PHONE, BRING_1_COMPUTER_OR_MOBILE_PHONE }

final bringValues = EnumValues({
    "1. Computer or mobile phone.": Bring.BRING_1_COMPUTER_OR_MOBILE_PHONE,
    "1. Computer or mobile phone.\u000d\n": Bring.THE_1_COMPUTER_OR_MOBILE_PHONE
});

enum Duration { THE_60_MIN }

final durationValues = EnumValues({
    "60 min": Duration.THE_60_MIN
});

enum Hostin { ENGLISH_HINDI }

final hostinValues = EnumValues({
    "English, Hindi": Hostin.ENGLISH_HINDI
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}

//post


// User userFromJson(String str) => User.fromJson(json.decode(str));

// String userToJson(User data) => json.encode(data.toJson());

// class User {
//     User({
//         this.status,
//         this.msg,
//     });

//     int status;
//     String msg;
//     factory User.fromJson(Map<String, dynamic> json) => User(
//         status: json["status"],
//         msg: json["msg"],
//     );

//     Map<String, dynamic> toJson() => {
//         "status": status,
//         "msg": msg,
//     };
// }
