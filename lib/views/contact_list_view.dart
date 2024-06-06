import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uyishi/viewmodels/contact_view_model.dart';

import '../models/contact.dart';
import 'contact_detail_view.dart';

class ContactListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final contactViewModel = Provider.of<ContactViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: ListView.builder(
        itemCount: contactViewModel.contacts.length,
        itemBuilder: (context, index) {
          final contact = contactViewModel.contacts[index];
          return ListTile(
            title: Text(contact.name),
            subtitle: Text(contact.phoneNumber),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () => _editContact(context, contact),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => contactViewModel.deleteContact(contact.id!),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _addContact(context),
      ),
    );
  }

  void _addContact(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ContactDetailView()),
    );
  }

  void _editContact(BuildContext context, Contact contact) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ContactDetailView(contact: contact),
      ),
    );
  }
}
