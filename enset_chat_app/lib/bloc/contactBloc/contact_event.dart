part of 'contact_bloc.dart';

@immutable
abstract class ContactEvent {}

class loadContactsByGroupEvent extends ContactEvent {
  GroupType group;
  loadContactsByGroupEvent({required this.group});
}
