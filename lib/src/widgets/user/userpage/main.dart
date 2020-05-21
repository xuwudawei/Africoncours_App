import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../provider/User.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Various bottom navigation pages
import 'body/homepage.dart';
import 'body/news.dart';
import 'body/setting.dart';
import 'body/BottomNavJobs.dart';

//varoius job pages
import '../userpage/body/JobPages/global.dart';
import '../userpage/body/JobPages/ui/screens/details.dart';
import '../userpage/body/JobPages/ui/screens/screens.dart';
import '../userpage/body/JobPages/ui/widgets/widgets.dart';
import '../userpage/body/JobPages/models/job.dart';

// Drawer import
import 'body/userDrawer.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  List<String> _nebulae;
  //List<String> _filterList;
  _SearchAppBarDelegate _searchDelegate;
  @override
  void initState() {
    super.initState();
    //controller = new TabController(length: 4, vsync: this.);
    _nebulae = new List<String>();
    for (var a in jobList) {
      _nebulae.add(a.title);
      _nebulae.add(a.location);
      _searchDelegate = _SearchAppBarDelegate(_nebulae);
    }
  }

  // @override
  // Map info = {};
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getLoggedData();
  // }

  // getLoggedData() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   setState(
  //     () {
  //       info = {
  //         "firstname": pref.getString("firstname"),
  //         "lastname": pref.getString("lastname"),
  //         "email": pref.getString("email"),
  //         "avatar": pref.getString("avatar"),
  //         "school": pref.getString("school"),
  //         "current_address": pref.getString("current_address"),
  //         "permanent_address": pref.getString("permanent_address"),
  //         "country": pref.getString("country"),
  //         "phone": pref.getString("phone"),
  //         "type": "",
  //         "logged": true,
  //         "isStudentAdmin": pref.getBool("isStudentAdmin"),
  //         "starting": pref.getString("starting"),
  //         "ending": pref.getString("ending"),
  //       };
  //     },
  //   );
  // }

  var selectedNav = 0;
  @override
  Widget build(BuildContext context) {
    final userInfo = Provider.of<UserInfoProvider>(context);
    // userInfo.setUserInfo();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(37, 211, 102, 1),
        actions: <Widget>[
          IconButton(
            tooltip: 'Search',
            icon: const Icon(Icons.search),
            //Don't block the main thread
            onPressed: () {
              showSearch(context: context, delegate: _searchDelegate);
            },
          ),
          PopupMenuButton(
            itemBuilder: (context) => <PopupMenuEntry>[
              PopupMenuItem(
                key: Key("logout"),
                value: "logout",
                child: GestureDetector(
                  child: Text('Logout'),
                  onTap: () {
                    print("Logout");
                  },
                ),
              ),
              PopupMenuItem(
                key: Key("settings"),
                value: "settings",
                child: Text('Settings'),
              ),
            ],
            icon: Consumer<UserInfoProvider>(
              builder: (context, user, child) {
                return CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://avatars3.githubusercontent.com/u/57068034?s=460&u=d7eb15aed461ed917047aa35da504974596034e9&v=4"),
                );
              },
            ),
            onSelected: (value) {
              if (value == "settings") {
                Navigator.of(context).pushNamed('/user/sidemenu/settings');
              } else {
                // Navigator.of(context).popUntil(ModalRoute.withName('/login'));
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/user/login', ModalRoute.withName('/useroption'));
              } // log the user out at the back end
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: UserDrawer(),
      ),
      body: [Homepage(), Ongoing(), BottomNavJobs(), Settings()]
          .elementAt(selectedNav),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          primaryColor: Color.fromRGBO(37, 211, 102, 1),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                title: Text("Home"), icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                title: Text("Contests"),
                icon: Icon(FontAwesomeIcons.newspaper)),
            BottomNavigationBarItem(
                title: Text("Jobs"), icon: Icon(Icons.event_note)),
            BottomNavigationBarItem(
                title: Text("settings"), icon: Icon(Icons.settings))
          ],
          onTap: (index) {
            setState(() {
              selectedNav = index;
            });
          },
          currentIndex: selectedNav,
        ),
      ),
    );
  }
}

// void showSearchPage(
//     BuildContext context, _SearchAppBarDelegate searchDelegate) async {
//   final String selected = await showSearch<String>(
//     context: context,
//     delegate: searchDelegate,
//   );

// if (selected != null) {
//   Scaffold.of(context).showSnackBar(
//     SnackBar(
//       content: Text('Your Word Choice: $selected'),
//     ),
//   );
// }
// }

class _SearchAppBarDelegate extends SearchDelegate<String> {
  //list holds the full word list
  final List<String> _data;

  //list holds history search words.
  final List<String> _history;

  //initialize delegate with full word list and history words
  _SearchAppBarDelegate(List<String> words)
      : _data = words,
        //pre-populated history of words
        _history = <String>['Google', 'Flutter', 'Hash Code'],
        super();

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        //Take control back to previous page
        this.close(context, null);
      },
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      query.isNotEmpty
          ? IconButton(
              tooltip: 'Clear',
              icon: const Icon(Icons.clear),
              onPressed: () {
                query = '';
                showSuggestions(context);
              },
            )
          : IconButton(
              icon: const Icon(Icons.mic),
              tooltip: 'Voice input',
              onPressed: () {
                this.query = 'TBW: Get input from voice';
              },
            ),
    ];
  }

  @override
  Widget buildResults(BuildContext context) {
    List<JobModel> displaySingleItem = [];
    jobList.forEach((w) {
      if (w.title.toLowerCase().contains(this.query.toLowerCase())) {
        displaySingleItem.add(w);
        print(w);
        print(displaySingleItem);
        print(query);
      }
      if (w.location.toLowerCase().contains(this.query.toLowerCase())) {
        displaySingleItem.add(w);
        print(w);
        print(displaySingleItem);
        print(query);
      }
    });
    return new Container(
//just changed from flexible
      child: new ListView.builder(
          itemCount: displaySingleItem.length,
          itemBuilder: (BuildContext context, int i) {
            return JobContainer(
              description: displaySingleItem[i].description,
              iconUrl: displaySingleItem[i].iconUrl,
              location: displaySingleItem[i].location,
              salary: displaySingleItem[i].salary,
              title: displaySingleItem[i].title,
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

  @override
  Widget buildSuggestions(BuildContext context) {
    final Iterable<String> suggestions = this.query.isEmpty
        ? _history
        : _data
            .where((word) => word.toLowerCase().contains(query.toLowerCase()));
    return _WordSuggestionList(
        query: this.query,
        suggestions: suggestions.toList(),
        onSelected: (String suggestion) {
          this.query = suggestion;
          this._history.insert(0, suggestion);
          showResults(context);
        });
  }
}

class _WordSuggestionList extends StatelessWidget {
  const _WordSuggestionList({this.suggestions, this.query, this.onSelected});

  final List<String> suggestions;
  final String query;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    List<JobModel> displaySuggestionItems = [];
    for (var b in suggestions) {
      jobList.forEach((w) {
        if (w.title == b) {
          displaySuggestionItems.add(w);
          print(w);
          print(displaySuggestionItems);
          print(query);
        }
        if (w.location == b) {
          displaySuggestionItems.add(w);
          print(w);
          print(displaySuggestionItems);
          print(query);
        }
      });
    }

    return new Container(
      //just changed from flexible
      child: new ListView.builder(
          itemCount: displaySuggestionItems.length,
          itemBuilder: (BuildContext context, int i) {
            return JobContainer(
                description: displaySuggestionItems[i].description,
                iconUrl: displaySuggestionItems[i].iconUrl,
                location: displaySuggestionItems[i].location,
                salary: displaySuggestionItems[i].salary,
                title: displaySuggestionItems[i].title,
                onTap: () {
                  onSelected(displaySuggestionItems[i].title);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => DetailsScreen(id: i),
                    ),
                  );
                });
          }),
    );
  }
}
