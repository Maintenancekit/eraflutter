import 'dart:async';
import 'package:http/http.dart';
import 'package:emergencyidea/ApiClient.dart';
import 'package:emergencyidea/sidebar/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'AppBlocObserver.dart';
import 'Cubits/map_cubit.dart';
import 'firebase_options.dart';
import 'map/maps.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
      (
          MaterialApp(
          debugShowCheckedModeBanner: false,
          home: MultiBlocProvider(providers: [
            BlocProvider<MapCubit>(
              create: (BuildContext context) => MapCubit()..ObtainPermissions(),
            ),
          ], child: SideBar()
          )
      )
      )
  );

  Bloc.observer = AppBlocObserver();
}
class Testing extends StatefulWidget {
  const Testing({super.key});

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();


  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('To the lake!'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}


class authpage extends StatefulWidget {
  const authpage({super.key});

  @override
  State<authpage> createState() => _authpageState();
}

class _authpageState extends State<authpage> {
  final String mapKey = "AIzaSyAUbaB083S1JOn6RXT5NtqwROFySdgu6Hs";
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final googlesignIn = GoogleSignIn();
  Apiclient api = new Apiclient();
  String? AuthType;
  GoogleSignInAccount? CurrentGoogleUser;
  GoogleSignInAccount get user => CurrentGoogleUser!;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Center(
          child: Container(
              width: MediaQuery.sizeOf(context).width / 1.2,
              height: MediaQuery.sizeOf(context).height / 2,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(25)),
              child: Column(
                children: [
                  FittedBox(
                      child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                          child: Text("Emergency Road Assister",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              )))),
                  Gap(20),
            FittedBox(
              fit: BoxFit.fitWidth,
              child:
                  Text("Please Login OR Sign up with the social links below",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            ),
                 Gap(20),
                 SizedBox(
                   height: 150,
                   width: 200,
                   child:
                     Image.asset("assets/authimages/maps.png",
                     )
                 ),
                  Gap(40),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FlutterSocialButton(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SideBar()),
                          );
                         // _handleSignIn();
                        },
                        buttonType: ButtonType.google,
                        iconColor: Colors.black,
                        mini: true,
                      ),
                      FlutterSocialButton(
                        onTap: () {},
                        buttonType: ButtonType.apple,
                        mini: true,
                      ),
                      FlutterSocialButton(
                        onTap: () {},
                        buttonType: ButtonType.facebook,
                          mini: true,
                      ),
                    ]
                  ),
                  StreamBuilder(
                      stream: FirebaseAuth.instance.authStateChanges(),
                      builder: (BuildContext context, snapshot) {
                        if (snapshot.hasData) {
                          Future.delayed(Duration(seconds: 2));
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => SideBar()));
                          });
                        }
                        return Text("");
                      }),
                ],
              )),
        )));
  }
 Future<bool> HasAccount(String email) async{
    bool hasAccount = false;
    Response result = await api.isRegistered(email);
    if(result.statusCode == 404){
      hasAccount = false;
    }else{
      hasAccount = true;
    }
    return hasAccount;
  }
  Future<UserCredential?> _handleSignIn() async {
      try {
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
        final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        await FirebaseAuth.instance.signInWithCredential(credential);
      } catch (e) {
        print(e);
        return null;
      }
  }
}
