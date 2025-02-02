import 'package:flutter/material.dart';

class CompetitionContainer extends StatelessWidget {
  const CompetitionContainer({
    Key key,
    @required this.iconUrl,
    @required this.title,
    @required this.location,
    @required this.description,
    @required this.cost,
    @required this.date,
    @required this.onTap,
  }) : super(key: key);
  final String iconUrl, title, location, description, cost, date;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(9.0),
          boxShadow: [
            BoxShadow(
                color: Colors.grey[300], blurRadius: 5.0, offset: Offset(0, 3))
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(
                    'assets/images/google.jpg',
                    width: 71.0,
                    height: 71.0,
                    fit: BoxFit.fill,
                  ),
                  // child: Image.network(
                  //   "$iconUrl",
                  //   height: 71,
                  //   width: 71,
                  // ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "$title",
                        style: Theme.of(context).textTheme.title,
                      ),
                      Text(
                        "$location",
                        style: Theme.of(context).textTheme.subtitle.apply(
                              color: Colors.grey,
                            ),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 5),
            Text(
              "$description",
              style:
                  Theme.of(context).textTheme.body1.apply(color: Colors.grey),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 9),
            Text(
              "$cost",
              style:
                  Theme.of(context).textTheme.subhead.apply(fontWeightDelta: 2),
            ),
            Text(
              "$date",
              style:
                  Theme.of(context).textTheme.subhead.apply(fontWeightDelta: 2),
            )
          ],
        ),
      ),
    );
  }
}
