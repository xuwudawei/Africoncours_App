import 'package:flutter/material.dart';

Color myGreen = Color(0xff4bb17b);
enum MessageType { sent, received }
List<Map<String, dynamic>> friendsList = [
  {
    'imgUrl':
        'https://cdn.pixabay.com/photo/2019/11/06/17/26/gear-4606749_960_720.jpg',
    'username': 'John',
    'lastMsg': 'Sure, let me send it you right away.',
    'seen': true,
    'hasUnSeenMsgs': false,
    'unseenCount': 2,
    'lastMsgTime': '18:44',
    'isOnline': true
  },
  {
    'imgUrl':
        'https://cdn.pixabay.com/photo/2019/11/11/04/33/africa-4617142_960_720.jpg',
    'username': 'Paul',
    'lastMsg': 'Sure, let me send it you right away.',
    'seen': false,
    'hasUnSeenMsgs': false,
    'unseenCount': 0,
    'lastMsgTime': '18:44',
    'isOnline': false
  },
  {
    'imgUrl':
        'https://cdn.pixabay.com/photo/2019/11/05/08/52/adler-4603104_960_720.jpg',
    'username': 'Mike',
    'lastMsg': 'Sure, let me send it you right away.',
    'seen': false,
    'hasUnSeenMsgs': true,
    'unseenCount': 3,
    'lastMsgTime': '18:44',
    'isOnline': true
  },
  {
    'imgUrl':
        'https://cdn.pixabay.com/photo/2015/02/04/08/03/baby-623417_960_720.jpg',
    'username': 'Ben',
    'lastMsg': 'Sure, let me send it you right away.',
    'seen': true,
    'hasUnSeenMsgs': true,
    'unseenCount': 2,
    'lastMsgTime': '18:44',
    'isOnline': true
  },
  {
    'imgUrl':
        'https://cdn.pixabay.com/photo/2012/03/04/01/01/baby-22194_960_720.jpg',
    'username': 'Zih',
    'lastMsg': 'Sure, let me send it you right away.',
    'seen': false,
    'hasUnSeenMsgs': true,
    'unseenCount': 4,
    'lastMsgTime': '18:44',
    'isOnline': true
  },
  {
    'imgUrl':
        'https://cdn.pixabay.com/photo/2015/01/08/18/29/entrepreneur-593358_960_720.jpg',
    'username': 'Ebenezer',
    'lastMsg': 'Sure, let me send it you right away.',
    'seen': false,
    'hasUnSeenMsgs': false,
    'unseenCount': 5,
    'lastMsgTime': '18:44',
    'isOnline': true
  },
  {
    'imgUrl':
        'https://cdn.pixabay.com/photo/2015/01/08/18/29/entrepreneur-593358_960_720.jpg',
    'username': 'Zack',
    'lastMsg': 'Sure, let me send it you right away.',
    'seen': false,
    'hasUnSeenMsgs': true,
    'unseenCount': 3,
    'lastMsgTime': '18:44',
    'isOnline': true
  }
];

List<Map<String, dynamic>> messages = [
  {
    'status': MessageType.received,
    'contactImgUrl':
        'https://cdn.pixabay.com/photo/2015/01/08/18/29/entrepreneur-593358_960_720.jpg',
    'contactName': 'Friend',
    'message': 'Hi mate, I\d like you to help me apply for a competition',
    'time': '08:43 AM'
  },
  {
    'status': MessageType.sent,
    'message': 'Hi, I hope you are doing great!',
    'time': '08:45 AM'
  },
  {
    'status': MessageType.sent,
    'message': 'Send me your CV, as well as your ID card details.',
    'time': '08:45 AM'
  },
  {
    'status': MessageType.received,
    'contactImgUrl':
        'https://cdn.pixabay.com/photo/2015/01/08/18/29/entrepreneur-593358_960_720.jpg',
    'contactName': 'Client',
    'message': 'Sure, let me send it you right away.',
    'time': '08:47 AM'
  },
  {'status': MessageType.sent, 'message': 'Ok.Sure', 'time': '08:45 AM'},
];
