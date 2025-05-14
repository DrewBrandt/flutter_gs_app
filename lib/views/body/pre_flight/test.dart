import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Test extends ConsumerWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 700,
      height: 50,
      child: Row(
        children: [
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('aasdasd', overflow: TextOverflow.ellipsis),
                Text('data', overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
          Expanded(child: Container()),
          Text('dataasd'),
        ],
      ),
    );
  }
}
