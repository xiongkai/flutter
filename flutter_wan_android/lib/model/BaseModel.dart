
import 'package:wanandroid/http/Ack.dart';

class BaseModel<T>{
  int errorCode;
  String errorMsg;
  T data;

  BaseModel({this.errorCode, this.errorMsg});

  factory BaseModel.fromJson(ACK ack){
    return BaseModel(
        errorCode: ack.errorCode,
        errorMsg: ack.errorMsg,
    );
  }
}