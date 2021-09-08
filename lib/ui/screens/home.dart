import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:whatsapp/core/constant/colors.dart';
import 'package:whatsapp/core/controllers/user_controller.dart';
import 'package:whatsapp/ui/screens/history_activity.dart';
import 'package:whatsapp/ui/screens/new.dart';
import 'package:whatsapp/ui/widgets/buttom_navigation.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static ScrollController _hideButtonController;
  int _selectedIndex = 0;
  String _title = 'Default Title';
  IconData _icon = Icons.notifications_outlined;
  String _conditionalAction = 'None';
  List<Widget> _widgetOptions = <Widget>[
    SafeArea(child: NewScreen()),
    SafeArea(child: HistoryActivity()),
    SafeArea(
      child: Text("Scan"),
    ),
    SafeArea(
      child: Text("Activity"),
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          leading: IconButton(
            onPressed: () {
              setState(() {
                print("Notification pressed");
              });
            },
            icon: Icon(
              _icon,
              color: Color(0XFF868686),
              size: 24.0,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            _title,
            style: TextStyle(
              fontSize: 18.0,
              fontFamily: "Mulish",
              fontWeight: FontWeight.w700,
              color: AppColors.indigo[900],
            ),
          ),
          actions: <Widget>[
            GestureDetector(
              onTap: () {
                UserController.to.logout();
              },
              child: AvatarImage(
                imageProvider: AssetImage("assets/images/pmu.png"),
                radius: 16,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: AnimatedContainer(
        duration: Duration(milliseconds: 10),
        height:
            _isVisible ? MediaQuery.of(context).viewPadding.bottom + 50 : 0.0,
        child: BottomAppBar(
          elevation: 0,
          color: Colors.transparent,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: BottomNavigation(
                  // icon: FontAwesomeIcons.compass,
                  // iconActive: FontAwesomeIcons.solidCompass,
                  icon: AssetImage("assets/images/icon/home.png"),

                  onTap: () {
                    _selectedIndex = 0;
                    _title='Dashboard';
                    _icon= Icons.ac_unit;
                    setState(() {});
                  },
                  isActive: _selectedIndex == 0,
                ),
              ),
              Expanded(
                flex: 2,
                child: BottomNavigation(
                  // icon: FontAwesomeIcons.compass,
                  // iconActive: FontAwesomeIcons.solidCompass,
                  icon: AssetImage("assets/images/icon/clock.png"),
                  onTap: () {
                    _selectedIndex = 1;
                    _title='History Activity';
                    _icon= Icons.ac_unit;
                    setState(() {});
                  },
                  isActive: _selectedIndex == 1,
                ),
              ),
              Expanded(
                flex: 2,
                child: BottomNavigation(
                  // icon: FontAwesomeIcons.receipt,
                  icon: AssetImage("assets/images/icon/lucide_qr-code.png"),

                  onTap: () {
                    _selectedIndex = 2;
                    setState(() {});
                  },
                  isActive: _selectedIndex == 2,
                ),
              ),
              Expanded(
                flex: 2,
                child: BottomNavigation(
                  // icon: FontAwesomeIcons.wallet,
                  icon: AssetImage("assets/images/icon/clipboard.png"),

                  onTap: () {
                    _selectedIndex = 3;
                    setState(() {});
                  },
                  isActive: _selectedIndex == 3,
                ),
              ),
              Expanded(
                flex: 2,
                child: BottomNavigation(
                  // icon: FontAwesomeIcons.compass,
                  // iconActive: FontAwesomeIcons.solidCompass,
                  icon: AssetImage("assets/images/icon/user-bottom.png"),

                  onTap: () {
                    _selectedIndex = 4;
                    setState(() {});
                  },
                  isActive: _selectedIndex == 4,
                ),
              ),
            ],
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

class AvatarImage extends StatelessWidget {
  AvatarImage({
    @required this.imageProvider,
    this.radius = 10,
  });

  final double radius;
  final ImageProvider imageProvider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: radius,
            backgroundImage: imageProvider,
          ),
        ],
      ),
    );
  }
}

Widget Coba() {
  return AppBar(
    leading: IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.notifications_outlined,
        color: Color(0XFF868686),
        size: 24.0,
      ),
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    title: Text(
      "Dashboard",
      style: TextStyle(
        fontSize: 18.0,
        fontFamily: "Mulish",
        fontWeight: FontWeight.w700,
        color: AppColors.indigo[900],
      ),
    ),
    actions: <Widget>[
      GestureDetector(
        onTap: () {
          UserController.to.logout();
        },
        child: AvatarImage(
          imageProvider: AssetImage("assets/images/pmu.png"),
          radius: 16,
        ),
      ),
    ],
  );
}
