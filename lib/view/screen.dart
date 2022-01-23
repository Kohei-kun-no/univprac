import 'package:flutter/material.dart';
import 'package:flutter_unv_1/view/time_line/post_page.dart';
import 'package:flutter_unv_1/view/time_line/time_line_page.dart';
import 'account/account_page.dart';
import 'direct_message/direct_message_page.dart';

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  int selectedIndex = 0;
  List<Widget> pageList = [TimeLinePage(), DirectMessagePage(),AccountPage() ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(label: '', icon: Icon(Icons.home_outlined)),
          BottomNavigationBarItem(label: '', icon: Icon(Icons.alternate_email_sharp)),
          BottomNavigationBarItem(label: '', icon: Icon(Icons.perm_identity_outlined)),
        ],
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => PostPage()));
        },
        child: Icon(Icons.chat_bubble_outline),
      ),
    );
  }
}
