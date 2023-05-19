import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../components/buttons.dart';

class Dashboard extends StatefulWidget {
  @override
  _Dashboard createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> {
  late String _timeString;

  @override
  void initState() {
    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  void _getTime() {
    final String formattedDateTime = _formatDateTime(DateTime.now());
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('hh:mm a').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'images/logo.png',
          fit: BoxFit.contain,
          height: 60,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
          color: Colors.indigo,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Dashboard",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo)),
                Text(_timeString,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey)),
              ],
            ),
            SizedBox(height: 10), // Add a bit of space
            Buttons(name: 'Search', iconData: Icons.search),
            Buttons(
                name: 'Movements',
                iconData: Icons.shopping_cart_checkout_rounded),
            Buttons(name: 'Stock Take', iconData: Icons.assignment),
            SizedBox(height: 10), // Add a bit of space
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 3,
                    offset: Offset(3, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Table(
                columnWidths: {
                  0: FractionColumnWidth(.3),
                  1: FractionColumnWidth(.7),
                },
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                border: TableBorder.all(color: Colors.blue.shade100, width: 1),
                children: [
                  TableRow(
                    children: [
                      Container(
                        color: Colors.blue.shade50,
                        alignment: Alignment.center,
                        height: 50,
                        child: Text(
                          "TransVirtual#",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.shade900),
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        alignment: Alignment.centerLeft,
                        height: 50,
                        child: const Padding(
                          padding: EdgeInsets.only(left: 3),
                          child: Text("268239"),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Container(
                        color: Colors.blue.shade50,
                        alignment: Alignment.center,
                        height: 50,
                        child: Text(
                          "Company",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.shade900),
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        alignment: Alignment.centerLeft,
                        height: 50,
                        child: const Padding(
                          padding: EdgeInsets.only(left: 3),
                          child: Text("John Juggalos (AppDev)"),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Container(
                        color: Colors.blue.shade50,
                        alignment: Alignment.center,
                        height: 50,
                        child: Text(
                          "Warehouse",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.shade900),
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        alignment: Alignment.centerLeft,
                        height: 50,
                        child: const Padding(
                          padding: EdgeInsets.only(left: 3),
                          child: Text("Melbourne Warehouse"),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Container(
                        color: Colors.blue.shade50,
                        alignment: Alignment.center,
                        height: 50,
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.shade900),
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        alignment: Alignment.centerLeft,
                        height: 50,
                        child: const Padding(
                          padding: EdgeInsets.only(left: 3),
                          child: Text("sheik@appdev"),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Container(
                        color: Colors.blue.shade50,
                        alignment: Alignment.center,
                        height: 50,
                        child: Text(
                          "Status",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.shade900),
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        alignment: Alignment.centerLeft,
                        height: 50,
                        child: const Padding(
                          padding: EdgeInsets.only(left: 3),
                          child: Text("Connected via Wifi"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    // handle privacy link tap
                    print('Privacy link tapped');
                  },
                  child: const Text(
                    'Privacy',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.orange),
                  ),
                ),
                const SizedBox(
                    width: 10), 
                GestureDetector(
                  onTap: () {
                    // handle legal link tap
                    print('Legal link tapped');
                  },
                  child: const Text(
                    'Legal',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.orange),
                  ),
                ),
              ],
            ),
            const SizedBox(
                height:
                    15), 
            const Text(
              'Copyright © 2014-2023 Rapid Teks. All rights reserved.',
              style: TextStyle(fontSize: 15),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
