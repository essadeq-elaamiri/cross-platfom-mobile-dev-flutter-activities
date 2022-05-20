part of 'message_bloc.dart';

class MessageState {
  // messages list
  // request status
  // errorMessages
  // lastEvent

  List<Message> messagesList;
  RequestState requestState;
  MessageEvent lastEvent;
  String? errorMessage;

  MessageState({required this.messagesList, required this.requestState,required this.lastEvent, this.errorMessage})

}
