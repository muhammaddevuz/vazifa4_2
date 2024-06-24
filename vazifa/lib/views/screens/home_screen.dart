import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isCheck = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isCheck ? Colors.blue[900] : Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Animation"),
        centerTitle: true,
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: isCheck ? Colors.blue : Colors.grey,
          ),
          width: 200,
          height: 100,
          child: InkWell(
            onTap: () {
              setState(() {
                isCheck = !isCheck;
              });
            },
            child: Stack(
              children: [
                AnimatedAlign(
                  alignment:
                      isCheck ? Alignment.centerLeft : Alignment.centerRight,
                  duration: Duration(seconds: 1),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.airplanemode_on_outlined,
                        size: 40,
                        color: isCheck ? Colors.blue : Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
