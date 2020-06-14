
class ACK{
  int errorCode;
  String errorMsg;
  dynamic data;

  ACK({this.errorCode, this.errorMsg, this.data});

  factory ACK.fromJson(Map<String, dynamic> json){
    return ACK(
      errorCode: json["errorCode"],
      errorMsg: json["errorMsg"],
      data: json["data"]
    );
  }
}