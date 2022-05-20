import 'package:enset_chat_app/bloc/contactBloc/contact_bloc.dart';
import 'package:enset_chat_app/repositories/contact_repository.dart';
import 'package:enset_chat_app/ui/pages/contact_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
                      erroMessage: ""),
                  ContactRepository()))
        ],
        child: MaterialApp(
          theme: ThemeData(primarySwatch: Colors.orange),
          routes: {
            "/contacts": (context) => ContactPage(),
          },
          initialRoute: "/contacts",
        ));
  }
}
