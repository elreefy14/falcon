import 'dart:io';
import 'package:falcon/core/core_exports.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class WordViewerPage extends StatelessWidget {
  final String wordPath;

  const WordViewerPage({super.key, required this.wordPath});

  Future<void> openWordFile(BuildContext context) async {
    try {
      final filePath = await _getLocalFile(wordPath);
      final uri = Uri.file(filePath.path);

      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content:
                  Text('Could not open the file. No compatible app found.'),
            ),
          );
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error opening file: ${e.toString()}'),
          ),
        );
      }
    }
  }

  Future<File> _getLocalFile(String assetPath) async {
    final byteData = await rootBundle.load(assetPath);
    final buffer = byteData.buffer;

    final tempDir = await getTemporaryDirectory();
    final tempFilePath = '${tempDir.path}/${assetPath.split('/').last}';
    final tempFile = File(tempFilePath);

    await tempFile.writeAsBytes(
      buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes),
      flush: true,
    );

    return tempFile;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Word Viewer'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => openWordFile(context),
          child: const Text('Open Word Document'),
        ),
      ),
    );
  }
}
