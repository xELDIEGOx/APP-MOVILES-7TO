// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:listview_s9/model/backend.dart';
import 'package:listview_s9/model/email.dart';

class DetailScreen extends StatelessWidget {
  final Email email;

  const DetailScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    // Marcar como leído al abrir la pantalla de detalle
    Backend().markEmailAsRead(email.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(email.subject),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'From: ${email.from}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            Divider(
              color: Colors.grey, // Color de la línea de separación
              thickness: 1.0, // Grosor de la línea de separación
              height: 32, // Altura de la línea de separación
            ),

            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        email.subject,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        email.dateTime.toString(),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey, // Establece el color a gris
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Divider(
              color: Colors.grey, // Color de la línea de separación
              thickness: 1.0, // Grosor de la línea de separación
              height: 32, // Altura de la línea de separación
            ),

            Text(
              email.body,
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.justify, // Justifica el texto del body
            ),
          ],
        ),
      ),
    );
  }
}