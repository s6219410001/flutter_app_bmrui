import 'package:flutter/material.dart';
import 'package:flutter_various_app/views/bmr_ui.dart';

main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BmrUI(),
      theme: ThemeData(
        fontFamily: 'Kanit',
      ),
    ),
  );
}