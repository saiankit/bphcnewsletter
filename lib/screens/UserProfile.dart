import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Icon(Icons.arrow_back_ios),
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      children: [
                        Text(
                          "Hi username ,", //username is variable here
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Welcome to your profile",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 25),
                    child: CircleAvatar(
                      radius: 25,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: SvgPicture.asset(
                  'lib/imagesassets/male_avatar.svg',
                  height: 200.0,
                  width: 200.0,
                ),
              ),
              //branch editor rating number of blogs year clubs top articles social media acounts
              Padding(
                padding: const EdgeInsets.fromLTRB(70, 15, 70, 15),
                child: Container(
                  height: size.height * 0.5,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Branch',
                                style: TextStyle(fontWeight: FontWeight.w300),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                'branch', //this is variable
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                'Year',
                                style: TextStyle(fontWeight: FontWeight.w300),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                'year', //this variable
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                'BITS ID',
                                style: TextStyle(fontWeight: FontWeight.w300),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                'Id', //this is variable example for mat PS0361H
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      Column(
                        children: [
                          Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Clubs',
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                //we create List under this heading clubs
                                //it should show the clubs that users are in
                                child: Text(
                                  'WallStreet',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ), //a card like decorated widget should be designed
                              Container(
                                color: Colors.white,
                                height: 1,
                                width: size.width * 0.5,
                              ), //indication seprator that should be built into Ui
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Crux',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                color: Colors.white,
                                height: 1,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Crux',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.tealAccent,
                height: 50,
                child: Text('Complete Profile'),
              ),
              SizedBox(
                height: size.height * 0.1,
              )
            ],
          ),
        ],
      ),
    );
  }
}
