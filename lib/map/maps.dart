import 'package:flutter/material.dart';
import 'package:flutter_arc_speed_dial/flutter_speed_dial_menu_button.dart';
import 'package:flutter_arc_speed_dial/main_menu_floating_action_button.dart';
import 'dart:async';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:gap/gap.dart';
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:emergencyidea/Cubits/map_cubit.dart';
import 'package:location/location.dart';

import '../Models/Google.dart';

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  late MapCubit current;
  LocationData? _currentPosition;
  Completer<GoogleMapController> mapController = Completer();
  late Marker marker;
  String Apikey = "AIzaSyAUbaB083S1JOn6RXT5NtqwROFySdgu6Hs";
  LatLng _initialcameraposition = new LatLng(0.5937, 0.9629);
  LatLng Here = new LatLng(0.0, 0.0);
  Location location = Location();
  bool _isShowDial = false;
  double radius = 500;
  List<Marker> _markers = [];
  List<LatLng> polylineCoordinates = [];
  List<Polyline> lines = [];
  bool isfollowing = false;
  @override
  void initState() {
    current = context.read<MapCubit>();
    super.initState();
    getCurrentLocation();
  }

  void getCurrentLocation() async {
    Location currentLocation = Location();
    currentLocation.getLocation().then(
      (currentLocation) {
        setState(() {
          _currentPosition = currentLocation;
          current.getMarkers('School', _currentPosition!.latitude!,
              _currentPosition!.longitude!, radius);
        });
      },
    );
    if (isfollowing) {
      final GoogleMapController controller = await _controller.future;
      currentLocation.onLocationChanged.listen((updatedlocation) {
        setState(() {
          _currentPosition = updatedlocation;
          controller
              .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
            target:
                LatLng(updatedlocation.latitude!, updatedlocation.longitude!),
            tilt: 25,
          )));
        });
      });
    }
  }

  void Guideuser(PointLatLng Destination) async {
    lines.clear();
    int counter = 0;
    PolylinePoints Points = PolylinePoints();
    PolylineResult results = await Points.getRouteBetweenCoordinates(
        Apikey,
        PointLatLng(_currentPosition!.latitude!, _currentPosition!.longitude!),
        Destination);

    final GoogleMapController controller = await _controller.future;
    setState(() {
      isfollowing = true;
      controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target:
              LatLng(_currentPosition!.latitude!, _currentPosition!.longitude!),
          tilt: 50.0000,
          zoom: 40.0000)));
      if (results.points.isNotEmpty) {
        results.points.forEach((PointLatLng Point) {
          polylineCoordinates.add(LatLng(Point.latitude, Point.longitude));
          Polyline currentline = Polyline(
            polylineId: PolylineId("${counter}"),
            points: polylineCoordinates,
            color: Colors.pinkAccent,
            width: 6,
          );
          lines.add(currentline);
        });
      }
    });
  }

  late CameraPosition _CurrentLocation = CameraPosition(
    target: LatLng(_currentPosition!.latitude!, _currentPosition!.longitude!),
    zoom: 19.151926040649414,
  );

  @override
  Widget build(BuildContext context) {
    final stateobj = context.read<MapCubit>();
    return Scaffold(
    body:
      BlocBuilder<MapCubit, MapState>(builder: (context, state) {
      if (state is MapLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is MapDoneLoading) {
        return _currentPosition == null
            ? Center(child: CircularProgressIndicator())
            : Directionality(
                textDirection: TextDirection.ltr,
                child: GoogleMap(
                  compassEnabled: true,
                  myLocationButtonEnabled: false,
                  mapType: MapType.hybrid,
                  initialCameraPosition: _CurrentLocation,
                  onMapCreated: (GoogleMapController controller) {
                    mapController.complete(controller);
                    _controller.complete(controller);
                  },
                  markers: Set<Marker>.of(stateobj.m),
                  polylines: Set<Polyline>.of(lines),
                  buildingsEnabled: true,
                ));
      }
      return _currentPosition == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Directionality(
              textDirection: TextDirection.ltr,
              child: GoogleMap(
                myLocationEnabled: true,
                compassEnabled: true,
                myLocationButtonEnabled: false,
                mapType: MapType.hybrid,
                initialCameraPosition: _CurrentLocation,
                onMapCreated: (GoogleMapController controller) {
                  mapController.complete(controller);
                  _controller.complete(controller);
                },
                markers: Set<Marker>.of(stateobj.m),
                polylines: Set<Polyline>.of(lines),
                buildingsEnabled: true,
                trafficEnabled: true,
              ));
    }
    ),
    floatingActionButton:_currentPosition == null
    ? Text("Loading")
        : _menuaction(_currentPosition!.latitude!, _currentPosition!.longitude!),
    );
  }

  Future<void> _goToTheLake(CameraPosition here) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(here));
    // controller.moveCamera(CameraUpdate.newCameraPosition(here));
  }

  Future<void> _bottompuller(String place, double latitude,
      double longitude) {
    final stateobj = context.read<MapCubit>();
    return showModalBottomSheet<void>(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(25),
            )),
        builder: (BuildContext context) {
          return Container(
            height: 300,
            child: Column(children: [
              Gap(20),
              Container(
                  height: 200,
                  child:
                  BlocProvider(
                      create: (BuildContext context) => MapCubit(),
                      child:
                      BlocBuilder<MapCubit, MapState>(
                          builder: (context, state) {
                            if (state is MapRefresh) {
                              return FutureBuilder<List<Results>>(
                                  future: stateobj.getPlace(
                                      place, latitude, longitude, radius),
                                  builder: (context, AsyncSnapshot snapped) {
                                    if (snapped.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    } else if (snapped.hasError) {
                                      return Text(
                                          'Error found - ${snapped.error}');
                                    }

                                    return Expanded(
                                        child: ListView.builder(
                                            shrinkWrap: true,
                                            padding: const EdgeInsets.only(
                                                bottom: kBottomNavigationBarHeight),
                                            itemCount: snapped.data!.length,
                                            itemBuilder: (context, index) {
                                              print(snapped.data!.length);
                                              return _listitem(
                                                  snapped.data![index],
                                                  index);
                                            }));
                                  });
                            }
                            return FutureBuilder<List<Results>>(
                                future: stateobj.getPlace(
                                    place, latitude, longitude, radius),
                                builder: (context, AsyncSnapshot snapped) {
                                  if (snapped.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  } else if (snapped.hasError) {
                                    return Text(
                                        'Error found - ${snapped.error}');
                                  }
                                  return Expanded(
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          padding: const EdgeInsets.only(
                                              bottom: kBottomNavigationBarHeight),
                                          itemCount: snapped.data!.length,
                                          itemBuilder: (context, index) {
                                            print(snapped.data!.length);
                                            return _listitem(
                                                snapped.data![index], index);
                                          }));
                                });
                          }))
              )
            ]),
          );
        });
  }

  Widget _listitem(Results Data, int count) {
    final stateobj = context.read<MapCubit>();
    return
      Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
        child: Container(
          width: double.infinity,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                color: Color(0x520E151B),
                offset: Offset(0, 2),
              )
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "${count}",
                  style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Gap(15),
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(
                    "${Data.icon}",
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${Data.name}',
                          style: TextStyle(
                            fontFamily: 'Plus Jakarta Sans',
                            color: Color(0xFF14181B),
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    int num = 0 ;
                    num = count;
                    print(num);
                    _goToTheLake(
                      CameraPosition(
                        target: LatLng(stateobj.Coordinates[count].lat!,
                            stateobj.Coordinates[count].lng!),
                        zoom: 19.90212011,
                      ),
                    );
                    //print(itemnumber);
                    print("Lat: ${stateobj.Coordinates[count].lat!}");
                  },
                  child:
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                    child: Icon(Icons.location_on_sharp),
                  ),
                ),
                Gap(10),
                InkWell(
                    onTap: (){
                      stateobj.Refreshminibar();
                      PointLatLng destination = PointLatLng(
                          stateobj.Coordinates[count].lat!, stateobj.Coordinates[count].lng!);
                      Guideuser(destination);
                    },
                    child:
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0,5, 0, 0),
                        child: Icon(Icons.gps_fixed_outlined)
                    )
                ),
              ],
            ),
          ),
        ),
      );
  }
  Widget _menuaction(double latitude, double longitude) {
    return SpeedDialMenuButton(
      //if needed to close the menu after clicking sub-FAB
      isShowSpeedDial: _isShowDial,
      //manually open or close menu
      updateSpeedDialStatus: (isShow) {
        //return any open or close change within the widget
        this._isShowDial = isShow;
      },
      //general init
      isMainFABMini: false,
      mainMenuFloatingActionButton: MainMenuFloatingActionButton(
          child: Icon(Icons.menu),
          onPressed: () {},
          closeMenuChild: Icon(Icons.close),
          closeMenuForegroundColor: Colors.white,
          closeMenuBackgroundColor: Colors.red),
      floatingActionButtonWidgetChildren: <FloatingActionButton>[
        FloatingActionButton(

          tooltip: "Locations",
          child: Icon(Icons.list_alt_outlined),
          onPressed: () {
            //if need to close menu after click
            setState(() {
              _isShowDial = false;
            });
            _bottompuller('School', latitude, longitude);
          },
          backgroundColor: Colors.pink,
        ),
        FloatingActionButton(

          child: Icon(Icons.maps_home_work_outlined),
          onPressed: () {
            //if need to toggle menu after click
            _isShowDial = !_isShowDial;
            setState(() {});
          },
          backgroundColor: Colors.orange,
        ),
        FloatingActionButton(

          child: Icon(Icons.location_on_sharp),
          onPressed: () {
            _goToTheLake(_CurrentLocation);
          },
          backgroundColor: Colors.deepPurple,
        ),
      ],
      isSpeedDialFABsMini: true,
      paddingBtwSpeedDialButton: 30.0,
    );
  }
}
