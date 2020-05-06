import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../../../provider/User.dart';
import '../../../../../../request/userInfoUpdate.dart';
import '../../../../firstpage/firstpage.dart';
import '../../AccountSecurityPages/change_phone_number.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:provider/provider.dart';

class ChangeProfilePicture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Profile Picture'),
        backgroundColor: Color.fromRGBO(220, 20, 47, 0.7),
      ),
      body: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File _selectedFile;
  bool _inProcess = false;

  Future uploadImage() async {
    String fileName = basename(_selectedFile.path);
    StorageReference firebaseStorageRef =
        FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(_selectedFile);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    var imageUrl = await taskSnapshot.ref.getDownloadURL();
    print(imageUrl);
    return imageUrl;
  }

  Widget getImageWidget() {
    if (_selectedFile != null) {
      return Image.file(
        _selectedFile,
        width: 250,
        height: 250,
        fit: BoxFit.cover,
      );
    } else {
      return CachedNetworkImage(
        imageUrl: (''),
        width: 250,
        height: 250,
        fit: BoxFit.cover,
      );
    }
  }

  getImage(ImageSource source) async {
    // this.setState(() {
    //   _inProcess = true;
    // });
    try {
      File image = await ImagePicker.pickImage(source: source);
      if (image != null) {
        this.setState(() {
          _selectedFile = image;
          // _inProcess = false;
        });
        print('Image source is$image');
      } else {
        this.setState(() {
          _inProcess = false;
        });
      }
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    final userInfo = Provider.of<UserInfoProvider>(context);
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // getImageWidget(),
            SizedBox(
              height: 50,
            ),
            Container(
              width: 200,
              height: 200,
              child: CircleAvatar(
                radius: 100,
                backgroundColor: Color.fromRGBO(220, 20, 47, 0.7),
                // backgroundImage: NetworkImage(
                //   studentInfo.getStudentInfo["avatar"],
                // ),
                child: ClipOval(
                  child: SizedBox(
                    width: 180,
                    height: 180,
                    child: ((_selectedFile != null)
                        ? Image.file(_selectedFile)
                        : Image.network(
                            userInfo.getUserInfo["avatar"],
                          )),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MaterialButton(
                    color: Color.fromRGBO(220, 20, 47, 0.7),
                    child: Text(
                      "Camera",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      getImage(ImageSource.camera);
                    }),
                MaterialButton(
                    color: Color.fromRGBO(220, 20, 47, 0.7),
                    child: Text(
                      "Device",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      getImage(ImageSource.gallery);
                    })
              ],
            ),
            ButtonTheme(
              minWidth: MediaQuery.of(context).size.width - 140,
              child: RaisedButton(
                child: Text(
                  "Update",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                color: Color.fromRGBO(220, 20, 47, 0.7),
                onPressed: () {
                  Future snap = uploadImage();
                  snap.then(
                    (onValue) {
                      var data = {"avatar": onValue};
                      Update update = Update(
                        id: userInfo.getUserInfo["_id"],
                        upDateInfo: data,
                        token: userInfo.getUserInfo["auth_token"],
                      );
                      Future<Map> updatedInfo = update.update();
                      updatedInfo.then((onValue) {
                        userInfo.setUserInfo(onValue);
                      });
                    },
                  );
                },
              ),
            )
          ],
        ),
        (_inProcess)
            ? Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.95,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Center()
      ],
    ));
  }
}
