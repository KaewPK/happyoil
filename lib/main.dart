/*
*  main.dart
*  happyOil
*
*  Created by [Author].
*  Copyright © 2018 [Company]. All rights reserved.
    */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:happy_oil/iphone_xxs11_pro1_widget/iphone_xxs11_pro1_widget.dart';

//void main() => runApp(App());

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
  .then((_) {
    runApp(App());
  }
  );
} 

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IPhoneXXS11Pro1Widget(),
    );
  }
}