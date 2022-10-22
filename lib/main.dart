import 'dart:io';
import 'package:double_bogey_flutter/screens/BookBoxPage/bookBoxPage.dart';
import 'package:double_bogey_flutter/screens/CreateUser/createUserPage.dart';
import 'package:double_bogey_flutter/screens/EventPage/eventPage.dart';
import 'package:double_bogey_flutter/screens/GamingPage/gamingPage.dart';
import 'package:double_bogey_flutter/screens/MyAccountPage/ViewMyAccountPage.dart';
import 'package:double_bogey_flutter/screens/MyBookingsPage/myBookingsPage.dart';
import 'package:double_bogey_flutter/screens/GolfPage/golfPage.dart';
import 'package:double_bogey_flutter/screens/HomePage/homePage.dart';
import 'package:double_bogey_flutter/screens/ResetPasswordPage/resetPasswordPage.dart';
import 'package:double_bogey_flutter/screens/wheelPage.dart';
import 'package:flutter/material.dart';
import 'package:double_bogey_flutter/services/auth_service.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../data/local.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

//Main definition
void main() {
  //Only in DEV, in PROD resolve certificate issue!!! See function below.
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

//Only in dev, in prob resolve certificate issue!!!
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String _title = 'Double Bogey Mobile App (DEV)';
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final String _title = "Golf indoor a Wavre";
  @override
  void initState() {
    initAction();
    WidgetsFlutterBinding.ensureInitialized();
    name = '';
    super.initState();
  }

  toggleDrawer() async {
    if (_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openEndDrawer();
    } else {
      _scaffoldKey.currentState!.openDrawer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'),
          Locale('fr')
        ],
      theme: ThemeData(
        textTheme: GoogleFonts.ubuntuTextTheme(),
      ),
      title: MyApp._title,
      home: Builder(
        builder: (context) => Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(backgroundColor: Colors.black,title: Row(
            children: [
              Image.asset(
                'media/img/db-logo.png',
                height: 65,
                width: 65,
              ),
              const SizedBox(width: 15),
              Text(_title, style: const TextStyle(fontSize: 15, color: Colors.white),),
            ],
          ),),
          drawer: Drawer(
            width: 200,
            child: ListView(
              padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: const BoxDecoration(
                      image: DecorationImage(image: AssetImage('media/img/db-drawer.jpg'),
                      fit: BoxFit.cover),
                    ),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child:
                        Text(name!, style: const TextStyle(color: Colors.white),)
                      ,
                    ),
                  ),
                  if (!isLoggedIn)
                  ListTile(
                    title: const Text("Créer un compte"),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CreateUserPage()));
                        toggleDrawer();}
                  ),
                  if (!isLoggedIn)
                  ListTile(
                    title: const Text("Se connecter"),
                    onTap: () => loginAction(),
                  ),
                  if (!isLoggedIn)
                  ListTile(
                      title: const Text("Réinitialiser mot de passe"),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ResetPasswordPage()));
                        toggleDrawer();}
                  ),
                  if (isLoggedIn)
                    ListTile(
                        title: const Text("Mon compte"),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewMyAccountPage()));
                          toggleDrawer();}
                    ),
                  if (isLoggedIn)
                    ListTile(
                    title: const Text("Mes réservation"),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MyBookingsPage()));
                      toggleDrawer();},
                  ),
                  if (isLoggedIn)
                    ListTile(
                    title: const Text("Réserver"),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const BookBoxPage()));
                      toggleDrawer();},
                  ),
                  if (isLoggedIn)
                  const Divider(),
                  if (isLoggedIn)
                  ListTile(
                      title: const Text("Logout",style: TextStyle(color: Colors.red),),
                      onTap: () => setLogoutState()
                  ),
                ],
            ),
          ),
          body: const BottomNavBarWidget(),
        ),
      )
    );
  }

  setSuccessAuthState() {
    setState((){
      isProgressing = false;
      isLoggedIn = true;
      name = AuthService.instance.idToken?.name;
    });
  }

  setLoadingState() {
    setState(() {
      isProgressing = true;
      errorMessage = '';
    });
  }

  setLogoutState() async{
    await AuthService.instance.logout();
    setState(() {
      isProgressing = false;
      isLoggedIn = false;
      errorMessage = '';
      name = '';
    });
  }

  Future<void> loginAction() async {
    setLoadingState();
    final message = await AuthService.instance.login();
    if (message == 'Success') {
      setSuccessAuthState();
    } else {
      setState(() {
        isProgressing = false;
        errorMessage = message;
      });
    }
  }

  initAction() async {
    setLoadingState();
    final bool isAuth = await AuthService.instance.init();
    if (isAuth) {
      setSuccessAuthState();
    } else {
      setState(() {
        isProgressing = false;
      });
    }
  }
}

class BottomNavBarWidget extends StatefulWidget {
  const BottomNavBarWidget({Key? key}) : super(key: key);

  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  int _selectedIndex = 0;
  List<Widget> pageList = [
    const Homepage(),
    GolfPage(),
    const GamingPage(),
    const EventPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:pageList.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.golf_course),
            label: 'Golf',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.control_camera),
            label: 'Gaming',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.event),
            label: 'Evenements',
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: (index){
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
