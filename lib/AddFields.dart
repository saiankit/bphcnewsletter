import 'dart:async';
import 'dart:ui';
import 'package:bphcnewsletter/clubpass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:passcode_screen/circle.dart';
import 'package:passcode_screen/keyboard.dart';
import 'package:passcode_screen/passcode_screen.dart';

class Data {
  String club;
  bool isPasscodetrue;
  Data({this.club, this.isPasscodetrue});
}

class AddFields extends StatefulWidget {
  AddFields({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _AddFieldsState createState() => _AddFieldsState();
}

class _AddFieldsState extends State<AddFields> {
  final StreamController<bool> _verificationNotifier =
      StreamController<bool>.broadcast();

  bool isAuthenticated = false;
  var title;
  String _date = "Not set";
  String _time = "Not set";
  final data = Data(club: 'Not Set', isPasscodetrue: false);
  int iconnumber = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Fields"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: new EdgeInsets.fromLTRB(70, 30, 70, 15),
            child: TextField(
              decoration: new InputDecoration(
                border: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                ),
                hintText: 'title',
                hintStyle: new TextStyle(color: Colors.grey[800]),
                labelText: 'Title',
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[800])),
                contentPadding: EdgeInsets.all(5.0),
              ),
              onChanged: (val) {
                title = val;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(70, 15, 70, 15),
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    onPressed: () {
                      DatePicker.showDatePicker(context,
                          theme: DatePickerTheme(
                            containerHeight: 200.0,
                          ),
                          showTitleActions: true,
                          minTime: DateTime(2000, 1, 1),
                          maxTime: DateTime(2022, 12, 31), onConfirm: (date) {
                        print('confirm $date');
                        _date = '${date.year} - ${date.month} - ${date.day}';
                        setState(() {});
                      }, currentTime: DateTime.now(), locale: LocaleType.en);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.date_range,
                                      size: 15.0,
                                    ),
                                    Text(
                                      " $_date",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.0),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Text(
                            "  Change",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 10.0),
                          ),
                        ],
                      ),
                    ),
                    // color: Colors.white10,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    onPressed: () {
                      DatePicker.showTimePicker(context,
                          theme: DatePickerTheme(
                            containerHeight: 200.0,
                          ),
                          showTitleActions: true, onConfirm: (time) {
                        print('confirm $time');
                        _time =
                            '${time.hour} : ${time.minute} : ${time.second}';
                        setState(() {});
                      }, currentTime: DateTime.now(), locale: LocaleType.en);
                      setState(() {});
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.access_time,
                                      size: 15.0,
                                    ),
                                    Text(
                                      " $_time",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.0),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Text(
                            "Change",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 10.0),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(70, 0, 70, 15),
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              onPressed: () {
                _priorityModalBottomSheet(context);
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 200,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        iconreturn(data.club),
                        Text(
                          "${data.club}",
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 60,
                        ),
                        Text(
                          "Change",
                          style: TextStyle(
                              fontSize: 10.0, fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(70, 15, 70, 15),
            child: FractionallySizedBox(
              widthFactor: 0.60,
              child: RaisedButton(
                elevation: 4.0,
                child: Text("Create Issue"),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _priorityModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(
                      Icons.arrow_upward,
                      color: Colors.red[900],
                    ),
                    title: new Text('Crux'),
                    onTap: () {
                      Navigator.pop(context);
                      setState(() {
                        _showLockScreen(
                          context,
                          opaque: false,
                          cancelButton: Text(
                            'Cancel',
                            style: const TextStyle(
                                fontSize: 16, color: Colors.white),
                            semanticsLabel: 'Cancel',
                          ),
                        );
                        data.club = "Crux";
                      });
                    }),
                new ListTile(
                  leading: new Icon(
                    Icons.arrow_upward,
                    color: Colors.red,
                  ),
                  title: new Text('Velocity'),
                  onTap: () {
                    data.club = 'Velocity';
                    _showLockScreen(
                      context,
                      opaque: true,
                      cancelButton: Text(
                        'Cancel',
                        style:
                            const TextStyle(fontSize: 16, color: Colors.white),
                        semanticsLabel: 'Cancel',
                      ),
                    );
                  },
                ),
                new ListTile(
                  leading: new Icon(
                    Icons.arrow_upward,
                    color: Colors.yellow,
                  ),
                  title: new Text('Journal'),
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      data.club = "Journal";
                    });
                  },
                ),
                new ListTile(
                  leading: new Icon(
                    Icons.arrow_downward_rounded,
                    color: Colors.blueAccent,
                  ),
                  title: new Text('EA'),
                  onTap: () {
                    final bool ispasstrue =
                        _navigateAndDisplaySelection(context, ClubPass());
                    ispasstrue ? data.club = 'EA' : data.club = 'Notset';
                  },
                ),
                new ListTile(
                  leading: new Icon(
                    Icons.arrow_downward_rounded,
                    color: Colors.blue,
                  ),
                  title: new Text('Dove'),
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      data.club = "Dove";
                    });
                  },
                ),
              ],
            ),
          );
        });
  }

  _showLockScreen(BuildContext context,
      {bool opaque,
      CircleUIConfig circleUIConfig,
      KeyboardUIConfig keyboardUIConfig,
      Widget cancelButton,
      List<String> digits}) {
    Navigator.push(
        context,
        PageRouteBuilder(
          opaque: opaque,
          pageBuilder: (context, animation, secondaryAnimation) =>
              PasscodeScreen(
            title: Text(
              'Enter App Passcode',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 28),
            ),
            circleUIConfig: circleUIConfig,
            keyboardUIConfig: keyboardUIConfig,
            passwordEnteredCallback: _onPasscodeEntered,
            cancelButton: cancelButton,
            deleteButton: Text(
              'Delete',
              style: const TextStyle(fontSize: 16, color: Colors.white),
              semanticsLabel: 'Delete',
            ),
            shouldTriggerVerification: _verificationNotifier.stream,
            backgroundColor: Colors.black.withOpacity(0.8),
            cancelCallback: _onPasscodeCancelled,
            digits: digits,
            passwordDigits: 6,
            bottomWidget: _buildPasscodeRestoreButton(),
          ),
        ));
  }

  _onPasscodeEntered(String enteredPasscode) {
    bool isValid = storedPasscode == enteredPasscode;
    _verificationNotifier.add(isValid);
    if (isValid) {
      setState(() {
        this.isAuthenticated = isValid;
      });
    }
  }

  _onPasscodeCancelled() {
    Navigator.maybePop(context);
  }

  @override
  void dispose() {
    _verificationNotifier.close();
    super.dispose();
  }

  _buildPasscodeRestoreButton() => Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: const EdgeInsets.only(bottom: 10.0, top: 20.0),
          child: FlatButton(
            child: Text(
              "Reset passcode",
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w300),
            ),
            splashColor: Colors.white.withOpacity(0.4),
            highlightColor: Colors.white.withOpacity(0.2),
            onPressed: _resetAppPassword,
          ),
        ),
      );

  _resetAppPassword() {
    Navigator.maybePop(context).then((result) {
      if (!result) {
        return;
      }
      _showRestoreDialog(() {
        Navigator.maybePop(context);
        //TODO: Clear your stored passcode here
      });
    });
  }

  _showRestoreDialog(VoidCallback onAccepted) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Reset passcode",
            style: const TextStyle(color: Colors.black87),
          ),
          content: Text(
            "Passcode reset is a non-secure operation!\n\nConsider removing all user data if this action performed.",
            style: const TextStyle(color: Colors.black87),
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            FlatButton(
              child: Text(
                "Cancel",
                style: const TextStyle(fontSize: 18),
              ),
              onPressed: () {
                Navigator.maybePop(context);
              },
            ),
            FlatButton(
              child: Text(
                "I understand",
                style: const TextStyle(fontSize: 18),
              ),
              onPressed: onAccepted,
            ),
          ],
        );
      },
    );
  }

  _navigateAndDisplaySelection(BuildContext context, Widget page) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );

    // After the Selection Screen returns a result, hide any previous snackbars
    // and show the new result.
  }

  _secondPage(BuildContext context, Widget page) async {
    final dataFromSecondPage = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    ) as Data;
    // Here we have the data from the second screen
    data.club = dataFromSecondPage.club;
    data.isPasscodetrue = dataFromSecondPage.isPasscodetrue;
  }
}

Widget iconreturn(String text) {
  switch (text) {
    case 'Crux':
      return Icon(
        Icons.arrow_upward_rounded,
        color: Colors.red[900],
      );
      break;
    case 'Velocity':
      return Icon(
        Icons.arrow_upward_rounded,
        color: Colors.red,
      );
      break;
    case 'Journal':
      return Icon(
        Icons.arrow_upward_rounded,
        color: Colors.yellow,
      );
      break;
    case 'EA':
      return Icon(
        Icons.arrow_downward_rounded,
        color: Colors.blueAccent,
      );
      break;
    case 'Dove':
      return Icon(
        Icons.arrow_downward_rounded,
        color: Colors.blue,
      );
      break;

    case 'Not Set':
      return Icon(Icons.arrow_upward);
      break;
  }
}
