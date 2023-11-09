import 'package:location/location.dart' as a;
import 'package:geocoding/geocoding.dart' as b;
import 'package:get/get.dart';
import './LocationServices.dart';

class LocationController extends GetxController {
  final MYAdress = b.Placemark().obs;
  LocationServices lserv = LocationServices();

  GetCurrentLocation() async {
    var loc = await lserv.getCurrentLocation();
    if (loc != null) {
      MYAdress.value = loc;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    GetCurrentLocation();
    super.onInit();
  }
}
