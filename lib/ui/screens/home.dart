
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:whatsapp/core/controllers/user_controller.dart';
final formatCurrency = new NumberFormat.currency(locale: "id_ID",
      symbol: "", decimalDigits: 0);
class GrabMoreIconMenu extends StatelessWidget {
  const GrabMoreIconMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: <Widget>[
          SizedBox(height: 5),
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(30)),
            child: Icon(
              Icons.more_horiz,
              size: 40,
              color: Theme.of(context).primaryColor,
            ),
          ),
          SizedBox(height: 8),
          Text("More", style: kGrabBlackRegularSmall.copyWith(fontSize: 15),),
          // Spacer(),
        ],
      ),
    );
  }
}
class GrabIconMenu extends StatelessWidget {
  const GrabIconMenu({
    Key key,
    @required this.title,
    @required this.image,
    this.size = 60,
  }) : super(key: key);

  final String title;
  final String image;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image(
          height: size,
          image: AssetImage(image),
        ),
        SizedBox(height: 5),
        Text(title, style: kGrabBlackRegularSmall.copyWith(fontSize: 15)),
      ],
    );
  }
}

class GrabScreen extends StatefulWidget {
  @override
  _GrabScreenState createState() => _GrabScreenState();
}

class _GrabScreenState extends State<GrabScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 130 + MediaQuery.of(context).viewPadding.top,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color(0xFF00a65a),
                        Color(0xFF008d4c),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 100,
                  color: Colors.white,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GetBuilder<UserController>(
                  builder: (_) {
                    return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(
                        15.0 + MediaQuery.of(context).viewPadding.top),
                    child: Center(
                      child: Text(
                        "Hi , ${_?.user?.name ?? ""}",
                        style: kGrabWhiteRegularSmall,
                      ),
                    ),
                  ),
                  Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Balance",
                                style:
                                    kGrabBlackBoldMedium.copyWith(fontSize: 20),
                              ),
                              Spacer(),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Text("RP",
                                    style: kGrabBlackRegularSmall.copyWith(
                                        color: Colors.grey)),
                              ),
                              new GestureDetector(
                                  onTap: () {
                                    UserController.to.logout();
                                  },
                                  child: Text(
                                      "${formatCurrency.format(_?.user?.balance ?? 0)}",
                                      style: kGrabBlackBoldMedium.copyWith(
                                          color: Colors.black, fontSize: 20),
                                          
                                    ),
                                ),
                              SizedBox(width: 10),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  color: Colors.grey[300],
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 15,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              GrabIconMenu(
                                image: "assets/images/pay/pay.png",
                                title: "Pay",
                              ),
                              GrabIconMenu(
                                image: "assets/images/pay/topu.png",
                                title: "Top Up",
                              ),
                              GrabIconMenu(
                                image: "assets/images/pay/reward.png",
                                title: "Reward",
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
                  }
              )
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  GrabIconMenu(
                    image: "assets/images/feature/car.png",
                    title: "Car",
                  ),
                  GrabIconMenu(
                    image: "assets/images/feature/bike.png",
                    title: "Bike",
                  ),
                  GrabIconMenu(
                    image: "assets/images/feature/food.png",
                    title: "Food",
                  ),
                  GrabIconMenu(
                    image: "assets/images/feature/delivery.png",
                    title: "Delivery",
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  GrabIconMenu(
                    image: "assets/images/feature/rent.png",
                    title: "Rent",
                  ),
                  GrabIconMenu(
                    image: "assets/images/feature/giftcard.png",
                    title: "Gift Cards",
                  ),
                  GrabIconMenu(
                    image: "assets/images/feature/subscription.png",
                    title: "Subscription",
                  ),
                  GrabMoreIconMenu(),
                ],
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 8,
          color: Colors.grey[300],
        ),
        GridView.count(
          padding: EdgeInsets.all(5),
          childAspectRatio: .75,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 2,
          children: List.generate(
            10,
            (index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Material(
                  borderRadius: BorderRadiusDirectional.circular(15),
                  elevation: 5,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(15)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          child: Image.network(
                            "https://image.freepik.com/free-vector/square-food-banner-with-photo_23-2148118766.jpg",
                            fit: BoxFit.cover,
                            // height: 150,
                          ),
                        ),
                        SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Text("Article Title Here",
                                style: kGrabBlackRegularSmall.copyWith(
                                    fontSize: 15)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.calendar_today, size: 15,),
                              SizedBox(width: 5),
                              Text("1 min read",
                                  style: kGrabBlackRegularSmall.copyWith(
                                      fontSize: 15)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
const kGrabWhiteBoldMedium = TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.bold,
  fontFamily: 'Sanomat Grab Web',
  color: Colors.white,
);

const kGrabWhiteRegularSmall = TextStyle(
  fontSize: 20,
  fontFamily: 'Sanomat Grab Web',
  color: Colors.white,
);


const kGrabBlackBoldSmall = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.bold,
  fontFamily: 'Sanomat Grab Web',
  color: Colors.black,
);

const kGrabBlackBoldMedium = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  fontFamily: 'Sanomat Grab Web',
  color: Colors.black,
);

const kGrabBlackBoldLarge = TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.bold,
  fontFamily: 'Sanomat Grab Web',
  color: Colors.black,
);

const kGrabBlackRegularMedium = TextStyle(
  fontSize: 20,
  fontFamily: 'Sanomat Grab Web',
  color: Colors.black,
);

const kGrabBlackRegularSmall = TextStyle(
  fontSize: 12,
  fontFamily: 'Sanomat Grab Web',
  color: Colors.black,
);

fivePercentWidth(BuildContext context) {
  return MediaQuery.of(context).size.width * 0.05;
}

percentHeight(BuildContext context, double percent) {
  return MediaQuery.of(context).size.height * percent;
}
class GrabBottomNavigationItem extends StatelessWidget {
  const GrabBottomNavigationItem({
    @required this.icon,
    this.iconActive,
    @required this.title,
    this.isActive = false,
    this.onTap,
    Key key,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final IconData iconActive;
  final Function onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        child: Container(
          margin: EdgeInsets.all(7),
          child: Column(
            children: <Widget>[
              isActive
                  ? iconActive != null
                      ? Icon(
                          iconActive,
                          color: isActive
                              ? Theme.of(context).primaryColor
                              : Colors.grey,
                        )
                      : Icon(
                          icon,
                          color: isActive
                              ? Theme.of(context).primaryColor
                              : Colors.grey,
                        )
                  : Icon(
                      icon,
                      color: isActive
                          ? Theme.of(context).primaryColor
                          : Colors.grey,
                    ),
              Spacer(),
              Text(title,
                  style: kGrabBlackBoldSmall.copyWith(
                    color:
                        isActive ? Theme.of(context).primaryColor : Colors.grey,
                  )),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
class _HomeScreenState extends State<HomeScreen> {
  static ScrollController _hideButtonController;
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    GrabScreen(),
    SafeArea(
      child: Text("Activity"),
    ),
    SafeArea(
      child: Text("Payment"),
    ),
    SafeArea(
      child: Text("Inbox"),
    ),
    SafeArea(
      child: Text("Account"),
    ),
  ];
  
  bool _isVisible = true;
  @override
  void initState() {
    super.initState();
    _isVisible = true;
    _hideButtonController = new ScrollController();
    _hideButtonController.addListener(() {
      if (_hideButtonController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        setState(() {
          _isVisible = false;
          print("**** $_isVisible up");
        });
      }
      if (_hideButtonController.position.userScrollDirection ==
          ScrollDirection.forward) {
        setState(() {
          _isVisible = true;
          print("**** $_isVisible down");
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AnimatedContainer(
        duration: Duration(milliseconds: 10),
        height:
            _isVisible ? MediaQuery.of(context).viewPadding.bottom + 70 : 0.0,
        child: BottomAppBar(
          elevation: 8,
          color: Colors.white,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  child: GrabBottomNavigationItem(
                    icon: FontAwesomeIcons.compass,
                    iconActive: FontAwesomeIcons.solidCompass,
                    title: "Home",
                    onTap: () {
                      _selectedIndex = 0;
                      setState(() {});
                    },
                    isActive: _selectedIndex == 0,
                  ),
                ),
                Expanded(
                  child: GrabBottomNavigationItem(
                    icon: FontAwesomeIcons.receipt,
                    title: "Acivity",
                    onTap: () {
                      _selectedIndex = 1;
                      setState(() {});
                    },
                    isActive: _selectedIndex == 1,
                  ),
                ),
                Expanded(
                  child: GrabBottomNavigationItem(
                    icon: FontAwesomeIcons.wallet,
                    title: "Payment",
                    onTap: () {
                      _selectedIndex = 2;
                      setState(() {});
                    },
                    isActive: _selectedIndex == 2,
                  ),
                ),
                Expanded(
                  child: GrabBottomNavigationItem(
                    icon: FontAwesomeIcons.inbox,
                    title: "Inbox",
                    onTap: () {
                      _selectedIndex = 3;
                      setState(() {});
                    },
                    isActive: _selectedIndex == 3,
                  ),
                ),
                GrabBottomNavigationItem(
                  icon: FontAwesomeIcons.userCircle,
                  iconActive: FontAwesomeIcons.solidUserCircle,
                  title: "Account",
                  onTap: () {
                    _selectedIndex = 4;
                    setState(() {});
                  },
                  isActive: _selectedIndex == 4,
                ),
              ],
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        controller: _hideButtonController,
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return _widgetOptions.elementAt(_selectedIndex);
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}