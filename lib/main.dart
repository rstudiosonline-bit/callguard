import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(CallGuardApp());

class CallGuardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CallGuard',
      theme: ThemeData(primarySwatch: Colors.blue, scaffoldBackgroundColor: Color(0xFFF8F9FA)),
      home: ConsentCheck(),
    );
  }
}

class ConsentCheck extends StatefulWidget {
  @override
  _ConsentCheckState createState() => _ConsentCheckState();
}

class _ConsentCheckState extends State<ConsentCheck> {
  bool? hasConsented;
  
  void initState() {
    super.initState();
    checkConsent();
  }
  
  checkConsent() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() => hasConsented = prefs.getBool('popia_consent') ?? false);
  }

  @override
  Widget build(BuildContext context) {
    if (hasConsented == null) return Scaffold(body: Center(child: CircularProgressIndicator()));
    return hasConsented! ? HomeScreen() : ConsentScreen();
  }
}

class ConsentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(Icons.shield, size: 80, color: Color(0xFF0A3D62)),
          SizedBox(height: 24),
          Text('Welcome to CallGuard', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          Text('POPIA COMPLIANT • PRIVACY FIRST', style: TextStyle(color: Color(0xFF0A3D62), fontWeight: FontWeight.bold)),
          SizedBox(height: 24),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(color: Colors.blue[50], borderRadius: BorderRadius.circular(12)),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Prominent Disclosure (Required by Google Play):', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text('CallGuard needs access to your call history (READ_CALL_LOG) to identify potential spam calls and show your call history.'),
              SizedBox(height: 8),
              Text('Core Principle: All processing is 100% on-device. We do NOT collect, store, transmit, upload, or share your contacts, call logs, or phone numbers to any server, cloud, or third party.'),
              SizedBox(height: 8),
              Text('Your data stays on your phone. Uninstall deletes everything.', style: TextStyle(fontWeight: FontWeight.bold)),
            ]),
          ),
          SizedBox(height: 24),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF0A3D62), padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16)),
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              await prefs.setBool('popia_consent', true);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen()));
            },
            child: Text('I Understand & Consent (POPIA Sec 11)'),
          ),
          TextButton(onPressed: (){}, child: Text('View Privacy Policy')),
        ]),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CallGuard — POPIA Compliant'), backgroundColor: Color(0xFF0A3D62)),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Card(color: Colors.orange[50], child: ListTile(
            leading: Icon(Icons.report, color: Colors.orange),
            title: Text('Reported as Potential Spam — Score 94/100'),
            subtitle: Text('412 community reports — Durban, KZN — Just now'),
            trailing: ElevatedButton(onPressed: (){}, child: Text('BLOCK')),
          )),
          SizedBox(height: 16),
          ListTile(title: Text('Live Feed — Local Reports'), subtitle: Text('Potential spam +27 87... — Reported by user')),
          ListTile(title: Text('Potential Fraud +27 11...'), subtitle: Text('Blocked 2 mins ago — Johannesburg')),
          SizedBox(height: 24),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(border: Border.all(color: Color(0xFF0A3D62)), borderRadius: BorderRadius.circular(12)),
            child: Column(children: [
              Text('PRIVACY-FIRST PROTECTION', style: TextStyle(color: Color(0xFF0A3D62), fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Processing:'), Text('On-device only', style: TextStyle(color: Colors.green))]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Battery use:'), Text('<2% — optimized', style: TextStyle(color: Colors.green))]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Data upload:'), Text('None — POPIA compliant', style: TextStyle(color: Colors.green))]),
            ]),
          ),
          SizedBox(height: 24),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF0A3D62), padding: EdgeInsets.all(16)),
            onPressed: (){},
            child: Text('Activate Protection (On-Device)', style: TextStyle(fontSize: 18)),
          ),
          SizedBox(height: 16),
          Text('Disclaimer: Identification uses on-device lists and community reports. Accuracy may vary. Not affiliated with any other caller ID provider.', style: TextStyle(fontSize: 11, color: Colors.grey)),
        ],
      ),
    );
  }
}
