import 'package:chat_hub/screens/groupscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({super.key});

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  @override
  void initState() {
    GroupScreen.isvisible = false;
    // TODO: implement initState
    super.initState();
  }

  final TextEditingController groupname = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(25)),
            side: BorderSide(color: Colors.green.withOpacity(0.6))),
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
        // automaticallyImplyLeading: false,
        title: Text(
          "Create Group",
          style: GoogleFonts.poppins(
              color: Colors.black, fontWeight: FontWeight.w600),
        ),

        leading: Row(
          children: [
            IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new,
                size: 20,
                color: Colors.green,
              ),
              onPressed: () {
                Navigator.pop(context);
                // print(sender_uniquename);
                // Handle menu button press here
              },
            ),
          ],
        ),
        leadingWidth: 100,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.grey.shade100,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Center(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Enter Group Name",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    // hintText: "Enter Group Name",
                    // focusColor: Colors.red,
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.5),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.green, width: 1.5)),
                    labelText: "Group Name",
                    suffixIcon: const Icon(Icons.person),
                    suffixIconColor: MaterialStateColor.resolveWith((states) =>
                        states.contains(MaterialState.focused)
                            ? Colors.green
                            : Colors.grey),
                    labelStyle: GoogleFonts.poppins(
                        color: Colors.green,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                  controller: groupname,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UsersList()));
                    },
                    child: const Text("Ok"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UsersList extends StatefulWidget {
  const UsersList({super.key});

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
