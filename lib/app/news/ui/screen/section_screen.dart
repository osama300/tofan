import 'package:flutter/material.dart';

class SectionScreen extends StatelessWidget {
  const SectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        body: Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: 'Tab 1'),
                Tab(text: 'Tab 2'),
                Tab(text: 'Tab 3'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // Content of Tab 1
                  Center(
                    child: Text('Tab 1 Content'),
                  ),

                  // Content of Tab 2
                  Center(
                    child: Text('Tab 2 Content'),
                  ),

                  // Content of Tab 3
                  Center(
                    child: Text('Tab 3 Content'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
