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
import 'package:loading/indicator/ball_spin_fade_loader_indicator.dart';
import 'package:loading/loading.dart';

var color = 0xFF784ADE;

class ChangeProfilePicture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Profile Picture'),
        backgroundColor: Color(color),
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
  bool isLoading = false;
  GlobalKey<ScaffoldState> _scaffold = new GlobalKey<ScaffoldState>();

  Future uploadImage() async {
    String fileName = basename(_selectedFile.path);
    StorageReference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('avatar' + fileName);
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
        key: _scaffold,
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
                    backgroundImage: NetworkImage(
                      userInfo.getUserInfo["avatar"],
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
                    onPressed: (_selectedFile == null)
                        ? null
                        : () async {
                            setState(() {
                              isLoading = true;
                            });
                            var snap = await uploadImage();

                            var data = {"avatar": snap};
                            Update update = Update(
                              id: userInfo.getUserInfo["_id"],
                              upDateInfo: data,
                              token: userInfo.getUserInfo["auth_token"],
                            );
                            var updatedInfo = await update.update();
                            userInfo.setUserInfo(updatedInfo);
                            setState(() {
                              isLoading = false;
                              _selectedFile = null;
                            });
                            showSnapBar();
                          },
                  ),
                ),
                (isLoading == true ? loadingWidget(context) : Text(""))
              ],
            ),
          ],
        ));
  }

  Widget loadingWidget(context) {
    return Center(
      child: Loading(
        indicator: BallSpinFadeLoaderIndicator(),
        color: Colors.pink,
        size: 50,
      ),
    );
  }

  showSnapBar() {
    final snackBar = new SnackBar(
      duration: new Duration(seconds: 3),
      backgroundColor: Color.fromRGBO(220, 20, 47, 0.7),
      content: Text(
        "User Avatar updated successfully",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
        ),
      ),
    );
    _scaffold.currentState.showSnackBar(snackBar);
  }
}
