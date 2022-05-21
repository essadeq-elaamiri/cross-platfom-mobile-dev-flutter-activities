import 'package:enset_chat_app/bloc/contactBloc/contact_bloc.dart';
import 'package:enset_chat_app/bloc/messageBloc/message_bloc.dart';
import 'package:enset_chat_app/ui/widgets/messageItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConversationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    return Scaffold(
      appBar: AppBar(
        title: Text("Messages"),
      ),
      body: BlocBuilder<MessageBloc, MessageState>(
        bloc: context.read<MessageBloc>(),
        builder: (context, state) {
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
            child: Expanded(
              child: ListView.builder(
                itemCount: state.messagesList.length,
                itemBuilder: (context, index) {
                  return MessageItem(
                      message: state.messagesList[index],
                      currentContact: arguments['clickedContact']);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
