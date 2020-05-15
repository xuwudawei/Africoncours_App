import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../competitionGlobal.dart';

class CompetitionDetailsScreen extends StatelessWidget {
  final int id;

  const CompetitionDetailsScreen({Key key, @required this.id})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool _active = false;
    var today = new DateTime.now();
    DateTime competitionDate = DateTime.parse("${competitionsList[id].date}");
    int result = competitionDate.compareTo(today);
    if (result > 0) {
      _active = true;
    }
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
                      "${competitionsList[id].title}",
                      style: Theme.of(context).textTheme.headline,
                    ),
                    Text(
                      "${competitionsList[id].date}",
                      style: Theme.of(context).textTheme.headline,
                    ),
                    Text(
                      "${competitionsList[id].location}",
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
                      "${competitionsList[id].description}",
                      style: Theme.of(context)
                          .textTheme
                          .body2
                          .apply(color: Colors.grey),
                      maxLines: 3,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "Cost: ${competitionsList[id].cost}",
                      style: Theme.of(context).textTheme.subhead,
                    ),
                    SizedBox(
                      height: 10.0,
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
                        itemCount: competitionsList[id].photos.length,
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
                          _active ? "Apply" : "Expired",
                          style: Theme.of(context)
                              .textTheme
                              .button
                              .apply(color: Colors.white),
                        ),
                        color: _active ? Colors.blue : Colors.grey[600],
                        onPressed: () {
                          if (_active) {
                            print("yes");
                            print(result);
                            print(_active);
                          } else {
                            print(result);
                            print("No");
                            print(today);
                            print("${competitionsList[id].date}");
                          }
                        },
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

// class ApplyButton extends StatefulWidget {
//   @override
//   _ApplyButtonState createState() => _ApplyButtonState();
// }

// class _ApplyButtonState extends State<ApplyButton> {
//   @override
//   bool _active = false;
//   void _statusChecker() {
//     if (true) {
//       _active = true;
//     }
//   }

//   Widget build(BuildContext context) {
//     return GestureDetector(
//       child: RaisedButton
//       (
//         child: Text(
//           _active ? "Apply" : "Expired",
//           style: Theme.of(context).textTheme.button.apply(color: Colors.white),
//         ),
//         color: _active ? Colors.blue : Colors.grey[600],
//         onPressed: () {
//           if (_active) {
//             print("yes");
//           } else {
//             print("No");
//           }
//         },
//       ),
//     );
//   }
// }
