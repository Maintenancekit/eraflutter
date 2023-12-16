import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:emergencyidea/ApiClient.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import 'package:location/location.dart';
import 'package:meta/meta.dart';
import 'package:emergencyidea/Models/Google.dart';
part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit() : super(MapInitial());
  Apiclient api = new Apiclient();
  LatLng Ongoing = new LatLng(0.0, 0.0);
  Location location = Location();
  late LatLng Postion;
  late GoogleMapController mapController;
  late Marker marker;
  List<Area> placesLocations = [];
  Google_get QueryResults = Google_get();
  CameraPosition Me = CameraPosition(target: LatLng(0, 0));
  List<Marker> m = [];
  List<Area> Coordinates = [];
  Future<void> ObtainPermissions() async {
    emit(MapLoading());
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    _permissionGranted = await location.hasPermission();
    print("permission ${_permissionGranted}");
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
      emit(MapGotPermission());
    }

    Future.delayed(Duration(seconds: 4), () {
      emit(MapDoneLoading());
    });
  }

  Future getLocation() async {
    LocationData Data = await location.getLocation();
    print("Something ${Data}");
    return Data;
  }

  Future<void> getCurrentLocation(GoogleMapController controller) async {
    Me = new CameraPosition(target: Postion);
    await controller.animateCamera(CameraUpdate.newCameraPosition(Me));
  }

  Future<List<Results>> getPlace(
      String place, double latitude, double longitude, double radius) async {
    Response result = await api.getPlaces(place, latitude, longitude, radius);
    Google_get Data = Google_get();
    Data = Google_get.fromJson(jsonDecode(result.body));
    List<Results> resultData = Data.results!;
    return resultData;
  }
  Future<List<Marker>> getMarkers(String place, double latitude, double longitude, double radius) async {
    Response result = await api.getPlaces(place, latitude, longitude, radius);
    Google_get Data = Google_get();
    Data = Google_get.fromJson(jsonDecode(result.body));
    final decoded = jsonDecode(result.body);
    final smalldata = decoded['results'];
    Iterable going = smalldata;
    Iterable items = going.map((e) => e["geometry"]);
    Iterable Lats = items.map((e) => e["location"]);
    List saved = Lats.toList();
    int counter = 0;
    for (var element in saved) {
      double Latitude = element['lat'];
      double Longitude = element['lng'];
      if(counter == 0){

        print("Home Added");
        LocationData Data = await location.getLocation();
        m.add(
            Marker(
              markerId: MarkerId("${counter}"),
              position: LatLng(Data.latitude!,Data.longitude!),
              infoWindow: const InfoWindow(
                title: "You",
              ),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueMagenta),

            ));
        counter++;
      }else {
        print("Markers ${counter}");
        m.add(Marker(
          markerId: MarkerId("${counter}"),
          position: LatLng(element['lat'], element['lng']),
          icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueOrange),

        ));
        Coordinates.add(Area(lat: element['lat'], lng: element['lng']));
        counter++;
      }
    }
    return m;
  }
  void Refreshminibar() {
    emit(MapRefresh());
    emit(MapDoneLoading());
  }
}
