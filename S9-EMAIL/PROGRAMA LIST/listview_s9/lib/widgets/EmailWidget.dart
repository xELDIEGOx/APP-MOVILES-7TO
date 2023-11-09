
// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:listview_s9/model/email.dart';

class EmailWidget extends StatelessWidget {
  final Email email;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  const EmailWidget({
    Key? key,
    required this.email,
    this.onTap,
    this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Text(
                  email.dateTime.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 4.0), // Añade espacio entre DateTime y from
                    Text(
                      email.from,
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 4.0), // Añade espacio entre from y subject
                    Text(
                      email.subject,
                      style: TextStyle(fontStyle: FontStyle.italic),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                leading: Container(
                  width: 36,
                  height: 36,
                  margin: EdgeInsets.only(right: 8.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: email.read ? Colors.white : Color.fromARGB(255, 13, 171, 199),
                  ),
                  child: Center(
                    child: Icon(
                      email.read ? Icons.mail : Icons.mail_outline,
                      color: email.read ? Colors.grey : Colors.white,
                    ),
                  ),
                ),
              ),
              Divider(
                color: Colors.grey,
                thickness: 1.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}