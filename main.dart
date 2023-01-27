import 'package:flutter/material.dart';
import 'offer.dart';
import 'willhaben_api.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Offer> _offers = [];

  @override
  void initState() {
    super.initState();
    WillhabenAPI().fetchData().then((offers) {
      setState(() {
        _offers = offers;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Listings on Willhaben'),
      ),
      body: ListView.builder(
        itemCount: _offers.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_offers[index].title),
            leading: Image.network(_offers[index].imageUrl),
          );
        },
      ),
    );
  }
}
