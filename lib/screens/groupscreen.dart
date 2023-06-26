import 'package:chat_hub/screens/creategroupscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GroupScreen extends StatefulWidget {
  const GroupScreen({super.key});
  static bool isvisible = true;
  @override
  State<GroupScreen> createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  @override
  void initState() {
    // GroupScreen.isvisible = true;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Groups",
                  style: GoogleFonts.poppins(
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
              ),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot<Object>>(
                  stream: FirebaseFirestore.instance
                      .collection("Groups")
                      .snapshots(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.data?.docs.isEmpty) {
                      return const Text("No Groups");
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      const CircularProgressIndicator();
                    }
                    return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Container());
                  }),
            ),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                      bottom: 16, // Adjust the bottom position as desired
                      right: 16, // Adjust the right position as desired
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: FloatingActionButton(
                          hoverColor: Colors.amber,
                          backgroundColor: Colors.green,
                          onPressed: () {
                            setState(() {});
                            // PanelState.OPEN;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const CreateGroup()));
                            // Add your logic here
                          },
                          child: const Icon(Icons.add),
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
