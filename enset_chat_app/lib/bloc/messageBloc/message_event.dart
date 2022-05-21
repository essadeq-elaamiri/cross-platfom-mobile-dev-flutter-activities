part of 'message_bloc.dart';

@immutable
abstract class MessageEvent {}

class getAllMessagesEvent extends MessageEvent {}

class getConversationEvent extends MessageEvent {
  Contact senderContact;
  Contact recieverContact;
  getConversationEvent(
      {required this.senderContact, required this.recieverContact});
}

class sendMessageEvent extends MessageEvent {
  Contact senderContact;
  Contact recieverContact;
  sendMessageEvent(
      {required this.senderContact, required this.recieverContact});
}
