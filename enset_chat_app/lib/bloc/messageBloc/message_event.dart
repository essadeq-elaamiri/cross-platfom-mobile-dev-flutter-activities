part of 'message_bloc.dart';

@immutable
abstract class MessageEvent {}

class getAllMessagesEvent extends MessageEvent {}

class getConversationEvent extends MessageEvent {
  Contact sourceContact;
  Contact destinationContact;
  getConversationEvent(
      {required this.sourceContact, required this.destinationContact});
}

class sendMessageEvent extends MessageEvent {
  Contact sourceContact;
  Contact destinationContact;
  sendMessageEvent(
      {required this.sourceContact, required this.destinationContact});
}
