import 'package:flutter/material.dart';

class PostFlightPage extends StatelessWidget {
  const PostFlightPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Simulated list of flights
    final List<Map<String, dynamic>> pastFlights = List.generate(10, (index) {
      final bool isDownloaded =
          index % 3 != 0; // Random logic: every third is not downloaded
      return {
        'name': 'Flight ${index + 1}',
        'timestamp': '2024-05-${(index + 1).toString().padLeft(2, '0')} 14:00',
        'summary': 'Peak Alt: ${1200 + index * 50}m, Duration: ${35 + index}s',
        'downloaded': isDownloaded,
      };
    });

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Past Flights',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.separated(
              itemCount: pastFlights.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final flight = pastFlights[index];
                final bool downloaded = flight['downloaded'] as bool;

                return Card(
                  elevation: 2,
                  child: ListTile(
                    title: Text(flight['name']),
                    subtitle: Text(
                      '${flight['timestamp']}  •  ${flight['summary']}',
                    ),
                    trailing: ElevatedButton.icon(
                      icon: Icon(
                        downloaded ? Icons.play_arrow : Icons.download,
                      ),
                      label: Text(downloaded ? 'Load' : 'Download'),
                      onPressed: () {
                        final action = downloaded ? 'Loaded' : 'Downloading';
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('$action ${flight['name']}')),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
