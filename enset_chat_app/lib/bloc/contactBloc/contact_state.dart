part of 'contact_bloc.dart';

enum RequestState { loaded, loading, error, none }

@immutable
abstract class ContactState {}

class ContactInitial extends ContactState {
  List<Contact> contastsList;
  RequestState requestState;
  String message;
}
