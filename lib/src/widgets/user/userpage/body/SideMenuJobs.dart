import 'package:flutter/material.dart';
import '../body/JobPages/ui/widgets/widgets.dart';
import '../body/JobPages/ui/screens/screens.dart';
import '../body/JobPages/global.dart';

class SideMenuJobs extends StatefulWidget {
  @override
  _SideMenuJobsState createState() => _SideMenuJobsState();
  SideMenuJobs({Key key}) : super(key: key);
}

class _SideMenuJobsState extends State<SideMenuJobs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Color(0xfff0f0f6),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              bottom: 60,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 7.0,
                    ),
                    // Row(
                    //   children: <Widget>[
                    //     //MyDropDownButton(),
                    //     //Spacer(),
                    //     // IconButton
                    //     // (
                    //     //   icon: Icon(
                    //     //     Icons.search,
                    //     //     color: Colors.black87,
                    //     //   ),
                    //     //   onPressed: () {},
                    //     // ),
                    //     // CircleAvatar
                    //     // (
                    //     //   backgroundImage: NetworkImage(
                    //     //       "https://cdn.pixabay.com/photo/2017/06/09/07/37/notebook-2386034_960_720.jpg"),
                    //     // )
                    //   ],
                    // ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 51,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.search),
                                hintText: "Search",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide.none),
                                fillColor: Color(0xffe6e6ec),
                                filled: true,
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: jobList.length,
                        itemBuilder: (ctx, i) {
                          return JobContainer(
                            description: jobList[i].description,
                            //iconUrl: jobList[i].iconUrl,
                            location: jobList[i].location,
                            salary: jobList[i].salary,
                            title: jobList[i].title,
                            onTap: () {},
                            // onTap: () => Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (ctx) => DetailsScreen(id: i),
                            //   ),
                            // ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Text(' '),
          ],
        ),
      ),
    );
  }
}

// final TextStyle dropdownMenuItem =
//     TextStyle(color: Colors.black, fontSize: 18);

// final primary = Color(0xff696b9e);
// final secondary = Color(0xfff29a94);

// final List<Map> competitionLists = [
//   {
//     "name": "Senior Software Developer",
//     "location": "Google Africa Office",
//     "type": "Software Programmer",
//     "logoText": "https://blog.hubspot.com/hubfs/image8-2.jpg"
//   },
//   {
//     "name": "Senior Software Developer",
//     "location": "Google Africa Office",
//     "type": "Software Programmer",
//     "logoText": "https://blog.hubspot.com/hubfs/image8-2.jpg"
//   },
//   {
//     "name": "Senior Software Developer",
//     "location": "Google Africa Office",
//     "type": "Software Programmer",
//     "logoText": "https://blog.hubspot.com/hubfs/image8-2.jpg"
//   },
//   {
//     "name": "Senior Software Developer",
//     "location": "Google Africa Office",
//     "type": "Software Programmer",
//     "logoText": "https://blog.hubspot.com/hubfs/image8-2.jpg"
//   },
//   {
//     "name": "Senior Software Developer",
//     "location": "Google Africa Office",
//     "type": "Software Programmer",
//     "logoText": "https://blog.hubspot.com/hubfs/image8-2.jpg"
//   },
//   {
//     "name": "Senior Software Developer",
//     "location": "Google Africa Office",
//     "type": "Software Programmer",
//     "logoText": "https://blog.hubspot.com/hubfs/image8-2.jpg"
//   },
//   {
//     "name": "Senior Software Developer",
//     "location": "Google Africa Office",
//     "type": "Software Programmer",
//     "logoText": "https://blog.hubspot.com/hubfs/image8-2.jpg"
//   },
//   {
//     "name": "Senior Software Developer",
//     "location": "Google Africa Office",
//     "type": "Software Programmer",
//     "logoText": "https://blog.hubspot.com/hubfs/image8-2.jpg"
//   },
// ];

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     backgroundColor: Color.fromRGBO(220, 20, 47, 0.7),
//     body: SingleChildScrollView(
//       child: Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         child: Stack(
//           children: <Widget>[
//             Container(
//               padding: EdgeInsets.only(top: 145),
//               height: MediaQuery.of(context).size.height,
//               width: double.infinity,
//               child: ListView.builder(
//                   itemCount: competitionLists.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     return buildList(context, index);
//                   }),
//             ),
//             Container(
//               height: 140,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                   color: primary,
//                   borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(30),
//                       bottomRight: Radius.circular(30))),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 170),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     Text(
//                       "Jobs",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(color: Colors.white, fontSize: 24),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Container(
//               child: Column(
//                 children: <Widget>[
//                   SizedBox(
//                     height: 110,
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20),
//                     child: Material(
//                       elevation: 5.0,
//                       borderRadius: BorderRadius.all(Radius.circular(30)),
//                       child: TextField(
//                         // controller: TextEditingController(text: locations[0]),
//                         cursorColor: Theme.of(context).primaryColor,
//                         style: dropdownMenuItem,
//                         decoration: InputDecoration(
//                             hintText: "Search Jobs",
//                             hintStyle: TextStyle(
//                                 color: Colors.black38, fontSize: 16),
//                             prefixIcon: Material(
//                               elevation: 0.0,
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(30)),
//                               child: Icon(Icons.search),
//                             ),
//                             border: InputBorder.none,
//                             contentPadding: EdgeInsets.symmetric(
//                                 horizontal: 25, vertical: 13)),
//                       ),
//                     ),
//                   ),
//                   SizedBox(),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     ),
//   );
// }

// Widget buildList(BuildContext context, int index) {
//   return JobContainer(
//                           description: jobList[i].description,
//                           iconUrl: jobList[i].iconUrl,
//                           location: jobList[i].location,
//                           salary: jobList[i].salary,
//                           title: jobList[i].title,
//                           onTap: () => Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (ctx) => DetailsScreen(id: i),
//                             ),
