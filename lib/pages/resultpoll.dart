import 'package:flutter/material.dart';

class result extends StatefulWidget {
  const result({Key? key}) : super(key: key);

  @override
  _resultState createState() => _resultState();
}

class _resultState extends State<result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: const DecorationImage(
            image: const AssetImage("assets/images/bg.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset("assets/images/vote_hand.png",height: 80.0,),
                  ],
                ),
              ),
              Column(children: [


              ],),


            ],
          ),
        ),
      ),
    );
  }
}
