import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToggleSelection extends StatefulWidget {
  const ToggleSelection({super.key});

  @override
  State<ToggleSelection> createState() => _ToggleSelectionState();
}

class _ToggleSelectionState extends State<ToggleSelection> {
  bool IsFollow=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        //height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.indigo,
            Colors.indigoAccent,
          ]),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: Center(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                SizedBox(height: 85,),
                CircleAvatar(
                      radius: 95,
                    backgroundImage: AssetImage('assets/sonic.png'),
                    ),
                Positioned(
                    bottom: -20,
                    right: 0,
                    left: 0,
                    child:
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          IsFollow=!IsFollow;
                        });
                      },
                      child: CircleAvatar(
                        child:  Icon(IsFollow? Icons.add:Icons.access_time_filled)),
                    )
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
