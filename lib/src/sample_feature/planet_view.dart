import 'package:flutter/material.dart';

import '../settings/settings_view.dart';

class PlanetView extends StatelessWidget {
  const PlanetView({
    super.key,
    required this.name,
  });

  static const routeName = '/planet/';

  final String name;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          title: Text(name),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.restorablePushNamed(context, SettingsView.routeName);
              },
            ),
          ],
        ),
        floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 18),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.red,
                    side: BorderSide(color: Colors.white, width: 1),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                  onPressed: () {},
                  child: Container(
                    width: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Despeguemos!'),
                        Icon(Icons.rocket_launch),
                      ],
                    ),
                  )),
              Padding(padding: EdgeInsets.only(bottom: 8)),
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 18),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.red,
                    side: BorderSide(color: Colors.white, width: 1),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                  onPressed: () {},
                  child: Container(
                    width: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Lugares!'),
                        Icon(Icons.rocket_launch),
                      ],
                    ),
                  )),
            ]),
        body: Stack(
          children: [
            Container(
              color: Colors.red,
              width: width,
              height: height,
              child: Image.asset(
                  "assets/images/planets/mars/markerbandvalley.jpg",
                  fit: BoxFit.cover),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                width: width > height ? width / 7 : width / 5,
                height: width < height ? width / 5 : width / 7,
                child: Image.asset(
                  'assets/images/speaker.jpeg',
                  fit: BoxFit.cover,
                )),
            Container(
                width: width * 0.4,
                height: height * 0.5,
                margin: const EdgeInsets.only(top: 20, left: 20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color.fromARGB(169, 88, 165, 123),
                ),
                child: const SelectableText('Planet Description')),
            Positioned(
              right: width * 0.01,
              child: Container(
                  width: width * 0.2,
                  height: height * 0.5,
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color.fromARGB(169, 88, 165, 123),
                  ),
                  child: const SelectableText('Vestiment info')),
            ),
          ],
        ));
  }
}
