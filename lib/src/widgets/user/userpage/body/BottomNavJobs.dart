import 'package:flutter/material.dart';
import '../../userpage/body/JobPages/global.dart';

import '../body/JobPages/ui/screens/screens.dart';
import '../body/JobPages/ui/widgets/widgets.dart';

class BottomNavJobs extends StatefulWidget {
  @override
  _BottomNavJobsState createState() => _BottomNavJobsState();
}

class _BottomNavJobsState extends State<BottomNavJobs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
