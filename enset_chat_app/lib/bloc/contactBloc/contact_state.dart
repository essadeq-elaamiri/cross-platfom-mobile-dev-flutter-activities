part of 'contact_bloc.dart';

enum RequestState { loaded, loading, error, none }

class ContactState {
  List<Contact> contastsList;
  RequestState requestState;
  ContactEvent lastEvent;
  String? erroMessage;
  ContactState(
      {required this.contastsList,
      required this.requestState,
      required this.lastEvent,
      this.erroMessage});
  @override
  List<Object> get props => [contastsList, requestState, erroMessage ?? ""];
}
/*
@immutable
abstract class ContactState {}

class ContactInitial extends ContactState {
  List<Contact> contastsList;
  RequestState requestState;
  String? erroMessage;
  ContactInitial(
      {required this.contastsList,
      required this.requestState,
      this.erroMessage});
  @override
  List<Object> get props => [contastsList, requestState, erroMessage ?? ""];
}
*/