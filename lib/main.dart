import 'package:flutter/material.dart';

const metro ='''MRT Line 6 is a  21.26km line extending from Uttara in the north to Kamalapur in the south. The line runs parallel to the Turag River in the west of Dhaka and curves as it moves south-east following the path of the Buriganga River.
The line will be a standard gauge track, including a total of 16 elevated stations crossing busy areas such as Pallabhi and Mirpur. The travel time from north to south Dhaka will be approximately 35 minutes.''';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('asset/met.jpg',
              fit: BoxFit.fill,
              ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Metro Rail',
                        style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Dhaka, Bangladesh',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      )
                    ],
                  ),
                  Spacer(),
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  Text(
                    '9.5',
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.call, color: Colors.blue),
                      Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text(
                          'CALL',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.near_me, color: Colors.blue),
                      Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text(
                          'ROUTE',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.share, color: Colors.blue),
                      Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text(
                          'SHARE',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(metro),
            ),
          ],
        ),
      ),
    );
  }
}