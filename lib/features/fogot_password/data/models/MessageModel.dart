class MessageModel {
  MessageModel({this.statusMsg, this.message, this.status});

  MessageModel.fromJson(dynamic json) {
    statusMsg = json['statusMsg'];
    message = json['message'];
    status = json["status"];
    token = json["token"];
  }
  String? statusMsg;
  String? message;
  String? status;
  String? token;
}
