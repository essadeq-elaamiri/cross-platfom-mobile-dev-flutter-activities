import 'package:enset_chat_app/bloc/contactBloc/contact_bloc.dart';
import 'package:enset_chat_app/models/contacr_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactPage extends StatelessWidget {
  GroupType selectedGroupType = GroupType.none;

  @override
  Widget build(BuildContext context) {
    // list at initial state
    BlocProvider.of<ContactBloc>(context)
        .add(loadContactsByGroupEvent(group: selectedGroupType));
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<ContactBloc, ContactState>(
          builder: (context, state) {
            return Text("Contacts");
          },
        ),
      ),
      body: Container(
          child: Column(
        children: [
          Expanded(
            child: BlocBuilder<ContactBloc, ContactState>(
              bloc: context.read<ContactBloc>(),
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
                        state.erroMessage ?? "Error: no description provided",
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
                            BlocProvider.of<ContactBloc>(context)
                                .add(state.lastEvent);
                          },
                          icon: Icon(
                            Icons.replay_outlined,
                            color: Colors.white,
                          ),
                          label: Text(
                            "Reload",
                            style: TextStyle(color: Colors.white),
                          ))
                    ],
                  ));
                }
                return ListView.builder(
                  itemCount: state.contastsList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                            child: Text(state.contastsList[index].name?[0] ??
                                "no name")),
                        title:
                            Text(state.contastsList[index].name ?? "no name"),
                      ),
                      margin: EdgeInsets.all(5.0),
                    );
                  },
                );
              },
            ),
          ),
        ],
      )),
      bottomNavigationBar: BlocBuilder<ContactBloc, ContactState>(
        builder: (context, state) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: selectedGroupType.index,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.group), label: "All"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled), label: "Personal"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.work), label: "Professional"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.outdoor_grill_sharp), label: "Other"),
            ],
            onTap: (int index) {
              //context.read<ContactBloc>()
              selectedGroupType = GroupType.values[index];
              BlocProvider.of<ContactBloc>(context)
                  .add(loadContactsByGroupEvent(group: selectedGroupType));

              //print(GroupType.values[index]);
            },
          );
        },
      ),
    );
  }
}
