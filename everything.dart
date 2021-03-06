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
    
//Google font useing pub
   ->  google_fonts: ^0.2.0
   ->  import 'package:google_fonts/google_fonts.dart';

         Text(
  'This is Google Fonts',
  style: GoogleFonts.lato(),
),

//type 1
Text(
  'This is Google Fonts',
  style: GoogleFonts.lato(
    textStyle: TextStyle(color: Colors.blue, letterSpacing: .5),
  ),
),
            Text(
              'Handwriting',
              // style: TextStyle(fontSize: 30),
              style: GoogleFonts.ultra(
                textStyle: TextStyle(
                    color: Colors.blue, letterSpacing: .5, fontSize: 40),
              ),
            ),
//Make Random color in Circle avetor
    setp 1 ->
      List<MaterialColor> _color=[Colors.indigo,Colors.green,Colors.brown,Colors.purple,Colors.purple]; 
    setp 2 ->
        return ListView.builder(
         itemCount: snapshot.data.length,
          itemBuilder: (context,index){
            MaterialColor myColor=_color[index % _color.length];
            return Card(
              elevation: 10.0,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: myColor,
                  foregroundColor: Colors.white,
                child: Text(snapshot.data[index]['id'].toString()),

                ),
                title: Text(snapshot.data[index]['company']['name'].toString()),
              ),
            );
          },
          
 //copyboard set data and get daata 
          //import
          import 'package:flutter/services.dart';

          //set data
           Clipboard.setData( ClipboardData(text: temp_word));
          //  get data
           Future<ClipboardData>  data =  Clipboard.getData('text/plain');
           print(data.toString());
          
         // or  get data
          Future<String> getClipBoardData() async {
  ClipboardData data = await Clipboard.getData('text/plain');
   return data.text;
}

              String data =await getClipBoardData();
              
              print(data);
          
 //snackbar
          // setp 1:
          final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
              // setp 2:
             return Scaffold(
       key: _scaffoldKey,
      body: Container(
          //step 3:
            showInSnackBar('Message Sent');
          //step 4:
            void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      backgroundColor: Colors.transparent,
      duration: Duration(seconds: 1),
      content: new Text(value)));
       }
          
//Spliting of string 
          void processTxtReceive(String temptxtReceive) {
    if (temptxtReceive.contains('[') && temptxtReceive.contains(']')) {
      setState(() {
        tempUniqueNumber = temptxtReceive.substring(
            temptxtReceive.indexOf('[') + 1, temptxtReceive.indexOf(']'));
        if (tempUniqueNumber == unique_number) {
          tempUniqueNumber = temptxtReceive.substring(
              temptxtReceive.indexOf(']') + 1, temptxtReceive.length);
          List<String> tempListOfButtonStatus = [];
          tempListOfButtonStatus = tempUniqueNumber.split(',');
          setFinalStatus(tempListOfButtonStatus);
        }
      });
    }
  }

//Loading dialoge login button click 
        void _onLoading() {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        elevation: 10,
        child: Container(
          color: Colors.blue[300],
          height: 150,
          // decoration: BoxDecoration(
          //    color: Colors.red,
          //   borderRadius: BorderRadius.circular(10)
          // ),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
               Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                     new CircularProgressIndicator(),
                     SizedBox(
                       height: 30,
                     ),
              new Text("Loading... ",style: TextStyle(
                color: Colors.white,
              ),),
                 ],
               ),
            ],
          ),
        ),
      );
    },
  );
  new Future.delayed(new Duration(seconds: 3), () {
    // Navigator.pop(context); //pop dialog
    // _login();
      Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) =>PinCodeVerificationScreen(phoneNumber: '$mobile'),
      ),
    );
  });
  
}

  setAllData() async {
    if (name != null && mobile != null) {
      createFileFunction(
          filename: fileName,
          fileData: name + '\n' + mobile);
    }
_onLoading();
    // Navigator.of(context).pushReplacement(
    //   MaterialPageRoute(
    //     builder: (context) =>PinCodeVerificationScreen(phoneNumber: '$mobile'),
    //   ),
    // );
  }
//Random no for 4 integer
        import 'dart:math';
         static Random random = new Random();
  static int randomNumber = random.nextInt(100000); // from 0 upto 9999 included
  static String deviceIdentifier = '${randomNumber}/device';
        
  //if back button pressed alert dialog appear
         Future<bool> _onWillPop() {
    return showDialog(
      context: context,
      child: new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Unsaved data will be lost.'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No'),
          ),
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: new Text('Yes'),
          ),
        ],
      ),
    ) ?? false;
  }
step :2
         @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: _onWillPop,
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        
//multiple listview builder
         body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              children: <Widget>[
                Text(
                  'Header for list $index',
                  style: Theme.of(context).textTheme.body2,
                ),
                ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8.0,
                      ),
                      child: Text(
                        'Nested list item $index',
                        style: Theme.of(context).textTheme.body1,
                      ),
                    );
                  },
                  itemCount: 4,
                  shrinkWrap: true, // todo comment this out and check the result
                  physics: ClampingScrollPhysics(), // todo comment this out and check the result
                ),
              ],
            ),
          );
        },
        itemCount: 9,
      ),
    );
      
  //shadow in container
  Container(
    height: 200.0,
    decoration: new BoxDecoration(
      color: Colors.orange,
      boxShadow: [
        new BoxShadow(blurRadius: 40.0)
      ],
      borderRadius: new BorderRadius.vertical(
          bottom: new Radius.elliptical(
              MediaQuery.of(context).size.width, 100.0)),
    ),
  ),   
   //Rounded textfield     
      new TextField(
  decoration: new InputDecoration(
      border: new OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          const Radius.circular(10.0),
        ),
      ),
      filled: true,
      hintStyle: new TextStyle(color: Colors.grey[800]),
      hintText: "Type in your text",
      fillColor: Colors.white70),
)
//find app install date
        device_apps: ^1.0.9

      import 'package:device_apps/device_apps.dart';
import 'package:intl/intl.dart';
  findAppInstAllDate()async{
    Application app = await DeviceApps.getApp('com.example.smartify');
    var milis=app.installTimeMilis;
     var tempInstalledDate =  DateTime.fromMillisecondsSinceEpoch(milis);
     try {
       setState(() {
          installedDate= DateFormat('yyyy-MM-dd').format(tempInstalledDate).toString()??'';
    versionCode= app.versionName.toString() ?? '';
       });
           

     } catch (e) {
       print(e.toString());
     }
  }
     //Date Picker Time Picker and Duration Picker
        TimeOfDay seduleForSwitchOn = TimeOfDay.now();
  TimeOfDay seduleForSwitchOff = TimeOfDay.now();

  Future<Null> selectDate(BuildContext context)async{
    final DateTime picked=await showDatePicker(
      context: context, initialDate: _date, firstDate: DateTime(2020), lastDate: DateTime(2030));
      if (picked!=null && picked!=_date) {
        setState(() {
          _date=picked;
        });
      }
  }
      
         Future<Null> selectTime(BuildContext context,{seduleForSwitch})async{
    final TimeOfDay picked=await showTimePicker(
      context: context,initialTime: seduleForSwitch);
      if (picked!=null && picked!=seduleForSwitch) {
        setState(() {
          seduleForSwitchOn=picked;
        });
      }
  }
         selectTime(context,seduleForSwitch: seduleForSwitchOn);
 Duration resultingDuration = await showDurationPicker(
                          context: context,
                          initialTime: new Duration(minutes: 5),
                        );
                        if (resultingDuration.toString().isNotEmpty &&
                            resultingDuration != null) {
                          setState(() {
                            _duration = resultingDuration;

                            allOnValueString =
                                'Schedule time ${_duration.inMinutes} min';
                            allOnShortValue = '2';
                          });
                        }
      
      //Sound on button Click
    Step 1: add   audioplayers: ^0.14.0
    Step 2:  assets:
    - assets/audio/my_audio.mp3
      Step 3:import 'package:audioplayers/audio_cache.dart';
             import 'package:audioplayers/audioplayers.dart'; 
      
        AudioCache _audioCache;
        @override
  void initState() {
    super.initState();
    _audioCache = AudioCache(
        prefix: "audio/",
        fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP));
    // _audioCache = AudioCache( fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP));

  }
       onTap: () {
                      _audioCache.play('my_audio.mp3');
                    }),
    //turn On WiFI
      wifi_iot: ^0.1.1

    import 'package:wifi_iot/wifi_iot.dart';

     WiFiForIoTPlugin.setEnabled(true);
    //List Of all available
    List<WifiNetwork> list; List
        list = await WiFiForIoTPlugin.loadWifiList();
    //connect to wifi
      await WifiConnector.connectToWifi(
                          ssid: ssid,password: passwordController.text);
//Create folder in External Storage
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:path_provider_ex/path_provider_ex.dart';
import 'dart:io';

import 'package:simple_permissions/simple_permissions.dart';
//packages
//  simple_permissions: ^0.1.9
//  path_provider_ex:
//Android mainfest 
//  <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
//   <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<StorageInfo> _storageInfo = [];

  @override
  void initState() {
    super.initState();
    initPlatformState();
    Timer(Duration(seconds: 2), () {
      createFolder();
    });
  }

  createFolder() async {
    PermissionStatus permissionResult =
        await SimplePermissions.requestPermission(
            Permission.WriteExternalStorage);
    if (permissionResult == PermissionStatus.authorized) {
    //   Directory _appFile = Directory(_storageInfo[0].rootDir + '/MyTestFOlder');
    // _appFile.create();

     new Directory(_storageInfo[0].rootDir + '/MyKalyanFolder').create()
    // The created directory is returned as a Future.
    .then((Directory directory) {
      print(directory.path);
  });
      // File ourTempFile = File(_appFile.path);
      // print(ourTempFile.path);
     // ourTempFile.create();
      // code of read or write file in external storage (SD card)
    }
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    List<StorageInfo> storageInfo;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      storageInfo = await PathProviderEx.getStorageInfo();
    } on PlatformException {}

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _storageInfo = storageInfo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
                'Internal Storage root:\n ${(_storageInfo.length > 0) ? _storageInfo[0].rootDir : "unavailable"}\n'),
            Text(
                'Internal Storage appFilesDir:\n ${(_storageInfo.length > 0) ? _storageInfo[0].appFilesDir : "unavailable"}\n'),
            Text(
                'Internal Storage AvailableGB:\n ${(_storageInfo.length > 0) ? _storageInfo[0].availableGB : "unavailable"}\n'),
            Text(
                'SD Card root: ${(_storageInfo.length > 1) ? _storageInfo[1].rootDir : "unavailable"}\n'),
            Text(
                'SD Card appFilesDir: ${(_storageInfo.length > 1) ? _storageInfo[1].appFilesDir : "unavailable"}\n'),
            Text(
                'SD Card AvailableGB:\n ${(_storageInfo.length > 1) ? _storageInfo[1].availableGB : "unavailable"}\n'),
          ],
        ),
      ),
    );
  }
}
//page transiction nice ounchind page transmission
        Navigator.of(context).push(
                          PageRouteBuilder(
                            transitionDuration: Duration(seconds: 1),
                            transitionsBuilder: (BuildContext context,
                                Animation<double> animation,
                                Animation<double> secAnimation,
                                Widget child) {
                                  animation=CurvedAnimation(parent: animation, curve: Curves.elasticInOut);
                              return ScaleTransition(
                                alignment: Alignment.center,
                                scale: animation,
                                child: child,
                              );
                            },
                            pageBuilder: (BuildContext context,
                                Animation<double> animation,
                                Animation<double> secAnimation) {
                              return MainScreen(
                                database: _database,
                                listOfLocationId: widget.listOfLocationId,
                                //   deviceNameList:deviceNameList[i],
                                deviceNameListId:
                                    deviceNameList[i].toString() ?? '',
                                deviceNameListString:
                                    deviceNameListString[i] ?? '');
                            })
                            );
 
//Notification icon with number counter
      badges: ^1.1.0

    import 'package:badges/badges.dart';

    IconButton(
            icon: Badge(
              badgeColor: Colors.orange,
              toAnimate: false,
              badgeContent: Text(
                '${catalog.catalogs.length}',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
              child: Icon(
                Icons.delete_forever,
                color: Colors.white,
              ),
            ),
            onPressed: () {
              catalogController.clearCatalogs();
            },
          ),
    
//I phone time and date picker
//CupertinoDatePicker time and date picker
         Container(
                          //  height: MediaQuery.of(context).copyWith().size.height ,
                          height: 100,
                          child: SizedBox.expand(
                            child: CupertinoDatePicker(
                              mode: CupertinoDatePickerMode.time,
                              onDateTimeChanged: (time) {
                                 setState(() {
                                   setAcTime=time;
                                 });
                              },
                              initialDateTime: DateTime.now(),
                            ),
                          ));
