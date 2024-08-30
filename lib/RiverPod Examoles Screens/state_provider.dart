import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// StateNotifier to manage team names
class TeamNotifier extends StateNotifier<List<String>> {
  TeamNotifier() : super(['Team 1', 'Team 2']);

  void updateTeamName(int index, String name) {
    state = [...state]..[index] = name;
  }

  void resetTeamNames() {
    state = ['Team 1', 'Team 2'];
  }
}

// Providers for counters
final counterProvider1 = StateProvider<int>((ref) => 0);
final counterProvider2 = StateProvider<int>((ref) => 0);

// Provider for team names
final teamProvider =
    StateNotifierProvider<TeamNotifier, List<String>>((ref) => TeamNotifier());

class MyStateProvider extends ConsumerWidget {
  const MyStateProvider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int data1 = ref.watch(counterProvider1);
    int data2 = ref.watch(counterProvider2);
    List<String> teamNames = ref.watch(teamProvider);

    // Getting screen size using MediaQuery
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Container(
            height: screenSize.height,
            width: screenSize.width,
            child: Column(
              children: [
                Container(
                  height: screenSize.height * 0.7,
                  width: screenSize.width,
                  child: Image.asset(
                    "images/bs1.png",
                    fit: BoxFit.fill,
                    filterQuality: FilterQuality.high,
                    height: screenSize.height,
                    width: screenSize.width,
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: screenSize.height * 0.1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () => _editTeamName(context, ref, 0, teamNames[0]),
                    child: Container(
                      height: screenSize.height * 0.08,
                      width: screenSize.width * 0.4,
                      child: Center(
                        child: Text(
                          teamNames[0],
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _editTeamName(context, ref, 1, teamNames[1]),
                    child: Container(
                      height: screenSize.height * 0.08,
                      width: screenSize.width * 0.4,
                      child: Center(
                        child: Text(
                          teamNames[1],
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 133, 12, 105)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenSize.height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: screenSize.height * 0.25,
                    width: screenSize.width * 0.4,
                    child: Center(
                      child: Card(
                        child: Text(
                          data2.toString(),
                          style: const TextStyle(
                              fontSize: 70,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 19, 19, 19)),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: screenSize.height * 0.25,
                    width: screenSize.width * 0.4,
                    child: Center(
                      child: Card(
                        child: Text(
                          data1.toString(),
                          style: const TextStyle(
                              fontSize: 70,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 150, 5, 97)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenSize.height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      ref.read(counterProvider2.notifier).state++;
                    },
                    child: Container(
                      height: screenSize.height * 0.18,
                      width: screenSize.width * 0.25,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset("images/ball1.png"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      ref.read(counterProvider1.notifier).state++;
                    },
                    child: Container(
                      height: screenSize.height * 0.18,
                      width: screenSize.width * 0.25,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset("images/ball2.png"),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  ref.read(counterProvider1.notifier).state = 0;
                  ref.read(counterProvider2.notifier).state = 0;
                  ref.read(teamProvider.notifier).resetTeamNames();
                },
                child: const Text('Reset'),
              ),
              SizedBox(height: screenSize.height * 0.02),
            ],
          ),
        ],
      ),
    );
  }

  // Function to display a dialog to edit team names
  void _editTeamName(
      BuildContext context, WidgetRef ref, int index, String currentName) {
    TextEditingController controller = TextEditingController(text: currentName);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit ${index == 0 ? 'Team 1' : 'Team 2'} Name'),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: 'Enter new name'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                ref
                    .read(teamProvider.notifier)
                    .updateTeamName(index, controller.text);
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
