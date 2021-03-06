import 'package:flutter/material.dart';
import 'package:twilio_flutter/twilio_flutter.dart';

class MyHomeScreen extends StatefulWidget {
  MyHomeScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  TwilioFlutter twilioFlutter;

  @override
  void initState() {
    twilioFlutter = TwilioFlutter(
        accountSid: 'ACb7af7947140006bf4700b8858e9020ce',
        authToken: 'd802f8fc4997875a6918f38411adefe6',
        // twilioNumber: '+19285827312');
        twilioNumber: '+13078007167');

    super.initState();
  }

  void sendSms() async {
    twilioFlutter.sendSMS(
        toNumber: ' +94778695902', messageBody: 'Hii everyone this is a demo of\nflutter twilio sms. chamod');
  }

  void getSms() async {
    var data = await twilioFlutter.getSmsList();
    print(data);

    await twilioFlutter.getSMS('***************************');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Press the button to send SMS.',
          style: TextStyle(
              color: Colors.black,
              fontSize: 16
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: sendSms,
        tooltip: 'Send Sms',
        child: Icon(Icons.send),
      ),
    );
  }
}