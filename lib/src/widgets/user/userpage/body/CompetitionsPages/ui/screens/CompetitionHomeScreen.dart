import 'package:flutter/material.dart';
import '../../global.dart';

import '../screens/screens.dart';
import '../widgets/widgets.dart';

class CompetitionHomeScreen extends StatefulWidget {
  @override
  _CompetitionHomeScreenState createState() => _CompetitionHomeScreenState();
}

class _CompetitionHomeScreenState extends State<CompetitionHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                itemCount: jobList.length,
                itemBuilder: (ctx, i) {
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
            ),
          ],
        ),
      ),
    );
  }
}
