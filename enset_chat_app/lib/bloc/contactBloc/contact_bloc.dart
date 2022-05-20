import 'package:enset_chat_app/repositories/contact_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../models/contacr_model.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactRepository contactRepository;
  ContactBloc(ContactState contactState, this.contactRepository)
      : super(contactState) {
    on<ContactEvent>((event, emit) async {
      if (event is loadContactsByGroupEvent) {
        //print(event.group);
        if ((event).group == GroupType.none) {
          emit(ContactState(
              contastsList: [],
              requestState: RequestState.loading,
              lastEvent: event));

          List<Contact> contactsList =
              await contactRepository.getAllContatcts();
          emit(ContactState(
              contastsList: contactsList,
              requestState: RequestState.loaded,
              lastEvent: event));
        } else {
          emit(ContactState(
              contastsList: [],
              requestState: RequestState.loading,
              lastEvent: event));

          try {
            List<Contact> contactsList = await contactRepository
                .getContatctsByGroup(group: (event).group);
            //print("getContatctsByGroup bloc : ${contactsList.isEmpty}");
            //print("getContatctsByGroup bloc : ${contactsList}");

            emit(ContactState(
                contastsList: contactsList,
                requestState: RequestState.loaded,
                lastEvent: event));
          } catch (e) {
            emit(ContactState(
                contastsList: [],
                requestState: RequestState.error,
                lastEvent: event,
                erroMessage: e.toString()));
          }
        }
      }
    });
  }
}
