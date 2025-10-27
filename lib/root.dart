import 'package:flutter/material.dart';
import 'package:new_logic_app/one/multi_selection.dart';
import 'package:new_logic_app/one/toggle_selection.dart';
import 'package:new_logic_app/one/single_selection.dart';
import 'package:new_logic_app/one/Multi_image_select.dart';

class Root extends StatefulWidget {
   Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  PageController controller=PageController();

  List<Widget> Screens=[
   SingleSelection(),
    MultiImageSelect(),
    ToggleSelection(),
    MultiSelection(),
  ];

  int SelectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: Screens,
        onPageChanged: (value) {
        SelectedIndex=value;
},
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Container(
          width: 100,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                setState(() {
                  controller.jumpToPage(SelectedIndex-1);
                });
                },
                child: Container(
                  width: 80,
                  height: 44,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black)
                  ),
                  child: Icon(Icons.arrow_back),
                ),
              ),
              SizedBox(width: 20,),
              GestureDetector(
                onTap: (){
                  setState(() {
                    controller.jumpToPage(SelectedIndex+1);
                  });
                },
                child: Container(
                  width: 150,
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(color: Colors.black)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.arrow_forward,color: Colors.white,),
                      SizedBox(width: 10,),
                      Text('Next Page',style:TextStyle(color: Colors.white),),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
