import 'package:flutter/material.dart';
import '../../../../models/news.dart';

class Ongoing extends StatefulWidget {
  @override
  _OngoingState createState() => _OngoingState();
}

class _OngoingState extends State<Ongoing> {
  List<News> news = [
    News(
        url: "https://news.itmo.ru/images/news/big/p7499.jpg",
        title: "Hash Code 2018",
        message:
            "More than 37,000 students and professionals from across Europe, the Middle East and Africa registered for Hash Code 2018. Google then hosted 40 teams from 17 different countries at the Google Dublin office for the Final Round of the competition."),
    News(
        url: "https://news.itmo.ru/images/news/big/p7499.jpg",
        title: "Hash Code 2018",
        message:
            "More than 37,000 students and professionals from across Europe, the Middle East and Africa registered for Hash Code 2018. Google then hosted 40 teams from 17 different countries at the Google Dublin office for the Final Round of the competition."),
    News(
        url: "https://news.itmo.ru/images/news/big/p7499.jpg",
        title: "Hash Code 2018",
        message:
            "More than 37,000 students and professionals from across Europe, the Middle East and Africa registered for Hash Code 2018. Google then hosted 40 teams from 17 different countries at the Google Dublin office for the Final Round of the competition."),
    News(
        url: "https://news.itmo.ru/images/news/big/p7499.jpg",
        title: "Hash Code 2018",
        message:
            "More than 37,000 students and professionals from across Europe, the Middle East and Africa registered for Hash Code 2018. Google then hosted 40 teams from 17 different countries at the Google Dublin office for the Final Round of the competition."),
    News(
        url: "https://news.itmo.ru/images/news/big/p7499.jpg",
        title: "Hash Code 2018",
        message:
            "More than 37,000 students and professionals from across Europe, the Middle East and Africa registered for Hash Code 2018. Google then hosted 40 teams from 17 different countries at the Google Dublin office for the Final Round of the competition."),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (ctx, int index) {
        return Container(
          child: Card(
            elevation: 5.0,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('/news', arguments: {
                        "title": news[index].title,
                        "url": news[index].url,
                        "message": news[index].message
                      });
                    },
                    child: Text(
                      news[index].title,
                      style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('/news', arguments: {
                        "title": news[index].title,
                        "url": news[index].url,
                        "message": news[index].message
                      });
                    },
                    child: Image.network(
                      news[index].url,
                      width: MediaQuery.of(context).size.width,
                      height: 300,
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('/news', arguments: {
                          "title": news[index].title,
                          "url": news[index].url,
                          "message": news[index].message
                        });
                      },
                      child: Text(
                        news[index].message,
                        style: TextStyle(fontSize: 15),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
