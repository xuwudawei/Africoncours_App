import 'package:flutter/material.dart';

class NewsCard extends StatefulWidget {
  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  var newsImageUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: [
        Image.network(
          'https://avatars3.githubusercontent.com/u/57068034?s=460&u=d7eb15aed461ed917047aa35da504974596034e9&v=4',
          width: MediaQuery.of(context).size.width,
          height: 400,
        ),
        SizedBox(
          height: 10,
        ),
        Column(
          children: <Widget>[
            Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Title",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            Align(
              child: Text(
                "Programming isn't about what you know; it's about what you can figure out.",
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        )
      ],
    ));
  }
}
