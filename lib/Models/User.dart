// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.id,
    this.mobileNumber,
    this.inrdNo,
    this.emailId,
    this.firstname,
    this.lastname,
    this.mpin,
    this.state,
    this.country,
    this.kycStatus,
    this.countryCode,
    this.referenceId,
    this.referredId,
    this.status,
    // this.modifiedAt,
  });

  String? id;
  String? mobileNumber;
  String? inrdNo;
  String? emailId;
  String? firstname;
  String? lastname;
  String? mpin;
  String? state;
  String? country;
  String? kycStatus;
  String? countryCode;
  String? referenceId;
  String? referredId;
  String? status;
  // String? modifiedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"],
    mobileNumber: json["mobile_number"],
    inrdNo: json["inrd_no"],
    emailId: json["email_id"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    mpin: json["mpin"],
    state: json["state"],
    country: json["country"],
    kycStatus: json["kyc_status"],
    countryCode: json["country_code"],
    referenceId: json["reference_id"],
    referredId: json["referred_id"],
    status: json["status"],
    // modifiedAt: json["modified_at"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "mobile_number": mobileNumber,
    "inrd_no": inrdNo,
    "email_id": emailId,
    "firstname": firstname,
    "lastname": lastname,
    "mpin": mpin,
    "state": state,
    "country": country,
    "kyc_status": kycStatus,
    "country_code": countryCode,
    "reference_id": referenceId,
    "referred_id": referredId,
    "status": status,
    // "modified_at": modifiedAt,
  };
}
