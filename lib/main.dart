import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uyishi/viewmodels/contact_view_model.dart';
import 'package:uyishi/views/contact_list_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ContactViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Contacts App',
        home: ContactListView(),
      ),
    );
  }
}
