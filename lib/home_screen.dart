import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'StatusScreen.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({Key? key}) : super(key: key);



  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var fabIcon = Icons.message;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: Text('Whatsapp'),
            bottom: const TabBar(
              tabs: [
                Tab(
                  child: Icon(Icons.camera_alt),
                ),
                Tab(
                  child: Text('chats'),
                ),
                Tab(
                  child: Text('status'),
                ),
                Tab(child: Text('Calls')),
              ],
            ),
            actions: [
              Icon(Icons.search),
              SizedBox(
                width: 10,
              ),
              PopupMenuButton(
                  icon: Icon(Icons.more_vert_outlined),
                  itemBuilder: (context) => const [
                        PopupMenuItem(value: 1, child: Text('New Group')),
                        PopupMenuItem(value: 2, child: Text('Settings')),
                        PopupMenuItem(value: 3, child: Text('Logout')),
                      ]),
              SizedBox(
                width: 10,
              )
            ],
          ),
          body: TabBarView(
            children: [
              Icon(Icons.camera_alt),
              ListView.builder(itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://images.pexels.com/photos/1559486/pexels-photo-1559486.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
                  ),
                  title: Text("john wick"),
                  subtitle: Row(
                children: [
                Icon(index % 2  == 0 ? Icons.done :Icons.done_all , color: index % 2  == 0  ? Colors.grey : Colors.blue  , ),
                SizedBox(width: 5,),
                Text('where is my cat',
                style: Theme.of(context).textTheme.bodyText1,
                ),
                ],
                ),
                  trailing: Text('3:54PM'),
                );
              }),
              StatusScreen(),
              ListView.builder(itemBuilder: (context, index) {
                return ListTile(
                  leading: const CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://images.pexels.com/photos/1559486/pexels-photo-1559486.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
                  ),
                  title: Text("john wick"),
                  subtitle: Text(index / 2 == 0
                      ? 'you have missed audio call'
                      : 'call time is 12:23'),
                  trailing:
                      Icon(index / 2 == 0 ? Icons.phone : Icons.video_call),
                );
              })
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(fabIcon),
          ),
        ));
  }
}
