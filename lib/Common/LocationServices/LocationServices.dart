import 'package:location/location.dart' as a;
import 'package:geocoding/geocoding.dart' as b;

class LocationServices {
  Future<b.Placemark?> getCurrentLocation() async {
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
}
