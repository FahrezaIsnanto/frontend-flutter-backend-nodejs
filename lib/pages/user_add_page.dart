import 'package:flutter/material.dart';
import 'package:myown/pages/widgets/loading_button.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';

class UserAddPage extends StatefulWidget {
  const UserAddPage({ Key? key }) : super(key: key);

  @override
  State<UserAddPage> createState() => _UserAddPageState();
}

class _UserAddPageState extends State<UserAddPage> {
  @override
  Widget build(BuildContext context) {

    UserProvider userProvider = Provider.of<UserProvider>(context);

    TextEditingController emailController = TextEditingController(text: '');
    TextEditingController firstNameController = TextEditingController(text: '');
    TextEditingController lastNameController = TextEditingController(text: '');

    bool isLoading = false;

    handleAddUser() async {
      setState(() {
        isLoading = true;
      });

      if (await userProvider.addUser(
          email: emailController.text,
          firstName: firstNameController.text,
          lastName: lastNameController.text,)) {
        await Provider.of<UserProvider>(context, listen: false).getUsers();
        Navigator.pushNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              'Gagal Tambah user!',
              textAlign: TextAlign.center,
            ),
          ),
        );
      }

      setState(() {
        isLoading = false;
      });
    }
    
    Widget emailInput() {
      return Container(
        margin: const EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Email',
              style: TextStyle(fontSize: 16)
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              // ignore: prefer_const_constructors
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration.collapsed(
                            hintText: 'Email',
                          )),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

     Widget firstNameInput() {
      return Container(
        margin: const EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'First Name',
              style: TextStyle(fontSize: 16)
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              // ignore: prefer_const_constructors
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                          controller: firstNameController,
                          decoration: const InputDecoration.collapsed(
                            hintText: 'First Name',
                          )),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget lastNameInput() {
      return Container(
        margin: const EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Last Name',
              style: TextStyle(fontSize: 16)
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              // ignore: prefer_const_constructors
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                          controller: lastNameController,
                          decoration: const InputDecoration.collapsed(
                            hintText: 'Last Name',
                          )),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

     Widget tambahButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 30),
        child: TextButton(
          onPressed: () {
            handleAddUser();
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
        title: const Text("Tambah User"),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            emailInput(),
            firstNameInput(),
            lastNameInput(),
            isLoading ? const LoadingButton() : tambahButton(),
            const SizedBox(height: 20),
          ],
        ),
      )
    );
  }
}