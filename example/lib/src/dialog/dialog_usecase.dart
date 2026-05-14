import 'package:flutter/material.dart';
import 'package:artizan_ui/artizan_ui.dart';

class DialogUseCase extends StatelessWidget {
  const DialogUseCase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dialog Use Cases')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DSButton(onPressed: () => _showPrimaryDialog(context), child: const Text('Show Primary Dialog')),
            const SizedBox(height: 16),
            DSButton(onPressed: () => _showAlertDialog(context), child: const Text('Show Alert Dialog')),
            const SizedBox(height: 16),
            DSButton(onPressed: () => _showCustomDialog(context), child: const Text('Show Custom Dialog')),
          ],
        ),
      ),
    );
  }

  void _showPrimaryDialog(BuildContext context) {
    showDSDialog(
      context: context,
      builder: (context) => DSDialog(
        title: const Text('Primary Dialog'),
        description: const Text('This is a primary dialog example.'),
        actions: [
          DSButton.secondary(onPressed: () => Navigator.of(context).pop(), child: const Text('Cancel')),
          DSButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Confirm'))
        ],
      ),
    );
  }

  void _showAlertDialog(BuildContext context) {
    showDSDialogAlert(
      context: context,
      builder: (context) => DSDialog.alert(
        title: const Text('Alert Dialog'),
        description: const Text('This is an alert dialog example.'),
        actions: [
          DSButton.secondary(onPressed: () => Navigator.of(context).pop(), child: const Text('Cancel')),
          DSButton.destructive(onPressed: () => Navigator.of(context).pop(), child: const Text('Delete'))
        ],
      ),
    );
  }

  void _showCustomDialog(BuildContext context) {
    showDSDialog(
      context: context,
      builder: (context) => DSDialog(
        title: const Text('Custom Dialog'),
        description: const Text('This dialog has custom styling.'),
        actions: [DSButton.ghost(onPressed: () => Navigator.of(context).pop(), child: const Text('Close'))],
        radius: BorderRadius.circular(16),
        backgroundColor: Colors.white,
        child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(8)),
            child: const Text('Custom content goes here')),
      ),
    );
  }
}
