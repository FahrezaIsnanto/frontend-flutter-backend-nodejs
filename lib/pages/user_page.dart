import 'package:flutter/material.dart';
import 'package:myown/pages/user_detail_page.dart';
import 'package:myown/providers/user_provider.dart';
import 'package:provider/provider.dart';

class UserPage extends StatefulWidget {
  const UserPage({ Key? key }) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);

    Widget listUser() {
      return Container(
        margin: const EdgeInsets.only(top: 14),
        child: Column(
          children: userProvider.users
              .map(
                (user) => GestureDetector(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=> UserDetailPage(user: user)));
                },
                child: Container(
        width: 215,
        height: 278,
        margin: const EdgeInsets.only(
          top: 20,
          right: 15,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xffECEDEF),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Image.network(
              user.avatar,
              width: 215,
              height: 150,
              fit: BoxFit.cover,
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.firstName,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
              ),
              )
              .toList(),
        ),
      );
    }

    Widget tambahUserButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 30),
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/user_add');
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text(
            'Tambah User',
            style: TextStyle(fontSize: 16)
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("List User"),
      ),
      body: ListView(
        children: [
          tambahUserButton(),
          const SizedBox(height: 10),
          listUser(),
        ],
      )
    );
  }

}