import 'package:flutter/material.dart';
import 'package:myown/model/user_model.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';

class UserDetailPage extends StatefulWidget {
  final UserModel? user;
  UserDetailPage({this.user});

  @override
  State<UserDetailPage> createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  @override
  Widget build(BuildContext context) {


  Widget header(){
    return Column(
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 20,
              left: 15,
              right: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () async{
                    await Provider.of<UserProvider>(context, listen: false).getUsers();
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.chevron_left,
                  ),
                ),
              ],
            ),
          )
        ]);
  }

 Widget content(){
   return Column(children: [
     const SizedBox(height: 50),
     Text('id : ${widget.user!.id}'),
     Text('email : ${widget.user!.email}'),
     Text('nama awal : ${widget.user!.firstName}'),
     Text('nama awal : ${widget.user!.lastName}')
   ],);
 }

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          header(),
          content(),
          const SizedBox(height: 20),
        ],
      )
    );
  }
}