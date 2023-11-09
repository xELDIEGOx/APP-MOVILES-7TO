// ignore_for_file: file_names, library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:listview_s9/model/backend.dart';
import 'package:listview_s9/model/email.dart';
import 'package:listview_s9/screens/DetailScreen.dart';
import 'package:listview_s9/widgets/EmailWidget.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key});

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<Email> emails = []; // Lista de emails

  @override
  void initState() {
    super.initState();
    // Obtener los emails al inicio
    emails = Backend().getEmails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight), // Tamaño del AppBar
      child: Center(
        child: AppBar(
          title: const Text('E-MAIL ULEAM FACCI'),
          centerTitle: true, // Centra el título del AppBar
        ),
      ),
    ),
      body: ListView.builder(
        itemCount: emails.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(emails[index].id.toString()),
            background: Container(
              color: Color.fromARGB(255, 124, 183, 211),
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20.0),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            onDismissed: (direction) {
              // Eliminar email al hacer swipe
              setState(() {
                Backend().deleteEmail(emails[index].id);
                emails.removeAt(index);
              });
            },
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(email: emails[index]),
                  ),
                );
              },
              onLongPress: () {
                setState(() {
                  Backend().markEmailAsRead(emails[index].id);
                  emails[index].read = true;
                });
              },
              child: EmailWidget(
                email: emails[index],
                onTap: () {
                  // Marcar como leído con tap
                  setState(() {
                    Backend().markEmailAsRead(emails[index].id);
                    emails[index].read = true;
                  });

                  // Navegar a la pantalla de detalle
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DetailScreen(email: emails[index]),
                    ),
                  );
                },
                onLongPress: () {
                  // Marcar como leído con Long Press
                  setState(() {
                    Backend().markEmailAsRead(emails[index].id);
                    emails[index].read = true;
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}