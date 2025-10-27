import 'package:flutter/material.dart';

class SingleSelection extends StatefulWidget {
  SingleSelection({super.key});

  @override
  State<SingleSelection> createState() => _SingleSelectionState();
}

class _SingleSelectionState extends State<SingleSelection> {
  List<Map> gifts = [
    {'name': 'LION', 'image': 'assets/animals/lion.png'},
    {'name': 'COW', 'image': 'assets/animals/cow.png'},
    {'name': 'DEER', 'image': 'assets/animals/deer.png'},
    {'name': 'GIRAFFE', 'image': 'assets/animals/giraffe.png'},
    {'name': 'PIGEONING', 'image': 'assets/animals/pingeon.png'},
    {'name': 'RAT', 'image': 'assets/animals/rat.png'},
    {'name': 'TIGER', 'image': 'assets/animals/tiger.png'},
    {'name': 'WHITE TIGER', 'image': 'assets/animals/white-tiger.png'},
    {'name': 'PARROT', 'image': 'assets/animals/parrot.png'},
    {'name': 'OWL', 'image': 'assets/animals/owl.png'},
    {'name': 'RABBIT', 'image': 'assets/animals/rabit.png'},
    {'name': 'MONKEY', 'image': 'assets/animals/monkey.png'},
  ];

  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    // --- Step 1: Get the screen width for responsive calculations ---
    final screenWidth = MediaQuery.of(context).size.width;

    // --- Step 2: Dynamically determine the number of columns ---
    // Use 2 columns for very narrow phones, otherwise use 3.
    final int crossAxisCount = screenWidth < 360 ? 2 : 3;

    // --- Step 3: Calculate a dynamic aspect ratio ---
    // This helps maintain a good shape for grid items on different screen sizes.
    // We adjust the item height based on the available width.
    final double itemHeight = 150; // A fixed desired height for the items
    final double itemWidth = screenWidth / crossAxisCount;
    final double childAspectRatio = itemWidth / itemHeight;

    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: const EdgeInsets.all(20.0), // Reduced padding slightly for smaller screens
        child: GridView.builder(
          itemCount: gifts.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount, // Using the dynamic value
              mainAxisSpacing: 20, // Adjusted spacing
              crossAxisSpacing: 5, // Adjusted spacing
              childAspectRatio: childAspectRatio // Using the dynamic aspect ratio
          ),
          itemBuilder: (context, index) {
            final bool isSelected = selectedIndex == index;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Stack(
                alignment: Alignment.center, // Center the stack children
                children: [
                  // This is a cleaner way to show/hide the background gradient
                  if (isSelected)
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(colors: [
                              Colors.black12,
                              Colors.black87,
                            ])),
                      ),
                    ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center, // Center the column content
                    children: [
                      // --- Step 4: Make the image responsive ---
                      Image.asset(
                        gifts[index]['image'],
                        // Let the GridView's constraints define the width. Do NOT use a fixed width.
                        height: isSelected ? 100 : 80, // Dynamic height on selection
                        fit: BoxFit.contain, // Ensures the image fits without being distorted
                      ),
                      const SizedBox(height: 8), // Add some space
                      if (!isSelected)
                      // --- Step 5: Prevent text from overflowing ---
                        FittedBox(
                          // Shrinks the text to fit if there isn't enough space
                          child: Text(
                            gifts[index]['name'],
                            style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                    ],
                  ),
                  if (isSelected)
                    Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: Container(
                        height: 30, // Give the button a defined height
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.pink,
                        ),
                        child: Center(
                            child: Text(
                              'Send',
                              style: TextStyle(color: Colors.white, fontSize: 15),
                            )),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
