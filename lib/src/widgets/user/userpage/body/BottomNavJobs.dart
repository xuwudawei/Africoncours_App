import 'package:flutter/material.dart';
import '../../userpage/body/JobPages/global.dart';
import '../body/JobPages/models/job.dart';

import '../body/JobPages/ui/screens/screens.dart';
import '../body/JobPages/ui/widgets/widgets.dart';

class BottomNavJobs extends StatefulWidget {
  @override
  _BottomNavJobsState createState() => _BottomNavJobsState();
}

class _BottomNavJobsState extends State<BottomNavJobs> {
  var _searchview = new TextEditingController();
  TabController controller;
  bool _firstSearch = true;
  String _query = "";

  List<String> _nebulae;
  List<String> _filterList;
  @override
  void initState() {
    super.initState();
    //controller = new TabController(length: 4, vsync: this.);
    _nebulae = new List<String>();
    for (var a in jobList) {
      _nebulae.add(a.title);
    }
  }

  _BottomNavJobsState() {
    //Register a closure to be called when the object changes.
    _searchview.addListener(() {
      if (_searchview.text.isEmpty) {
        //Notify the framework that the internal state of this object has changed.
        setState(() {
          _firstSearch = true;
          _query = "";
        });
      } else {
        setState(() {
          _firstSearch = false;
          _query = _searchview.text;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _createSearchView(),
            _firstSearch ? _createListView() : _performSearch()
          ],
        ),
      ),
    );
  }

  Widget _createSearchView() {
    return new Container(
      //decoration: BoxDecoration(border: Border.all(width: 1.0)),
      child: new TextField(
        controller: _searchview,
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
    );
  }

  Widget _createListView() {
    return new Flexible(
      child: new ListView.builder(
          itemCount: _nebulae.length,
          itemBuilder: (BuildContext context, int i) {
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
          }),
    );
  }

  Widget _performSearch() {
    _filterList = new List<String>();
    for (int i = 0; i < _nebulae.length; i++) {
      var item = _nebulae[i];

      if (item.toLowerCase().contains(_query.toLowerCase())) {
        _filterList.add(item);
      }
    }
    print(_filterList);
    return _createFilteredListView();
  }

  Widget _createFilteredListView() {
    List<JobModel> finalList = [];
    for (var b in _filterList) {
      jobList.forEach((w) {
        if (w.title == b) {
          finalList.add(w);
          print(w);
          print(finalList);
          print(_query);
        }
      });
    }

    return new Flexible(
      child: new ListView.builder(
          itemCount: finalList.length,
          itemBuilder: (BuildContext context, int i) {
            return JobContainer(
              description: finalList[i].description,
              iconUrl: finalList[i].iconUrl,
              location: finalList[i].location,
              salary: finalList[i].salary,
              title: finalList[i].title,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => DetailsScreen(id: i),
                ),
              ),
            );
          }),
    );
  }
}
