import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SimulationView extends ConsumerWidget {
  const SimulationView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1200),
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              TabBar(tabs: const [Tab(text: 'Configure'), Tab(text: 'Result')]),
              SizedBox(
                height: 400,
                child: TabBarView(
                  children: [
                    Container(
                      color: theme.colorScheme.surfaceContainerLow,
                      child: const Center(
                        child: Text('Simulate all the flights'),
                      ),
                    ),
                    // Fake Alt graph
                    Container(
                      color: theme.colorScheme.surfaceContainerLow,
                      child: const Center(
                        child: Text('📈 Numbers only go up'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
