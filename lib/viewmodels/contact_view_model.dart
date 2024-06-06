import 'package:flutter/material.dart';
import 'package:uyishi/services/db_services.dart';
import '../models/contact.dart';


class ContactViewModel extends ChangeNotifier {
  List<Contact> _contacts = [];
  final DbService _dbService = DbService();

  List<Contact> get contacts => _contacts;

  ContactViewModel() {
    _loadContacts();
  }

  Future<void> _loadContacts() async {
    _contacts = await _dbService.getContacts();
    notifyListeners();
  }

  Future<void> addContact(Contact contact) async {
    await _dbService.insertContact(contact);
    _loadContacts();
  }

  Future<void> updateContact(Contact contact) async {
    await _dbService.updateContact(contact);
    _loadContacts();
  }

  Future<void> deleteContact(int id) async {
    await _dbService.deleteContact(id);
    _loadContacts();
  }
}
