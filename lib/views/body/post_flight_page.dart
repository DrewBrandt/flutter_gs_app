import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PostFlightPage extends StatefulWidget {
  const PostFlightPage({super.key});

  @override
  State<PostFlightPage> createState() => _PostFlightPageState();
}

class _PostFlightPageState extends State<PostFlightPage> {
  String selectedRemote = 'Flight Computer A';

  final List<String> remoteSources = [
    'Flight Computer A',
    'Flight Computer B',
    'Flight Computer C'
  ];

  final List<Map<String, dynamic>> allFlights = List.generate(12, (index) {
    final bool isDownloaded = index % 3 != 0;
    return {
      'name': 'Flight ${index + 1}',
      'timestamp': '2024-05-${(index + 1).toString().padLeft(2, '0')} 14:00',
      'summary': 'Peak Alt: ${1200 + index * 50}m, Duration: ${35 + index}s',
      'downloaded': isDownloaded,
    };
  });

  void openLocalFolder() async {
    const localPath = 'C:/';
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      await launchUrl(Uri.file(localPath));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Folder open is only for desktop.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final localFlights =
        allFlights.where((flight) => flight['downloaded']).toList();
    final remoteFlights =
        allFlights.where((flight) => !flight['downloaded']).toList();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- LOCAL FLIGHTS ---
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text('Local Flights',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      const Spacer(),
                      ElevatedButton.icon(
                        onPressed: openLocalFolder,
                        icon: const Icon(Icons.folder_open),
                        label: const Text('Open Folder'),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            allFlights
                                .removeWhere((flight) => flight['downloaded']);
                          });
                        },
                        icon: const Icon(Icons.delete_forever),
                        label: const Text('Clear All'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: ListView.separated(
                      itemCount: localFlights.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 8),
                      itemBuilder: (context, index) {
                        final flight = localFlights[index];
                        return Card(
                          child: ListTile(
                            title: Text(flight['name']),
                            subtitle: Text(
                                '${flight['timestamp']} • ${flight['summary']}'),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.play_arrow),
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              'Loaded ${flight['name']}')),
                                    );
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {
                                    setState(() {
                                      allFlights.remove(flight);
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 24),

            // --- REMOTE FLIGHTS ---
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text('Remote Flights',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      const Spacer(),
                      DropdownButton<String>(
                        value: selectedRemote,
                        items: remoteSources
                            .map((src) =>
                                DropdownMenuItem(value: src, child: Text(src)))
                            .toList(),
                        onChanged: (value) =>
                            setState(() => selectedRemote = value!),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            allFlights.removeWhere(
                                (flight) => !flight['downloaded']);
                          });
                        },
                        icon: const Icon(Icons.delete_forever),
                        label: const Text('Clear Remote'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: ListView.separated(
                      itemCount: remoteFlights.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 8),
                      itemBuilder: (context, index) {
                        final flight = remoteFlights[index];
                        return Card(
                          child: ListTile(
                            title: Text(flight['name']),
                            subtitle: Text(
                                '${flight['timestamp']} • ${flight['summary']}'),
                            trailing: ElevatedButton.icon(
                              icon: const Icon(Icons.download),
                              label: const Text('Download'),
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          'Downloading ${flight['name']}')),
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
            ),
          ],
        ),
      ),
    );
  }
}
