import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../../provider/User.dart';
import 'package:provider/provider.dart';

class ProfileUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ProfileHeader(
                avatar: CachedNetworkImageProvider(
                    "https://avatars3.githubusercontent.com/u/57068034?s=460&u=d7eb15aed461ed917047aa35da504974596034e9&v=4"),
                coverImage: CachedNetworkImageProvider(
                  "https://avatars3.githubusercontent.com/u/57068034?s=460&u=d7eb15aed461ed917047aa35da504974596034e9&v=4",
                ),
                title: "David Osei Opoku".toUpperCase(),
                subtitle: "xuwudawei@outlook.com",
                actions: <Widget>[
                  MaterialButton(
                    color: Colors.white,
                    shape: CircleBorder(),
                    elevation: 0,
                    child: Icon(Icons.edit),
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed('/user/profile/Edit/selectionPage');
                    },
                  )
                ],
              ),
              const SizedBox(height: 10.0),
              UserInfo(),
            ],
          ),
        ));
  }
}

class UserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
            alignment: Alignment.topLeft,
            child: Text(
              "User Information",
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Card(
            child: Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      ...ListTile.divideTiles(
                        color: Colors.grey,
                        tiles: [
                          ListTile(
                            leading: Icon(Icons.email),
                            title: Text("Email"),
                            subtitle: Text("xuwudawei@outlook.com"),
                          ),
                          ListTile(
                            leading: Icon(Icons.phone),
                            title: Text("Phone"),
                            subtitle: Text("7382432408"),
                          ),
                          ListTile(
                            leading: Icon(Icons.person),
                            title: Text("About Me"),
                            subtitle: Text(
                                "This is a about me link and you can know about me in this section."),
                          ),
                          ListTile(
                            leading: Icon(Icons.location_on),
                            title: Text("Current Address"),
                            subtitle: Text("India"),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  final ImageProvider<dynamic> coverImage;
  final ImageProvider<dynamic> avatar;
  final String title;
  final String subtitle;
  final List<Widget> actions;
  const ProfileHeader(
      {Key key,
      @required this.coverImage,
      @required this.avatar,
      @required this.title,
      this.subtitle,
      this.actions})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Ink(
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(image: coverImage, fit: BoxFit.cover),
          ),
        ),
        Ink(
          height: 200,
          decoration: BoxDecoration(
            color: Colors.black38,
          ),
        ),
        if (actions != null)
          Container(
            width: double.infinity,
            height: 200,
            padding: const EdgeInsets.only(bottom: 0.0, right: 0.0),
            alignment: Alignment.bottomRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: actions,
            ),
          ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 160),
          child: Column(
            children: <Widget>[
              Avatar(
                image: avatar,
                radius: 40,
                backgroundColor: Colors.white,
                borderColor: Colors.grey.shade300,
                borderWidth: 4.0,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.title,
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 5.0),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.subtitle,
                ),
              ]
            ],
          ),
        )
      ],
    );
  }
}

class Avatar extends StatelessWidget {
  final ImageProvider<dynamic> image;
  final Color borderColor;
  final Color backgroundColor;
  final double radius;
  final double borderWidth;
  const Avatar(
      {Key key,
      @required this.image,
      this.borderColor = Colors.blueAccent,
      this.backgroundColor,
      this.radius = 30,
      this.borderWidth = 5})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius + borderWidth,
      backgroundColor: borderColor,
      child: CircleAvatar(
        radius: radius,
        backgroundColor: backgroundColor != null
            ? backgroundColor
            : Theme.of(context).primaryColor,
        child: CircleAvatar(
          radius: radius - borderWidth,
          backgroundImage: image,
        ),
      ),
    );
  }
}
