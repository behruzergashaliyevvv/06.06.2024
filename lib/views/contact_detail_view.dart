import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uyishi/viewmodels/contact_view_model.dart';
import '../models/contact.dart';


class ContactDetailView extends StatefulWidget {
  final Contact? contact;

  ContactDetailView({this.contact});

  @override
  _ContactDetailViewState createState() => _ContactDetailViewState();
}

class _ContactDetailViewState extends State<ContactDetailView> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _phoneNumber;

  @override
  Widget build(BuildContext context) {
    final contactViewModel = Provider.of<ContactViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.contact == null ? 'Add Contact' : 'Edit Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: widget.contact?.name ?? '',
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              TextFormField(
                initialValue: widget.contact?.phoneNumber ?? '',
                decoration: InputDecoration(labelText: 'Phone Number'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a phone number';
                  }
                  return null;
                },
                onSaved: (value) {
                  _phoneNumber = value!;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    if (widget.contact == null) {
                      contactViewModel.addContact(Contact(
                        name: _name,
                        phoneNumber: _phoneNumber,
                      ));
                    } else {
                      contactViewModel.updateContact(Contact(
                        id: widget.contact!.id,
                        name: _name,
                        phoneNumber: _phoneNumber,
                      ));
                    }
                    Navigator.pop(context);
                  }
                },
                child: Text(widget.contact == null ? 'Add' : 'Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
