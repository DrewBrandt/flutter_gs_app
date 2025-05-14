// logic_node.dart
import 'package:flutter/material.dart';

/// Abstract base class for logic nodes
abstract class LogicNode {
  Widget buildWidget(VoidCallback onUpdate);
  Map<String, dynamic> toJson();
}

/// Logical operation: AND / OR
class LogicGroupNode extends LogicNode {
  String type; // 'and' or 'or'
  List<LogicNode> children;

  LogicGroupNode({required this.type, required this.children});

  @override
  Widget buildWidget(VoidCallback onUpdate) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  type.toUpperCase(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.add),
                  tooltip: 'Add Condition',
                  onPressed: () {
                    children.add(
                      ConditionNode(
                        signal: 'z_velocity',
                        operator: '<=',
                        value: '0',
                      ),
                    );
                    onUpdate();
                  },
                ),
              ],
            ),
            Column(
              children:
                  children.map((child) => child.buildWidget(onUpdate)).toList(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Map<String, dynamic> toJson() => {
    'type': type,
    'children': children.map((e) => e.toJson()).toList(),
  };
}

/// A single condition like z_velocity <= 0
class ConditionNode extends LogicNode {
  String signal;
  String operator;
  String value;

  ConditionNode({
    required this.signal,
    required this.operator,
    required this.value,
  });

  @override
  Widget buildWidget(VoidCallback onUpdate) {
    return Card(
      color: Colors.grey.shade100,
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            DropdownButton<String>(
              value: signal,
              items:
                  ['z_velocity', 'tilt', 'stage', 'time']
                      .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                      .toList(),
              onChanged: (v) {
                signal = v!;
                onUpdate();
              },
            ),
            const SizedBox(width: 8),
            DropdownButton<String>(
              value: operator,
              items:
                  ['==', '!=', '<', '<=', '>', '>=']
                      .map((o) => DropdownMenuItem(value: o, child: Text(o)))
                      .toList(),
              onChanged: (v) {
                operator = v!;
                onUpdate();
              },
            ),
            const SizedBox(width: 8),
            SizedBox(
              width: 80,
              child: TextField(
                controller: TextEditingController(text: value),
                onChanged: (v) => value = v,
                decoration: const InputDecoration(
                  isDense: true,
                  hintText: 'value',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Map<String, dynamic> toJson() => {
    'type': 'condition',
    'signal': signal,
    'operator': operator,
    'value': value,
  };
}

/// Sample UI entry point
class LogicEditor extends StatefulWidget {
  const LogicEditor({super.key});

  @override
  State<LogicEditor> createState() => _LogicEditorState();
}

class _LogicEditorState extends State<LogicEditor> {
  late LogicNode root;

  @override
  void initState() {
    super.initState();
    root = LogicGroupNode(
      type: 'or',
      children: [
        LogicGroupNode(
          type: 'and',
          children: [
            ConditionNode(signal: 'z_velocity', operator: '<=', value: '0'),
            ConditionNode(signal: 'tilt', operator: '>', value: '15'),
            LogicGroupNode(
              type: 'or',
              children: [
                ConditionNode(signal: 'stage', operator: '==', value: 'coast'),
                ConditionNode(signal: 'time', operator: '>', value: '30'),
              ],
            ),
          ],
        ),
        LogicGroupNode(
          type: 'and',
          children: [
            ConditionNode(signal: 'tilt', operator: '>', value: '45'),
            ConditionNode(signal: 'stage', operator: '==', value: 'boost'),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: root.buildWidget(() => setState(() {})),
    );
  }
}
