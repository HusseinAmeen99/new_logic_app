import 'package:flutter/material.dart';

class MultiImageSelect extends StatefulWidget {
  MultiImageSelect({super.key});

  @override
  State<MultiImageSelect> createState() => _MultiImageSelectState();
}

class _MultiImageSelectState extends State<MultiImageSelect> {
  List<String> laptops=[
    'assets/laptop/labtop1.png',
    'assets/laptop/labtop2.png',
    'assets/laptop/labtop3.png',
    'assets/laptop/labtop4.png',
  ];
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.pinkAccent,
            Colors.indigoAccent
          ]),
        ),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height:450,
              child: Image.asset(laptops[selectedIndex]),
            ),
            Center(
              child: Row(
                children: List.generate(laptops.length, (index) {
                  return GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedIndex=index;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: selectedIndex==index?Border.all(color: Colors.cyanAccent,width: 5) : Border.all(color: Colors.white)
                        ),
                        child: Image.asset(laptops[index],width: 85,)),
                  );
                },),
              ),
            )

          ],
        ),
      ),
    );
  }
}
