import 'package:amazon_clone/providers/user_detail_provider.dart';
import 'package:amazon_clone/screens/sell_screen.dart';
import 'package:amazon_clone/screens/sign_in_screen.dart';
import 'package:amazon_clone/utils/color_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'layouts/screen_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
   await Firebase.initializeApp(options: const FirebaseOptions(
        apiKey: "AIzaSyB6xO4a-cGBhuqXP8f6IaGUWA7qaZjS63I",
        authDomain: "clo-71070.firebaseapp.com",
        projectId: "clo-71070",
        storageBucket: "clo-71070.appspot.com",
        messagingSenderId: "205621390779",
        appId: "1:205621390779:web:c2d9c917b4d993c0a6e89e"
    )
    );
  }else{
    await Firebase.initializeApp();
  }
  runApp(const AmazonClone());
}

class AmazonClone extends StatelessWidget {
  const AmazonClone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserDetailsProvider()),
      ],
      child: MaterialApp(
        title: 'Amazon Clone',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: backgroundColor,
        ),
        home:  StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, AsyncSnapshot<User?> user){
            if(user.connectionState == ConnectionState.waiting){
              return Center(child: const CircularProgressIndicator(color: Colors.orange,));
            }else if(user.hasData){

              return const ScreenLayout();
            }else{
              return const SignInScreen();
            }
          },
        )
      ),
    );
  }
}
