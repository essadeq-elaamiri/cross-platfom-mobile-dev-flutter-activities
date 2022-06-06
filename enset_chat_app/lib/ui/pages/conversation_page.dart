import 'package:enset_chat_app/bloc/contactBloc/contact_bloc.dart';
import 'package:enset_chat_app/bloc/messageBloc/message_bloc.dart';
import 'package:enset_chat_app/main.dart';
import 'package:enset_chat_app/models/contacr_model.dart';
import 'package:enset_chat_app/ui/widgets/messageItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConversationPage extends StatelessWidget {
  TextEditingController sendMessageTextFieldController =
      new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    return Scaffold(
      appBar: AppBar(
        title: Text(
            "My messages with ${(arguments['clickedContact'] as Contact).name}"),
      ),
      body: BlocBuilder<MessageBloc, MessageState>(
        bloc: context.read<MessageBloc>(),
        builder: (context, state) {
          print(state.messagesList);
          if (state.requestState == RequestState.loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.requestState == RequestState.error) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 100,
                ),
                SizedBox(
                  height: 21,
                ),
                Text(
                  state.errorMessage ?? "Error: no description provided",
                  style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.normal,
                      fontSize: 23),
                ),
                SizedBox(
                  height: 21,
                ),
                ElevatedButton.icon(
                    onPressed: () {
                      // BlocProvider.of<getAllMessagesEvent>(context)
                      //     .add(state.lastEvent);
                      print("Exception");
                    },
                    icon: Icon(
                      Icons.replay_outlined,
                      color: Colors.white,
                    ),
                    label: Text(
                      "Reload Messages",
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ));
          }

          return Container(
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.messagesList.length,
                    itemBuilder: (context, index) {
                      // defin sender
                      String currentContact =
                          state.messagesList[index].sourceContactId ==
                                  (arguments['clickedContact'] as Contact).id
                              ? (arguments['clickedContact'] as Contact).name!
                              : MyApp.userContact.name! + " (ME)";

                      return MessageItem(
                          message: state.messagesList[index],
                          currentContactName: currentContact);
                    },
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                        child: TextField(
                      controller: sendMessageTextFieldController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          contentPadding: EdgeInsets.all(10)),
                    )),
                    IconButton(
                        onPressed: () {
                          // calling the send Message event and send the message
                          print("send clicked" +
                              sendMessageTextFieldController.text);
                        },
                        icon: Icon(Icons.send))
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
