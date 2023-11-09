import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as b;
import 'package:get/get.dart';
import 'package:helpy_moto_custms/Common/LocationServices/LocationController.dart';
//import 'package:helpy_moto_custms/Common/LocationServices/LocationController.dart';
import 'package:helpy_moto_custms/HomeScreen/Controller/HomeScreenController.dart';
import 'package:helpy_moto_custms/HomeScreen/NavBarTabs/Chats/Chatscreen.dart';
import 'package:helpy_moto_custms/HomeScreen/NavBarTabs/Home/HomeTab.dart';
import 'package:helpy_moto_custms/HomeScreen/NavBarTabs/Orders/OrderScreen.dart';
import 'package:helpy_moto_custms/HomeScreen/NavBarTabs/Profile/ProfileScreen.dart';
import 'package:location/location.dart' as a;
//import 'package:helpy_moto_custms/HomeScreen/Controller/HomeScreenController.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // ignore: non_constant_identifier_names
  final HomeScreenController HSController = Get.put(HomeScreenController());
  // ignore: non_constant_identifier_names
  // b.Placemark? MYAdress;
  final LocationController LController = Get.put(LocationController());
  final homeContent = [
    const HomeTab(),
    const ChatScreen(),
    const OrderScreen(),
    const ProfileScreen(),
  ];
  /* Future<b.Placemark?> getCurrentLocation() async {
    a.Location location = a.Location();

    bool serviceEnabled;
    a.PermissionStatus permissionGranted;
    a.LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return null;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == a.PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != a.PermissionStatus.granted) {
        return null;
      }
    }

    locationData = await location.getLocation();
    print(locationData.latitude);
    var Adress = [];
    Adress = await b.placemarkFromCoordinates(
        locationData.latitude!, locationData.longitude!);

    /* b.Placemark place = Adress[0];
    setState(() {
      if (place != null) {
        MYAdress = place;
      }
    });
    print(
        '${MYAdress!.street}, ${MYAdress!.subLocality}, ${MYAdress!.subAdministrativeArea}, ${MYAdress!.postalCode}');*/
    return Adress[0];
  }

  @override
  void initState() {
    // getCurrentLocation();
    super.initState();
  }*/

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          extendBody: true,
          appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.black,
              actions: const [
                Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 35,
                ),
                Icon(
                  Icons.car_repair,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 30,
                ),
              ],
              //  centerTitle: true,
              //   title: Obx(() => Text(LController.currentAddress.value)),
              title: LController.MYAdress.value != null
                  ? Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Color.fromARGB(255, 197, 36, 36),
                        ),
                        Obx(
                          () => SizedBox(
                            width: 180,
                            child: LController.MYAdress.value.name != null
                                ? Text(
                                    '${LController.MYAdress.value.name}',
                                    style: const TextStyle(
                                        fontSize: 15, color: Colors.white),
                                  )
                                : const Text(''),
                          ),
                        ),
                      ],
                    )
                  : const Text('')),
          /*  drawer: const Drawer(
            width: 200,
            backgroundColor: Colors.blueGrey,
            child: Column(),
          ),*/
          body: Obx(() => homeContent[HSController.tabIndex.value]),
          /* floatingActionButton: FloatingActionButton(
            shape: const CircleBorder(),
            backgroundColor: Colors.white,
            onPressed: () {},
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(Icons.car_crash_outlined), Text('SOS')],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,*/
          bottomNavigationBar: Obx(
            () => BottomAppBar(
              notchMargin: 10,
              shape: const CircularNotchedRectangle(),
              color: Color.fromARGB(255, 25, 19, 19),
              padding: const EdgeInsets.all(0),
              child: BottomNavigationBar(
                elevation: 0,
                backgroundColor: Colors.green[400]!.withAlpha(
                    0), // transparent, you could use 0x44aaaaff to make it slightly less transparent with a blue hue.
                type: BottomNavigationBarType.fixed,
                onTap: (value) {
                  HSController.changeTabIndex(value);
                },
                showUnselectedLabels: true,
                currentIndex: HSController.tabIndex.value,
                selectedItemColor: Colors.green,
                unselectedItemColor: Colors.white,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home_rounded), label: 'Home'),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.chat),
                    label: 'Chats',
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.list_alt_sharp), label: 'Orders'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person_2_outlined), label: 'Profile'),
                ],
              ),
            ),
          )),
    );
  }
}
