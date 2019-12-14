import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:woker/api/all_api.dart';

class Test extends StatefulWidget {
  static String tag = 'test-page';
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  bool visibilityTag = false;
  bool visibilityObs = false;

  void _changed(bool visibility, String field) {
    setState(() {
      if (field == "tag") {
        visibilityTag = visibility;
      }
      if (field == "obs") {
        visibilityObs = visibility;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(backgroundColor: new Color(0xFF26C6DA)),
        body: new ListView(
          children: <Widget>[
            new Container(
              margin: new EdgeInsets.all(20.0),
              child: new FlutterLogo(size: 100.0, colors: Colors.blue),
            ),
            new Container(
                margin: new EdgeInsets.only(left: 16.0, right: 16.0),
                child: new Column(
                  children: <Widget>[
                    visibilityObs
                        ? new Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              new Expanded(
                                flex: 11,
                                child: new TextField(
                                  maxLines: 1,
                                  style: Theme.of(context).textTheme.title,
                                  decoration: new InputDecoration(
                                      labelText: "Observation", isDense: true),
                                ),
                              ),
                              new Expanded(
                                flex: 1,
                                child: new IconButton(
                                  color: Colors.grey[400],
                                  icon: const Icon(
                                    Icons.cancel,
                                    size: 22.0,
                                  ),
                                  onPressed: () {
                                    _changed(false, "obs");
                                  },
                                ),
                              ),
                            ],
                          )
                        : new Container(),
                    visibilityTag
                        ? new Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              new Expanded(
                                flex: 11,
                                child: new TextField(
                                  maxLines: 1,
                                  style: Theme.of(context).textTheme.title,
                                  decoration: new InputDecoration(
                                      labelText: "Tags", isDense: true),
                                ),
                              ),
                              new Expanded(
                                flex: 1,
                                child: new IconButton(
                                  color: Colors.grey[400],
                                  icon: const Icon(
                                    Icons.cancel,
                                    size: 22.0,
                                  ),
                                  onPressed: () {
                                    _changed(false, "tag");
                                  },
                                ),
                              ),
                            ],
                          )
                        : new Container(),
                  ],
                )),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new InkWell(
                    onTap: () {
                      visibilityObs ? null : _changed(true, "obs");
                    },
                    child: new Container(
                      margin: new EdgeInsets.only(top: 16.0),
                      child: new Column(
                        children: <Widget>[
                          new Icon(Icons.comment,
                              color: visibilityObs
                                  ? Colors.grey[400]
                                  : Colors.grey[600]),
                          new Container(
                            margin: const EdgeInsets.only(top: 8.0),
                            child: new Text(
                              "Observation",
                              style: new TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w400,
                                color: visibilityObs
                                    ? Colors.grey[400]
                                    : Colors.grey[600],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                new SizedBox(width: 24.0),
                new InkWell(
                    onTap: () {
                      visibilityTag ? null : _changed(true, "tag");
                    },
                    child: new Container(
                      margin: new EdgeInsets.only(top: 16.0),
                      child: new Column(
                        children: <Widget>[
                          new Icon(Icons.local_offer,
                              color: visibilityTag
                                  ? Colors.grey[400]
                                  : Colors.grey[600]),
                          new Container(
                            margin: const EdgeInsets.only(top: 8.0),
                            child: new Text(
                              "Tags",
                              style: new TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w400,
                                color: visibilityTag
                                    ? Colors.grey[400]
                                    : Colors.grey[600],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            )
          ],
        ));
  }
}

class Test2 extends StatefulWidget {
  static String tag = 'test2-page';

  @override
  _Test2State createState() => _Test2State();
}

class _Test2State extends State<Test2> {
  @override
  Widget build(BuildContext context) {
    final listitem = Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(130),
        ),
        // height: 10,
        child: Card(
          borderOnForeground: true,
          semanticContainer: true,
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.only(top: .4),
          elevation: 2,
          child: ListTile(
            // selected: true,
            //  enabled: false,
            // dense: false,
            // contentPadding: EdgeInsets.all(10),

            onTap: () {},
            isThreeLine: false,
            title: Text(
              'Tap, Wash Basin and sink problem',
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.blueGrey[200],
              size: 15,
            ),
          ),
        ));
    return Scaffold(
      body: DefaultTabController(
        length: 5,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Colors.blueAccent,
                leading: IconButton(
                  onPressed: () => Navigator.pop(context, false),
                  icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                ),
                actions: <Widget>[
                  IconButton(
                    onPressed: () => Navigator.pop(context, false),
                    // onPressed: (){
                    //   Navigator.of(context).pop();
                    // },
                    icon: Icon(Icons.search, color: Colors.white),
                  ),
                ],

                elevation: 10,
                expandedHeight: 250.0,
                floating: true,
                snap: true,

                //pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  // collapseMode: CollapseMode.parallax,
                  titlePadding: EdgeInsets.only(bottom: 40),
                  centerTitle: true,
                  title: Text("Plumbing",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        // fontFamily:'Merriweather',
                      )),

                  background: Container(
                    color: Colors.blueAccent[400],
                    child: Image.asset(
                      'assets/plumbing.png',
                    ),
                    // child: Icon(Icons.ac_unit,size: 50,color: Colors.white,),
                  ),
                  //  Image.network(
                  //   "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                  //   fit: BoxFit.cover,
                  // )
                ),
                // bottom: TabBar(

                //   labelColor: Colors.black87,
                //   unselectedLabelColor: Colors.greenAccent,
                //   tabs: [
                //     new Tab(icon: new Icon(Icons.info), text: "Tab 1"),
                //     new Tab(
                //         icon: new Icon(Icons.lightbulb_outline), text: "Tab 2"),
                //            new Tab(
                //         icon: new Icon(Icons.lightbulb_outline), text: "Tab 3"),
                //            new Tab(
                //         icon: new Icon(Icons.lightbulb_outline), text: "Tab 2"),

                //            new Tab(
                //         icon: new Icon(Icons.lightbulb_outline), text: "Tab 2"),

                //   ],
                // ),
              ),
            ];
          },
          body: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, position) {
              return listitem;
            },
          ),
        ),
      ),
    );
  }
}

class Test3 extends StatefulWidget {
  static String tag = 'test3-page';

  @override
  _Test3State createState() => _Test3State();
}

class _Test3State extends State<Test3> {
  List<Friend> _friends = [];

  @override
  void initState() {
    super.initState();
    _loadFriends();
  }

  Future<void> _loadFriends() async {
    http.Response response =
        await http.get('https://randomuser.me/api/?results=25');

    setState(() {
      _friends = Friend.allFromResponse(response.body);
    });
  }

  Widget _buildFriendListTile(BuildContext context, int index) {
    var friend = _friends[index];

    return new ListTile(
      onTap: () => _navigateToFriendDetails(friend, index),
      leading: new Hero(
        tag: index,
        child: new CircleAvatar(
          backgroundImage: new NetworkImage(friend.avatar),
        ),
      ),
      title: new Text(friend.name),
      subtitle: new Text(friend.email),
    );
  }

  void _navigateToFriendDetails(Friend friend, Object avatarTag) {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (c) {
          // return new FriendDetailsPage(friend, avatarTag: avatarTag);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content;

    if (_friends.isEmpty) {
      content = new Center(
        child: new CircularProgressIndicator(),
      );
    } else {
      content = new ListView.builder(
        itemCount: _friends.length,
        itemBuilder: _buildFriendListTile,
      );
    }

    return new Scaffold(
      appBar: new AppBar(title: new Text('Friends')),
      body: content,
    );
  }
}

class FriendDetailsPage extends StatefulWidget {
  @override
  _FriendDetailsPageState createState() => _FriendDetailsPageState();
}

class _FriendDetailsPageState extends State<FriendDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Friend {
  Friend({
    @required this.avatar,
    @required this.name,
    @required this.email,
    @required this.location,
  });

  final String avatar;
  final String name;
  final String email;
  final String location;

  static List<Friend> allFromResponse(String response) {
    var decodedJson = json.decode(response).cast<String, dynamic>();

    return decodedJson['results']
        .cast<Map<String, dynamic>>()
        .map((obj) => Friend.fromMap(obj))
        .toList()
        .cast<Friend>();
  }

  static Friend fromMap(Map map) {
    var name = map['name'];

    return new Friend(
      avatar: map['picture']['large'],
      name: '${_capitalize(name['first'])} ${_capitalize(name['last'])}',
      email: map['email'],
      location: _capitalize(map['location']['state']),
    );
  }

  static String _capitalize(String input) {
    return input.substring(0, 1).toUpperCase() + input.substring(1);
  }
}

class Test4 extends StatefulWidget {
  static String tag = 'test4-page';
  // static String tag = 'test3-page';

  @override
  _Test4State createState() => _Test4State();
}

class _Test4State extends State<Test4> {
// PageController controller = PageController();
// var currentPageValue = 0.0;
// AnimationController controller;
// final animation=Tween(
// begin: 0,end: 2*180,
// ).animate(controller);

// @override
//   void initState() {
//     // TODO: implement initState
//     super.initState(
//       super.initState();
//       controller=AnimationController(

//       );
//     );
//   }

  @override
  Widget build(BuildContext context) {
    // Widget a = Container(
    //   height: 100,
    //   width: 150,
    //   color: Colors.black,
    // );
    // Widget b = Material(
    //   child: Container(
    //     height: 100,
    //     width: 150,
    //     color: Colors.black,
    //   ),
    // );
    // Widget c = Container(
    //   height: 100,
    //   width: 150,
    //   color: Colors.black,
    // );
    // final controller = PageController(
    //   initialPage: 1,
    // );
    // final pageview = PageView(
    //   controller: controller,
    //   children: <Widget>[
    //     a,
    //     b,
    //     c,
    //   ],
    // );

    return Scaffold(
      body: ListView(
        children: <Widget>[
          Transform.rotate(
            angle: 45,
            transformHitTests: true,
            child: Container(
              height: 100,
              width: 50,
              color: Colors.red,
            ),
          ),

          ClipPath(
            clipBehavior: Clip.antiAlias,
            child: Container(
              height: 100,
              width: 50,
              color: Colors.yellow,
            ),
          ),

          Dismissible(
            key: Key('key'),
            background: Container(
              height: 100,
              width: 50,
              color: Colors.green,
            ),
            child: Container(
              height: 100,
              width: 100,
              color: Colors.blue,
            ),
          ),

          //  DragTarget(
          //     builder: ,
          //  ),

          Draggable(
            childWhenDragging: Container(
              height: 100,
              width: 50,
              color: Colors.yellow,
            ),
            feedback: Container(
              height: 100,
              width: 50,
              color: Colors.red,
            ),
            child: Container(
              height: 100,
              width: 50,
              color: Colors.green,
            ),
          ),
          AspectRatio(
            aspectRatio: 3 / 2,
            child: Container(
              height: 100,
              width: 50,
              color: Colors.green,
            ),
          )
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ColorInfo(
            child: Text('a'),
          );
        },
        child: Text('data'),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      // bottomNavigationBar: FloatingActionButton(

      //   child: Text('data'),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
    );
  }
}

class ColorInfo extends StatefulWidget {
  ColorInfo({Widget child}) : super();
  Widget child;
  @override
  _ColorInfoState createState() => _ColorInfoState();
}

class _ColorInfoState extends State<ColorInfo> {
  Widget child;
  _ColorInfoState({Widget child});
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

//---------------------------Api Test-----------------//
class ApiTest extends StatefulWidget {
  @override
  _ApiTestState createState() => _ApiTestState();
}

class _ApiTestState extends State<ApiTest> {
  @override
  void initState() {
    super.initState();
    getOrder();
  }

  KalyanApi myapi = KalyanApi();
  //  Image.network("${myapi.musurl}/uploads/images/service_icons/${widget.serviceImage}",width: 80.0,),

  getOrder() async {
    List data = await myapi.getText();

    return data;
  }

  String text = 'send from client';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return Center(
              child: snapshot.hasData
                  ? Text(snapshot.data[0]['test'].toString())
                  : Text('error'));
        },
        future: getOrder(),
      ),
    );
  }
}

class KalyanApi {
  String text = 'api text';
  final myUrl = 'http://192.168.0.103/woker/public';

  Future<List> getText() async {
    try {
      final response = await http.post("$myUrl/api/kalyanTest", body: {
        'text': text,
      });
      return json.decode(response.body);
    } catch (e) {
      print(e);
    }
  }
}

//BottomNavigationBar
// import 'package:bus_ticket_booking/main_tab.dart';
// import 'package:flutter/material.dart';
// step nno 1
// Route::post('kalyanTest',array('as'=>'kalyanTest', 'uses'=>'HomePageController@kalyanTest'));
// step nno 2
  /* public function kalyanTest(Request $request){
         $data=kalyanModel::all();
         return $data;
    } */
    
// step nno 3
   /* class kalyanModel extends Model
{
    protected $table = 'test';
} */


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;
  final List<Widget> _children = [
    PlaceholderWidget(Colors.white),
    PlaceholderWidget(Colors.deepOrange),
    PlaceholderWidget(Colors.green),
    PlaceholderWidget(Colors.red)
  ];
  // _children[_currentIndex],
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _children[index],
      bottomNavigationBar: new BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        onTap: (int index) {
          setState(() {
            this.index = index;
          });
        },
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text("Left"),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.list),
            title: new Text("My Booking"),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.help),
            title: new Text("Help"),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.account_circle),
            title: new Text("My Account"),
          ),
        ],
      ),
    );
  }
}

class PlaceholderWidget extends StatelessWidget {
  final Color color;

  PlaceholderWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}

//GEt Location
class TestLocation extends StatefulWidget {
  @override
  _TestLocationState createState() => _TestLocationState();
}

class _TestLocationState extends State<TestLocation> {
  var lat;
  var lon;
  var address;
  var country;
  var city;
  var locality;

  currentLocation() async {
    // Position position = await Geolocator()
    //     .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    // print(position.latitude);
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    lat = position.latitude;
    lon = position.longitude;
    if (position != null) {
// List<Placemark> placemark = await Geolocator().placemarkFromCoordinates(26.7200217,88.4262866);
      List<Placemark> placemark = await Geolocator()
          .placemarkFromCoordinates(position.latitude, position.longitude);
      var detail;
      var details = placemark.first;
      print("City:${details.locality}, sublocality:${details.subLocality}");
      address = details.country;
      city = details.locality;
      locality = details.subLocality;

      print('sub locality is ${details.subLocality}');
      setState(() {
        detail = "City:${details.locality}, sublocality:${details.subLocality}";
      });
      // SharedPreferences preferences = await SharedPreferences.getInstance();
      // preferences.setString('selectedCity', details.locality);
      // preferences.setString('selectedSubLocality', details.subLocality);
    }
  }
  //  getCurrentLocation()async{
  // Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  //   print(position.latitude);
  //   lat=position.latitude.toString();
  //   lon=position.longitude.toString();

  //         List<Placemark> placemark = await Geolocator()
  //         .placemarkFromCoordinates(position.latitude, position.longitude);

  //         address=placemark.first;

  //           print('My latetude is ${lat}');
  //            print('My longitude is ${lon}');
  //            print('My address from lat and long is ${address}');

  //  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 100,
            ),
            RaisedButton(
              onPressed: () {
                currentLocation();
              },
            ),
            Text('My latetude is ${lat}'),
            Text('My longitude is ${lon}'),
            Text('Couyntry  is ${address}'),
            Text('City is ${city}'),
            Text('Locality is ${locality}'),
          ],
        ),
      ),
    );
  }
}

//Shared Preference test
class SharedPreferenceTest extends StatefulWidget {
  @override
  _SharedPreferenceTestState createState() => _SharedPreferenceTestState();
}

class _SharedPreferenceTestState extends State<SharedPreferenceTest> {
  var title;
  setSharedPreference() async {
    SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();

    _sharedPreferences.setString('kalyan', 'biswas');
  }

  getSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    title = preferences.getString('kalyan');
    // if (preferences.getString('kalyan') != null &&
    //     preferences.getString('selectedCity').isNotEmpty) {

    //   Navigator.of(context).pushReplacementNamed('home-page');

    // } else {
    //  Navigator.of(context).pushReplacementNamed('location');
    // }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setSharedPreference();
    getSharedPreference();

    print(title);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(title.toString()),
      ),
    );
  }
}

//Sqlite login tith MVC pattern


//DropdownButton
class DropdownButtonTest extends StatefulWidget {
  @override
  _DropdownButtonTestState createState() => _DropdownButtonTestState();
}

class _DropdownButtonTestState extends State<DropdownButtonTest> {
  List _fruits = ["Apple", "Banana", "Pineapple", "Mango", "Grapes"];

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _selectedFruit;

  @override
  void initState() {
    _dropDownMenuItems = buildAndGetDropDownMenuItems(_fruits);
    _selectedFruit = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> buildAndGetDropDownMenuItems(List fruits) {
    List<DropdownMenuItem<String>> items = List();
    for (String fruit in fruits) {
      items.add(DropdownMenuItem(value: fruit, child: Text(fruit)));
    }
    return items;
  }

  void changedDropDownItem(String selectedFruit) {
    setState(() {
      _selectedFruit = selectedFruit;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("DropDown Button Example"),
        ),
        body: Container(
          child: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Please choose a fruit: "),
              DropdownButton(
                value: _selectedFruit,
                items: _dropDownMenuItems,
                onChanged: changedDropDownItem,
              )
            ],
          )),
        ),
      ),
    );
  }
}
//Radio Button
class RadiobuttonTest extends StatefulWidget {
  @override
  _RadiobuttonTestState createState() => _RadiobuttonTestState();
}

class _RadiobuttonTestState extends State<RadiobuttonTest> {
  // Declare this variable
int selectedRadio;
 
@override
void initState() {
  super.initState();
  selectedRadio = 0;
}
 
// Changes the selected value on 'onChanged' click on each radio button
setSelectedRadio(int val) {
  setState(() {
    selectedRadio = val;
  });
}
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          // This goes to the build method 
ButtonBar(
  alignment: MainAxisAlignment.center,
  children: <Widget>[
    Radio(
      value: 1,
      groupValue: selectedRadio,
      activeColor: Colors.green,
      onChanged: (val) {
        print("Radio $val");
        setSelectedRadio(val);
      },
    ),
    Radio(
      value: 2,
      groupValue: selectedRadio,
      activeColor: Colors.blue,
      onChanged: (val) {
        print("Radio $val");
        setSelectedRadio(val);
      },
    ),
  ],
),
        ],
      ),
      
    );
  }
}
//check internet connectivity
class CheckInternetConnection extends StatefulWidget {
  // import
  // import 'package:flutter/material.dart';
  // import 'package:connectivity/connectivity.dart';
  // pub
  // connectivity: ^0.4.5+6

  @override
  _CheckInternetConnectionState createState() => _CheckInternetConnectionState();
}

class _CheckInternetConnectionState extends State<CheckInternetConnection> {
 var subscription;
internetTest()async{
  try {
      var connectivityResult = await (Connectivity().checkConnectivity());
if (connectivityResult == ConnectivityResult.mobile) {
  // I am connected to a mobile network.
  _showDialog(connectivityResult.toString(),connectivityResult.index.toString());
} else if (connectivityResult == ConnectivityResult.wifi) {
  _showDialog(connectivityResult.toString(),connectivityResult.index.toString());
}
  } catch (e) {
      _showDialog('no Internwt', 'error ');

  }
}

_checkInternetConnectivity() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      _showDialog(
        'No internet', 
        "You're not connected to a network"
      );
    } else if (result == ConnectivityResult.mobile) {
      _showDialog(
        'Internet access',
        "You're connected over mobile data"
      );
    } else if (result == ConnectivityResult.wifi) {
      _showDialog(
        'Internet access',
        "You're connected over wifi"
      );
    }
  }

  _showDialog(title, text) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(text),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      }
    );
  }


@override
initState() {
  super.initState();
  // internetTest();
  subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
    // Got a new connectivity status!
    _showDialog(result.index.toString(), result.toString());
  });
}
// Be sure to cancel subscription after you are done
@override
dispose() {
  super.dispose();

  subscription.cancel();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Internet connectivity'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Check connectivity'),
          onPressed: _checkInternetConnectivity,
        )
      )
    );
  }

  
}
//Simple Provider Example   provider: 3.1.0+1
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${counter.getCounter()}',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              counter.increment();
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              counter.decrement();
            },
            tooltip: 'Increment',
            child: Icon(Icons.remove),
          )
        ],
      ),
    );
  }
}
class Counter with ChangeNotifier {

  int _counter;

  Counter(this._counter);

  getCounter()=> _counter;
  setCounter(int counter) => _counter = counter;

  void increment(){
    _counter ++;
    notifyListeners();
  }

  void decrement(){
    _counter --;
    notifyListeners();
  }

}

//Mobile and Email launcher    url_launcher: ^5.2.5 packages
//import 'package:url_launcher/url_launcher.dart';

  _launchCaller() async{
    var url="tel:+91 98002 01837";
    if(await canLaunch(url)){
      launch(url);   
    } 
    else{
       print('cant launch this $url ');
    }
}
  _launchEmail() async{
    var url="mailto:sapkotagps@gmail.com";
    if(await canLaunch(url)){
      launch(url);   
    } 
    else{
       print('cant launch this $url ');
    }
}

//change statusbar appbar color
void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.blue, // navigation bar color
    statusBarColor: Colors.pink, // status bar color
  ));
}
//enable or dsable text using button and opasity
 1) bool _visible;
 2) @override
  void initState() {
    _visible = true;
  }
 3) void _toggleVisible() {
    setState(() {
      _visible = !_visible;
    });
  }
 4)   new Opacity(opacity: _visible ? 1.0 : 0.2,
            child: new Text('Now you see me now you don\'t!')),
            new RaisedButton(onPressed: _toggleVisible, child: new Text('Toggle'),
                  )
  //Rotation box or container
   1) int _turns;
     double _value;
   2)  @override
  void initState() {
    _turns = 0;
    _value = 0.0;
  }
   3)  void _onChanged(double value) {
    setState(() {
      _value = value;
      _turns = value.toInt();
    });
  }
  4)  children: <Widget>[
              new Slider(value: _value, onChanged: _onChanged, min: 0.0, max: 4.0,),
              new RotatedBox(quarterTurns: _turns,
              child: new Text('Hello World'),)
//How to change Icon
step 1) change pubspac Dev dependency and flutter_ ixons address 
dev_dependencies: 
  flutter_launcher_icons: "^0.7.3"
  
flutter_icons:
  android: "launcher_icon" 
  ios: true
  image_path: "assets/icon/icon.png"
step 2)run this two commend 
    flutter pub get
    flutter pub run flutter_launcher_icons:main
//make an apk file with this commend 43mb
     flutter build apk 
//make an app bundle file with this commend 10mb small size for release on play store
     flutter build appbundle
    
