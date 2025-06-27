import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';

class ZGeolocator {
  ZGeolocator._();

  /// calculate distance [InKiloMeters] between two locations
  /// [startLatitude] Latitude of the start position
  /// [startLongitude] Longitude of the start position
  /// [endLatitude] Latitude of the destination position
  /// [endLongitude] Longitude of the destination position
  static double getDistanceBtwTwoLocationsInKilo({
    required double startLatitude,
    required double startLongitude,
    required double endLatitude,
    required double endLongitude,
  }) {
    final distanceInMeters = Geolocator.distanceBetween(
      startLatitude,
      startLongitude,
      endLatitude,
      endLongitude,
    );
    return double.parse((distanceInMeters / 1000).toStringAsFixed(1));
  }

  static double calculateDistance({
    required double startLatitude,
    required double startLongitude,
    required double endLatitude,
    required double endLongitude,
  }) {
    var p = 0.017453292519943295;
    var c = cos;
    var a =
        0.5 -
        c((endLatitude - startLatitude) * p) / 2 +
        c(startLatitude * p) *
            c(endLatitude * p) *
            (1 - c((endLongitude - startLongitude) * p)) /
            2;
    return 12742 * asin(sqrt(a));
  }

  static void checkIfLocationPermEnabled({
    required BuildContext context,
    required Function(Position) onSuccess,
    bool showDeniedForeverDialog = true,
  }) async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.deniedForever) {
      if (showDeniedForeverDialog) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: ZAppColor.whiteColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(ZAppSize.s10),
              ),
              buttonPadding: EdgeInsets.zero,
              actionsPadding: EdgeInsets.zero,
              content: Text('location_denied_msg'.tr),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('no_thanks'.tr),
                ),
                TextButton(
                  onPressed: () async {
                    Navigator.of(context).pop();
                    await Geolocator.openAppSettings();
                  },
                  child: Text('ok'.tr),
                ),
              ],
            );
          },
        );
      }

      // Permissions are denied forever, handle appropriately.
      return Future.error(
        Exception('Location permissions are permanently denied.'),
      );
    }
    final position = await Geolocator.getCurrentPosition();
    onSuccess(position);
  }

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  static Future<Position> getCurrentPosition(
    BuildContext context, {
    bool showDeniedForeverDialog = true,
  }) async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      if (showDeniedForeverDialog) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: ZAppColor.whiteColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(ZAppSize.s10),
              ),
              buttonPadding: EdgeInsets.zero,
              actionsPadding: EdgeInsets.zero,
              content: Text('location_denied_msg'.tr),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('no_thanks'.tr),
                ),
                TextButton(
                  onPressed: () async {
                    Navigator.of(context).pop();
                    await Geolocator.openAppSettings();
                  },
                  child: const Text('ok'),
                ),
              ],
            );
          },
        );
      }

      // Permissions are denied forever, handle appropriately.
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
