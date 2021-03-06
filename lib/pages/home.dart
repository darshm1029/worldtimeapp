import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};
  @override
  Widget build(BuildContext context) {
    if (data.isNotEmpty) {
      data = data;
    } else {
      data = ModalRoute.of(context)?.settings?.arguments as Map;
    }
    print(data);

    String bgImage = (data as dynamic)['isDaytime'] ? 'day.png' : 'night.png';
    Color? bgColor = (data as dynamic)['isDaytime'] ? Colors.blue : Colors.indigo[700];
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () async {
                   dynamic result = await Navigator.pushNamed(context,'/location');
                   setState(() {
                     data = {
                       'time' : result['time'],
                       'location': result['location'],
                       'isDaytime': result['isDaytime'],
                       'flag': result['flag'],
                     };
                   });
                    },
                  icon: Icon(
                      Icons.edit_location,
                      color: Colors.grey[300],
                  ),
                  label: Text(
                      'Edit Location',
                    style: TextStyle(
                      color: Colors.grey[300],
                    ),
                  ),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                          (data as dynamic)['location'],
                          style: TextStyle(
                            fontSize: 28.0,
                            letterSpacing: 2.0,
                            color: Colors.white,
                          ),
                  ),
                ],  //<widget>[]
              ),
                SizedBox(height: 20.0),
                Text(
                    (data as dynamic)['time'],
                  style: const TextStyle(
                    fontSize: 66.0,
                    letterSpacing: 2.0,
                    color: Colors.white,
                  ),
                ),
            ],
          ),
      ),
        ),
    ));
  }
}
