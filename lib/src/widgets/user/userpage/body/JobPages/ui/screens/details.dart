import 'package:flutter/material.dart';
import '../../global.dart';

class DetailsScreen extends StatelessWidget {
  final int id;

  const DetailsScreen({Key key, @required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height / 2,
            child: Image.asset(
              'assets/images/programming.jpg',
              colorBlendMode: BlendMode.darken,
              fit: BoxFit.cover,
              //color: Colors.black38,
            ),
            // child: Image.network(
            //   "https://image.flaticon.com/teams/slug/google.jpg",
            //   fit: BoxFit.cover,
            //   color: Colors.black38,
            //   colorBlendMode: BlendMode.darken,
            // ),
          ),
          Positioned(
            top: 30,
            left: 0,
            right: 0,
            child: Row(
              children: <Widget>[
                IconButton(
                  iconSize: 30,
                  icon: Icon(
                    Icons.chevron_left,
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
                Spacer(),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: MediaQuery.of(context).size.height / 2,
            child: Container(
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "${jobList[id].title}",
                      style: Theme.of(context).textTheme.headline,
                    ),
                    Text(
                      "${jobList[id].location}",
                      style: Theme.of(context)
                          .textTheme
                          .body2
                          .apply(color: Colors.grey),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      "Overview",
                      style: Theme.of(context).textTheme.subhead,
                    ),
                    Text(
                      "${jobList[id].description}",
                      style: Theme.of(context)
                          .textTheme
                          .body2
                          .apply(color: Colors.grey),
                      maxLines: 3,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      "Photos",
                      style: Theme.of(context).textTheme.subhead,
                    ),
                    SizedBox(height: 5),
                    Container(
                      height: 80,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: jobList[id].photos.length,
                        itemBuilder: (ctx, i) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 9.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Image.asset('assets/images/google.jpg'),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.height * .7,
                      height: 45,
                      child: RaisedButton(
                        child: Text(
                          "Apply",
                          style: Theme.of(context)
                              .textTheme
                              .button
                              .apply(color: Colors.white),
                        ),
                        color: Colors.blue,
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
