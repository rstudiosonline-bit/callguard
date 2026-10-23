
import 'package:flutter/material.dart';

void main() => runApp(CallGuardApp());

class CallGuardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CallGuard Pro',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF0A0E1A),
        primaryColor: Color(0xFF00D4FF),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CallGuard Pro'), backgroundColor: Color(0xFF00D4FF)),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Card(color: Colors.red[900], child: ListTile(
            leading: Icon(Icons.warning, color: Colors.white, size: 40),
            title: Text('Nedbank SCAM - Score 94/100', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            subtitle: Text('412 reports - Durban KZN - Just now', style: TextStyle(color: Colors.white70)),
            trailing: ElevatedButton(onPressed: (){}, child: Text('BLOCK')),
          )),
          SizedBox(height: 16),
          Card(child: ListTile(title: Text('Live Feed - Every 2s'), subtitle: Text('Woolworths Scam +27 87... - AI voice clone'))),
          Card(child: ListTile(title: Text('FNB Fraud +27 11...'), subtitle: Text('Blocked 2 mins ago - Johannesburg'))),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(border: Border.all(color: Color(0xFF00D4FF)), borderRadius: BorderRadius.circular(12)),
            child: Column(children: [
              Text('FASTER THAN TRUECALLER', style: TextStyle(color: Color(0xFF00D4FF), fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Lookup speed:'), Text('0.08s vs 3.5s', style: TextStyle(color: Colors.green))]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Battery:'), Text('<2% vs 12%', style: TextStyle(color: Colors.green))]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Price:'), Text('R29.99 vs R149', style: TextStyle(color: Colors.green))]),
            ]),
          ),
          SizedBox(height: 24),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF00D4FF), padding: EdgeInsets.all(16)),
            onPressed: (){},
            child: Text('Activate Protection', style: TextStyle(fontSize: 18, color: Colors.black)),
          ),
        ],
      ),
    );
  }
}
