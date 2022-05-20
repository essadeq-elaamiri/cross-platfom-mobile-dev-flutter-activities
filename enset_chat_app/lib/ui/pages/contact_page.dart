import 'package:enset_chat_app/bloc/contactBloc/contact_bloc.dart';
import 'package:enset_chat_app/models/contacr_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactPage extends StatelessWidget {
  GroupType selectedGroupType = GroupType.none;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
      ),
      body: Container(
          child: Column(
        children: [
          Expanded(
            child: BlocBuilder<ContactBloc, ContactState>(
              bloc: context.read<ContactBloc>(),
              builder: (context, state) {
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
