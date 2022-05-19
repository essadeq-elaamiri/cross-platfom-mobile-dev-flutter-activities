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
        if ((event).group == GroupType.none) {
          emit(ContactInitial(
              contastsList: [], requestState: RequestState.loading));

          List<Contact> contactsList =
              await contactRepository.getAllContatcts();
          emit(ContactInitial(
              contastsList: contactsList, requestState: RequestState.loaded));
        } else {
          emit(ContactInitial(
              contastsList: [], requestState: RequestState.loading));

          List<Contact> contactsList =
              await contactRepository.getContatctsByGroup(group: (event).group);
          emit(ContactInitial(
              contastsList: contactsList, requestState: RequestState.loaded));
        }
      }
    });
  }
}
