import 'package:flutter/material.dart';
import 'package:proyect_polaris/src/model/iteneraio.dart';
import 'package:proyect_polaris/src/views/destinations_view.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  static const routeName = '/locations';

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  List<IteneraryModel> itenerarios = [];
  @override
  void initState() {
    super.initState();
    _getInicializaton();
  }

  void _getInicializaton() {
    itenerarios = IteneraryModel.getIteneraries();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Locations 🗺️'),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            print(itenerarios[0]);
            print(itenerarios.length);
            Navigator.pushReplacementNamed(context, DestinationsView.routeName);
          },
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 75, 37, 245),
      body: Column(
        children: [
          firstContainer(width),
          const SizedBox(
            height: 10,
          ),
          Padding(
              padding: const EdgeInsets.all(30),
              child: Center(
                child: Container(
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white),
                  height: 500,
                  child: Center(
                    child: ListView.separated(
                      itemCount: itenerarios.length,
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.all(30),
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 25),
                      itemBuilder: (context, index) {
                        return Center(
                          child: Container(
                              width: width / 4,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 248, 159, 159),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      itenerarios[index].name,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                  Container(
                                    width: 100, // Ancho del área interactiva
                                    height: 100, // Alto del área interactiva
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      image: DecorationImage(
                                        image: AssetImage(
                                            itenerarios[index].pathImage),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Text(
                                              'Schedule',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 231, 78, 67),
                                                fontSize: 40,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text(
                                              itenerarios[index].hours[0],
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 45, 93, 223)),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text(
                                                itenerarios[index].hours[1],
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 45, 93, 223))),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text(
                                              itenerarios[index].hours[2],
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 45, 93, 223)),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 35,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Text(
                                              'Places',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 41, 101, 231),
                                                fontSize: 35,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text(
                                              itenerarios[index].places[0],
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color:
                                                      Colors.deepPurple[900]),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text(
                                              itenerarios[index].places[1],
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color:
                                                      Colors.deepPurple[900]),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text(
                                              itenerarios[index].places[2],
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color:
                                                      Colors.deepPurple[900]),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 14),
                                    child: OutlinedButton(
                                        style: ElevatedButton.styleFrom(
                                            foregroundColor: Color.fromARGB(
                                                255, 17, 49, 231),
                                            textStyle: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 24)),
                                        onPressed: () {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                                  backgroundColor: Colors.black,
                                                  duration:
                                                      Duration(seconds: 1),
                                                  content: Center(
                                                      child: Text(
                                                    'Purchase Completed',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 26,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ))));
                                          Navigator.pushReplacementNamed(
                                              context,
                                              DestinationsView.routeName);
                                        },
                                        child: Text('Purchase ticket')),
                                  )
                                ],
                              )),
                        );
                      },
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }

  Container firstContainer(double width) {
    return Container(
      width: width,
      height: 300,
      decoration: const BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
            image: AssetImage('assets/images/planets/emptyback.png'),
            fit: BoxFit.cover),
      ),
      child: const Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Icon(
                Icons.rocket_launch_rounded,
                color: Colors.white,
                size: 150,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    '3 Days Trip',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontStyle: FontStyle.normal),
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 60),
                  child: Text(
                    'S p a c e',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    'T u r t l e 🐢',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
    print(itenerarios);
  }
}
