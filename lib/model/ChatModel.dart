class ChatModel {
  String? sender;
  String? message;
  String? sentAt;

  ChatModel({this.sender, this.message, this.sentAt});

  ChatModel.fromJson(Map<String, dynamic> json) {
    sender = json['sender'];
    message = json['message'];
    sentAt = json['sent_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sender'] = sender;
    data['message'] = message;
    data['sent_at'] = sentAt;
    return data;
  }
}
