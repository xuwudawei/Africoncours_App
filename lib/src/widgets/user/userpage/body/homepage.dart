import 'package:flutter/material.dart';
import 'imageslider.dart';
import '../body/UserHomeScreen.dart';

import '../body/CompetitionsPages/competitionGlobal.dart';
import '../body/CompetitionsPages/ui/widgets/competitionscontainer.dart';
import '../body/CompetitionsPages/ui/screens/competitionDetails.dart';
import '../body/JobPages/global.dart';
import '../body/JobPages/ui/screens/details.dart';
import '../body/JobPages/ui/widgets/jobcontainer.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: SingleChildScrollView(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Hello,",
                                style: Theme.of(context)
                                    .textTheme
                                    .title
                                    .copyWith(color: Colors.grey),
                              ),
                              Text(
                                "David Osei Opoku",
                                style: Theme.of(context)
                                    .textTheme
                                    .display1
                                    .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 9),
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: "Search",
                        filled: true,
                        fillColor: Color(0xffe6e6ec),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text("Top Rated Companies",
                        style: Theme.of(context).textTheme.title),
                    CarouselWithIndicatorDemo(),
                    //SizedBox(height: 9),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 3,
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserHomeScreen(),
                          ),
                        ),
                        child: Stack(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerRight,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: Image.network(
                                  "https://images.pexels.com/photos/2897883/pexels-photo-2897883.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                                ),
                              ),
                            ),
                            Positioned.fill(
                              child: Container(
                                padding: const EdgeInsets.all(11.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  //color: Colors.blue.withOpacity(.3),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    // Text(
                                    //   "Click here to view your offers",
                                    //   style: TextStyle(
                                    //       color: Colors.lightGreen,
                                    //       fontSize: 16,
                                    //       fontWeight: FontWeight.bold),
                                    // ),
                                    RaisedButton(
                                      elevation: 60,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      color: Color.fromRGBO(37, 211, 102, 1),
                                      child: Text(
                                        "View All My Offers",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              UserHomeScreen(),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Categories",
                        style: Theme.of(context).textTheme.title),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 9.0),
                      height: 100,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed('/user/sidemenu/contest/ongoing');
                            },
                            child: Container(
                              constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width / 1.6),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 9.0),
                              padding: const EdgeInsets.all(9.0),
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xffe6e6ec)),
                                borderRadius: BorderRadius.circular(9.0),
                              ),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.all(5.0),
                                    decoration: BoxDecoration(
                                      //color: categories[f]['color'],
                                      borderRadius: BorderRadius.circular(9.0),
                                    ),
                                    child: Image.asset(
                                        "assets/images/programming.jpg"),
                                  ),
                                  SizedBox(width: 5),
                                  Flexible(
                                    child: Text("Recent Contests"),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed('/user/sidemenu/competitions');
                            },
                            child: Container(
                              constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width / 1.65),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 9.0),
                              padding: const EdgeInsets.all(9.0),
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xffe6e6ec)),
                                borderRadius: BorderRadius.circular(9.0),
                              ),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.all(5.0),
                                    decoration: BoxDecoration(
                                      //color: categories[f]['color'],
                                      borderRadius: BorderRadius.circular(9.0),
                                    ),
                                    child: Image.asset(
                                        "assets/images/programming.jpg"),
                                  ),
                                  SizedBox(width: 5),
                                  Flexible(
                                    child: Text("Competitions"),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed('/user/sidemenu/sidemenujobs');
                            },
                            child: Container(
                              constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width / 2),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 9.0),
                              padding: const EdgeInsets.all(9.0),
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xffe6e6ec)),
                                borderRadius: BorderRadius.circular(9.0),
                              ),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.all(5.0),
                                    decoration: BoxDecoration(
                                      //color: categories[f]['color'],
                                      borderRadius: BorderRadius.circular(9.0),
                                    ),
                                    child: Image.asset(
                                        "assets/images/programming.jpg"),
                                  ),
                                  SizedBox(width: 5),
                                  Flexible(
                                    child: Text("Jobs"),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(9.0),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color.fromRGBO(37, 211, 102, .8),
                      Colors.blue,
                    ],
                  ),
                  // color: Color.fromRGBO(37, 211, 102, .8),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Top Competitions",
                          style: Theme.of(context).textTheme.title,
                        ),
                        FlatButton(
                          child: Text("See All"),
                          onPressed: () {},
                        )
                      ],
                    ),
                    ListView.builder(
                      itemCount: 3,
                      shrinkWrap: true,
                      itemBuilder: (context, i) {
                        return CompetitionContainer(
                          description: competitionsList[i].description,
                          iconUrl: competitionsList[i].iconUrl,
                          location: competitionsList[i].location,
                          cost: competitionsList[i].cost,
                          title: competitionsList[i].title,
                          date: competitionsList[i].date,
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => CompetitionDetailsScreen(id: i),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.all(9.0),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color.fromRGBO(37, 211, 102, .8),
                      Colors.blue,
                    ],
                  ),
                  //color: Color.fromRGBO(37, 211, 102, .8),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Top Job Offers",
                          style: Theme.of(context).textTheme.title,
                        ),
                        FlatButton(
                          child: Text("See All"),
                          onPressed: () {},
                        )
                      ],
                    ),
                    ListView.builder(
                      itemCount: 3,
                      shrinkWrap: true,
                      itemBuilder: (context, i) {
                        return JobContainer(
                          description: jobList[i].description,
                          iconUrl: jobList[i].iconUrl,
                          location: jobList[i].location,
                          salary: jobList[i].salary,
                          title: jobList[i].title,
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => DetailsScreen(id: i),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// new Container(
//         margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
//         child: new Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Row(
//                     children: <Widget>[
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             Text(
//                               "Hello,",
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .display1
//                                   .copyWith(color: Colors.grey),
//                             ),
//                             Text(
//                               "David",
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .display1
//                                   .copyWith(
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.black),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 9),
//                   TextField(
//                     decoration: InputDecoration(
//                       prefixIcon: Icon(Icons.search),
//                       hintText: "Search",
//                       filled: true,
//                       fillColor: Color(0xffe6e6ec),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(5.0),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 9),
//                   SizedBox(
//                     height: MediaQuery.of(context).size.height / 4,
//                     child: GestureDetector(
//                       onTap: () => Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => UserHomeScreen(),
//                         ),
//                       ),
//                       child: Stack(
//                         children: <Widget>[
//                           Align(
//                             alignment: Alignment.centerRight,
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.circular(5.0),
//                               // child: Image.network(
//                               //   "https://image.freepik.com/free-vector/doctor-concept-illustration_114360-1269.jpg",
//                               // ),
//                             ),
//                           ),
//                           Positioned.fill(
//                             child: Container(
//                               padding: const EdgeInsets.all(11.0),
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(5.0),
//                                 color: Colors.blue.withOpacity(.3),
//                               ),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: <Widget>[
//                                   Text(
//                                     "Click here to view your offers",
//                                     style:
//                                         TextStyle(fontWeight: FontWeight.bold),
//                                   ),
//                                   RaisedButton(
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(25.0),
//                                     ),
//                                     color: Colors.blue,
//                                     child: Text(
//                                       "My Offers",
//                                       style: Theme.of(context).textTheme.button,
//                                     ),
//                                     onPressed: () => Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) => UserHomeScreen(),
//                                       ),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 9),
//                   Text("Categories", style: Theme.of(context).textTheme.title),
//                   Container(
//                     margin: const EdgeInsets.symmetric(vertical: 9.0),
//                     height: 71,
//                     child: ListView(
//                       scrollDirection: Axis.horizontal,
//                       children: List.generate(
//                         categories.length,
//                         (f) => Container(
//                           constraints: BoxConstraints(
//                               maxWidth: MediaQuery.of(context).size.width / 2),
//                           margin: const EdgeInsets.symmetric(horizontal: 9.0),
//                           padding: const EdgeInsets.all(9.0),
//                           decoration: BoxDecoration(
//                             border: Border.all(color: Color(0xffe6e6ec)),
//                             borderRadius: BorderRadius.circular(9.0),
//                           ),
//                           child: Row(
//                             children: <Widget>[
//                               Container(
//                                 padding: const EdgeInsets.all(5.0),
//                                 decoration: BoxDecoration(
//                                   color: categories[f]['color'],
//                                   borderRadius: BorderRadius.circular(9.0),
//                                 ),
//                                 child: Image.asset("${categories[f]['icon']}"),
//                               ),
//                               SizedBox(width: 5),
//                               Flexible(
//                                 child: Text("${categories[f]['title']}"),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.all(9.0),
//               decoration: BoxDecoration(
//                 color: Color(0xffe6e6ec),
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(15.0),
//                   topRight: Radius.circular(15.0),
//                 ),
//               ),
//               child: Column(
//                 children: <Widget>[
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       Text(
//                         "Top Competitions",
//                         style: Theme.of(context).textTheme.title,
//                       ),
//                       FlatButton(
//                         child: Text("See All"),
//                         onPressed: () {},
//                       )
//                     ],
//                   ),
//                   ListView.builder(
//                     itemCount: 1,
//                     shrinkWrap: true,
//                     itemBuilder: (context, i) {
//                       return CompetitionContainer(
//                         description: competitionsList[i].description,
//                         iconUrl: competitionsList[i].iconUrl,
//                         location: competitionsList[i].location,
//                         cost: competitionsList[i].cost,
//                         title: competitionsList[i].title,
//                         date: competitionsList[i].date,
//                         onTap: () => Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (ctx) => CompetitionDetailsScreen(id: i),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),

//CarouselWithIndicatorDemo(),

// ListView(
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 15.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Row(
//                   children: <Widget>[
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           Text(
//                             "Hello,",
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .display1
//                                 .copyWith(color: Colors.grey),
//                           ),
//                           Text(
//                             "David",
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .display1
//                                 .copyWith(
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.black),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 9),
//                 TextField(
//                   decoration: InputDecoration(
//                     prefixIcon: Icon(Icons.search),
//                     hintText: "Search",
//                     filled: true,
//                     fillColor: Color(0xffe6e6ec),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(5.0),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 9),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height / 4,
//                   child: GestureDetector(
//                     onTap: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => UserHomeScreen(),
//                       ),
//                     ),
//                     child: Stack(
//                       children: <Widget>[
//                         Align(
//                           alignment: Alignment.centerRight,
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(5.0),
//                             // child: Image.network(
//                             //   "https://image.freepik.com/free-vector/doctor-concept-illustration_114360-1269.jpg",
//                             // ),
//                           ),
//                         ),
//                         Positioned.fill(
//                           child: Container(
//                             padding: const EdgeInsets.all(11.0),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(5.0),
//                               color: Colors.blue.withOpacity(.3),
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: <Widget>[
//                                 Text(
//                                   "Do you want to begin a new career?",
//                                   style: TextStyle(fontWeight: FontWeight.bold),
//                                 ),
//                                 RaisedButton(
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(25.0),
//                                   ),
//                                   color: Colors.blue,
//                                   child: Text(
//                                     "Contact A Doctor",
//                                     style: Theme.of(context).textTheme.button,
//                                   ),
//                                   onPressed: () => Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) => UserHomeScreen(),
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 9),
//                 Text("Categories", style: Theme.of(context).textTheme.title),
//                 Container(
//                   margin: const EdgeInsets.symmetric(vertical: 9.0),
//                   height: 71,
//                   child: ListView(
//                     scrollDirection: Axis.horizontal,
//                     children: List.generate(
//                       categories.length,
//                       (f) => Container(
//                         constraints: BoxConstraints(
//                             maxWidth: MediaQuery.of(context).size.width / 2),
//                         margin: const EdgeInsets.symmetric(horizontal: 9.0),
//                         padding: const EdgeInsets.all(9.0),
//                         decoration: BoxDecoration(
//                           border: Border.all(color: Color(0xffe6e6ec)),
//                           borderRadius: BorderRadius.circular(9.0),
//                         ),
//                         child: Row(
//                           children: <Widget>[
//                             Container(
//                               padding: const EdgeInsets.all(5.0),
//                               decoration: BoxDecoration(
//                                 color: categories[f]['color'],
//                                 borderRadius: BorderRadius.circular(9.0),
//                               ),
//                               child: Image.asset("${categories[f]['icon']}"),
//                             ),
//                             SizedBox(width: 5),
//                             Flexible(
//                               child: Text("${categories[f]['title']}"),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.all(9.0),
//             decoration: BoxDecoration(
//               color: Color(0xffe6e6ec),
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(15.0),
//                 topRight: Radius.circular(15.0),
//               ),
//             ),
//             child: Column(
//               children: <Widget>[
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     Text(
//                       "Top Competitons",
//                       style: Theme.of(context).textTheme.title,
//                     ),
//                     FlatButton(
//                       child: Text("See All"),
//                       onPressed: () {
//                         Navigator.of(context)
//                             .pushNamed('/user/sidemenu/sidemenujobs');
//                       },
//                     )
//                   ],
//                 ),
//                 ListView.builder(
//                   itemCount: 5,
//                   shrinkWrap: true,
//                   itemBuilder: (context, i) {
//                     return CompetitionContainer(
//                       description: competitionsList[i].description,
//                       iconUrl: competitionsList[i].iconUrl,
//                       location: competitionsList[i].location,
//                       cost: competitionsList[i].cost,
//                       title: competitionsList[i].title,
//                       date: competitionsList[i].date,
//                       onTap: () => Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (ctx) => CompetitionDetailsScreen(id: i),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
