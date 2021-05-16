import 'package:flutter/material.dart';
import 'Server.dart';
import 'Client.dart';

class Home extends StatefulWidget {
  @override
  createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _serverPort = TextEditingController(text: '4040');
  final _serverAddress = TextEditingController(text: '127.0.0.1:4040');

  @override
  build(context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 300,
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: TextField(
                      controller: _serverPort,
                      decoration: InputDecoration(hintText: 'Server IP-port'),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      child: Text('Start Recorder'),
                      onPressed: () =>
                          Navigator.push(context, MaterialPageRoute(builder: (_) => Server())),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: TextField(
                      controller: _serverAddress,
                      decoration: InputDecoration(hintText: 'Server IP-address'),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      child: Text('Start Camera'),
                      onPressed: () => Navigator.push(
                          context, MaterialPageRoute(builder: (_) => Client(_serverAddress.text))),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
