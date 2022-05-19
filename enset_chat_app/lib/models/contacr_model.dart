import 'package:enset_chat_app/repositories/contact_repository.dart';

class Contact {
  int? id;
  String? name;
  GroupType? group;
  String? profile;

  Contact(
      {required this.id,
      required this.name,
      required this.group,
      required this.profile});

  Contact.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    group = json['group'];
    profile = json['profile'];
  }
}
