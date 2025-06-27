import 'package:geocoding/geocoding.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';

class ZGeodecoder {
  ZGeodecoder._();

  static Future<Placemark> getAddressFromLatLng(double lat, double lng) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
      if (placemarks.isNotEmpty) {
        final Placemark place = placemarks[0];
        zeaznLogger.i('Street: ${place.street}');
        zeaznLogger.i('City: ${place.locality}');
        zeaznLogger.i('State: ${place.administrativeArea}');
        zeaznLogger.i('Country: ${place.country}');
        zeaznLogger.i('Postal Code: ${place.postalCode}');
        return place;
      } else {
        // Fallback if empty list
        return _defaultGhanaPlacemark();
      }
    } catch (e) {
      print('Error getting address: $e');
      // Fallback on error
      return _defaultGhanaPlacemark();
    }
  }

  static Placemark _defaultGhanaPlacemark() {
    return const Placemark(
      street: 'Unknown Street',
      locality: 'Accra',
      administrativeArea: 'Greater Accra',
      postalCode: '00000',
      country: 'Ghana',
    );
  }
}
