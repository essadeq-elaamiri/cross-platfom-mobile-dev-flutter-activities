import 'package:bloc/bloc.dart';
import 'package:enset_chat_app/bloc/contactBloc/contact_bloc.dart';
import 'package:enset_chat_app/models/contacr_model.dart';
import 'package:enset_chat_app/models/message_model.dart';
import 'package:meta/meta.dart';

part 'message_event.dart';
part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  MessageBloc() : super(Mess()) {
    on<MessageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
