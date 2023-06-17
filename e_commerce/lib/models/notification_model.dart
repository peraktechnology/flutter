
import 'package:ecom_firebase_user_07/models/comment_model.dart';
import 'package:ecom_firebase_user_07/models/order_model.dart';
import 'package:ecom_firebase_user_07/models/user_model.dart';

const String collectionNotification = 'Notifications';
const String notificationFieldId = 'notificationId';
const String notificationFieldType = 'type';
const String notificationFieldMessage = 'Message';
const String notificationFieldStatus = 'status';
const String notificationFieldComment = 'comment';
const String notificationFieldUser = 'user';
const String notificationFieldOrder = 'order';

class NotificationModel{
  String notificationId;
  String type;
  String message;
  bool   status;
  UserModel? userModel;
  OrderModel? orderModel;
  CommentModel? commentModel;


  NotificationModel({
      required  this.notificationId,
      required this.type,
      required this.message,
      this.status=false,
      this.userModel,
      this.orderModel,
      this.commentModel
      });

  Map<String,dynamic> toMap(){
    return <String,dynamic>{
      notificationFieldId:notificationId,
      notificationFieldType:type,
      notificationFieldStatus:status,
      notificationFieldMessage:message,
      notificationFieldUser:userModel?.toMap(),
      notificationFieldOrder:orderModel?.toMap(),
      notificationFieldComment:commentModel?.toMap()
    };
  }

  factory NotificationModel.fromMap(Map<String,dynamic> map)=>NotificationModel(
    notificationId:map[notificationFieldId],
    type:map[notificationFieldType],
    message:map[notificationFieldMessage],
    status:map[notificationFieldStatus],
    userModel: map[notificationFieldUser]==null? null:UserModel.fromMap(map[notificationFieldUser]),
    orderModel: map[notificationFieldOrder]==null? null:OrderModel.fromMap(map[notificationFieldOrder]),
    commentModel: map[notificationFieldComment]==null? null:CommentModel.fromMap(map[notificationFieldComment]),
  );



}