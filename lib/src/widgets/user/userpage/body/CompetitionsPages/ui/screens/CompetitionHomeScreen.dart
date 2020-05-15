import 'package:flutter/material.dart';
import '../../competitionGlobal.dart';

import '../screens/competitionDetails.dart';
import '../widgets/competitionWidgets.dart';

class CompetitionHomeScreen extends StatefulWidget {
  @override
  _CompetitionHomeScreenState createState() => _CompetitionHomeScreenState();
}

class _CompetitionHomeScreenState extends State<CompetitionHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(37, 211, 102, 1),
        title: Text("Available Competitions"),
      ),
      //backgroundColor: Colors.blue,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 5,
            ),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Search",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide.none,
                ),
                fillColor: Color(0xffe6e6ec),
                filled: true,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: competitionsList.length,
                itemBuilder: (ctx, i) {
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
            ),
          ],
        ),
      ),
    );
  }
}
