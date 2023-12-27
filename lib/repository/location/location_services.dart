import 'dart:core';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  Future<Position?> _getLocation() async {
    try{LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);}
    catch(e){
      debugPrint("Error getting location: $e");
      return null;
    }
  }

  Future<String?> getPlaceName() async {
    try {
      Position? locationData = await _getLocation();
      double latitude = locationData!.latitude;
      double longitude = locationData.longitude;
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        debugPrint("Place: $place");
        return '${place.subLocality}, ${place.locality}';
      }
      return null;
    } catch (e) {
      debugPrint("Error getting place name: $e");
      return null;
    }
  }
}
