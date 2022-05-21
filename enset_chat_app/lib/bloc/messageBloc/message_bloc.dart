import 'package:bloc/bloc.dart';
import 'package:enset_chat_app/bloc/contactBloc/contact_bloc.dart';
import 'package:enset_chat_app/models/contacr_model.dart';
import 'package:enset_chat_app/models/message_model.dart';
import 'package:enset_chat_app/repositories/message_repository.dart';
import 'package:meta/meta.dart';

part 'message_event.dart';
part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  MessageRepository messageRepository;
  MessageBloc(MessageState initMessageState, this.messageRepository)
      : super(initMessageState) {
    on<MessageEvent>((event, emit) async {
      // TODO: implement event handler
      if (event is MessageEvent) {
        print("Messadesbloc:${event}");
        if (event is getConversationEvent) {
          print("Messadesbloc:${event.senderContact.name}");
          print("Messadesbloc:${event.recieverContact.name}");

          emit(MessageState(
              messagesList: [],
              requestState: RequestState.loading,
              lastEvent: event));

          List<Message> messages1 =
              await messageRepository.getCoversationMessages(
                  event.senderContact.id!, event.recieverContact.id!);
          List<Message> messages2 =
              await messageRepository.getCoversationMessages(
                  event.recieverContact.id!, event.senderContact.id!);
          messages1.addAll(messages2);
          emit(MessageState(
              messagesList: messages1,
              requestState: RequestState.loaded,
              lastEvent: event));

          try {} catch (e) {
            emit(MessageState(
                messagesList: [],
                requestState: RequestState.error,
                lastEvent: event,
                errorMessage: e.toString()));
          }
        }
      }
    });
  }
}
