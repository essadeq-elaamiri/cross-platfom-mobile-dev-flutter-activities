import 'dart:convert';

import 'package:enset_chat_app/bloc/messageBloc/message_bloc.dart';
import 'package:enset_chat_app/models/contacr_model.dart';
import 'package:enset_chat_app/repositories/message_repository.dart';
import 'package:enset_chat_app/ui/pages/conversation_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:enset_chat_app/bloc/contactBloc/contact_bloc.dart';
import 'package:enset_chat_app/repositories/contact_repository.dart';
import 'package:enset_chat_app/ui/pages/contact_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // lets conceder this is the user of the app account
  static Contact userContact = Contact.fromJson(json.decode(
      ' { "id": 1,"name": "Essadeq Elaamiri","group": "other","profile": "http://dummyimage.com/222x100.png/5fa2dd/ffffff"}'));

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => ContactBloc(
                  ContactState(
                      contastsList: [],
                      requestState: RequestState.none,
                      lastEvent:
                          loadContactsByGroupEvent(group: GroupType.none),
                      erroMessage: ""),
                  ContactRepository())),
          BlocProvider(
              create: (context) => MessageBloc(
                  MessageState(
                    messagesList: [],
                    requestState: RequestState.none,
                  ),
                  MessageRepository()))
        ],
        child: MaterialApp(
          theme: ThemeData(primarySwatch: Colors.orange),
          routes: {
            "/contacts": (context) => ContactPage(),
            "/conversation": (context) => ConversationPage(),
          },
          initialRoute: "/contacts",
        ));
  }
}
