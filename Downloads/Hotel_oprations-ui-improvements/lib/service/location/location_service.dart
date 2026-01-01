// import 'package:funotel_hotel_check_in_app/common/error_messages/error_messages.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:location/location.dart' as location;

// double? lat;
// double? lng;
// String? address;

// Future<Position> determinePosition() async {
//   bool serviceEnabled;
//   LocationPermission permission;

//   serviceEnabled = await Geolocator.isLocationServiceEnabled();
//   if (!serviceEnabled) {
//     await location.Location().requestService();
//     // return Future.error('Location services are disabled.');
//   }

//   permission = await Geolocator.checkPermission();
//   if (permission == LocationPermission.denied) {
//     permission = await Geolocator.requestPermission();
//     if (permission == LocationPermission.denied) {
//       ErrorMessages.display("Location permissions are denied");
//       return Future.error('Location permissions are denied');
//     }
//   }

//   if (permission == LocationPermission.deniedForever) {
//     ErrorMessages.display(
//         "Location permissions are permanently denied, we cannot request permissions.");
//     return Future.error(
//         'Location permissions are permanently denied, we cannot request permissions.');
//   }

//   return await Geolocator.getCurrentPosition();
// }

// Future<String> getAddressFromLatLng() async {
//   try {
//     List<Placemark> placemarks = await placemarkFromCoordinates(lat!, lng!);
//     return "${placemarks[0].street}, ${placemarks[0].subLocality}, ${placemarks[0].locality}, ${placemarks[0].administrativeArea}, ${placemarks[0].country}";
//   } catch (e) {
//     return "";
//   }
// }
