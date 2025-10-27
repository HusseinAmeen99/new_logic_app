import 'package:flutter/material.dart';

// 1. Convert the class to a StatefulWidget
class MultiSelection extends StatefulWidget {
  MultiSelection({super.key});

  @override
  // Create the state object
  State<MultiSelection> createState() => _MultiSelectionState();
}

// 2. Create a separate State class
class _MultiSelectionState extends State<MultiSelection> {
  // 3. Move your state variables (lists, sets, etc.) into the State class
  final List<String> chooses = [
    'Life',
    'Travel',
    'images',
    'Food',
    'Music',
    'Sports',
    'Football',
    'Entertainment',
    'Love',
    'Friends',
    'Family',

    // You have duplicate 'Love' and 'Friends', which a Set will handle, but it's good to clean up
  ];
  // This set will now correctly hold the state
  final Set<String> whatYouChoses = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const SizedBox(height: 110),
          const Center(
            child: Text(
              'What do you want to see on Pinterest ? ',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            runSpacing: 15,
            spacing: 20, // Added spacing for better layout
            alignment: WrapAlignment.center, // Center the items
            children: List.generate(chooses.length, (index) {
              final type = chooses[index];
              final isSelected = whatYouChoses.contains(type);
              return GestureDetector(
                onTap: () {
                  // 4. Call setState() to notify Flutter that the UI needs to be rebuilt
                  setState(() {
                    if (isSelected) {
                      whatYouChoses.remove(type);
                    } else {
                      whatYouChoses.add(type);
                    }
                  });
                },
                child: Stack(
                  children: [
                    AnimatedContainer(
                duration:Duration(milliseconds: 300),
                      //curve: Curves.bounceIn,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      // margin removed to rely on Wrap's spacing
                      decoration: BoxDecoration(
                        // 5. Change color based on selection state
                        color: isSelected ? Colors.red : Colors.grey.shade700,
                        borderRadius: BorderRadius.circular(
                          15,
                        ), // Made it more rounded
                      ),
                      child: Text(
                        type,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Positioned(
                      right: -1,
                      //bottom: 0,
                      top: -1,
                      child: Icon(
                        Icons.check_circle,
                        size: 15,
                        color: isSelected ? Colors.white : Colors.transparent,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
          const SizedBox(height: 20),
          // This part of your code was also problematic.
          // You were trying to map over the set and return a list of widgets inside another list.
          // Corrected to display the selected items clearly.
          Column(
            spacing: 8.0,
            children:
                whatYouChoses.map((v) {
                  return Text(v, style: TextStyle(color: Colors.white));
                }).toList(),
          ),
        ],
      ),
    );
  }
}
