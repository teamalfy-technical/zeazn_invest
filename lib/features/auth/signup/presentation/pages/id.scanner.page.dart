import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';

class IDScannerPage extends StatefulWidget {
  const IDScannerPage({super.key});

  @override
  _IDScannerPageState createState() => _IDScannerPageState();
}

class _IDScannerPageState extends State<IDScannerPage> {
  String extractedName = '';
  String extractedID = '';
  String extractedDOB = '';
  String extractedExpiry = '';
  String extractedSex = '';
  String extractedIDType = '';

  Future<void> scanIDCard() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile == null) return;

    final inputImage = InputImage.fromFilePath(pickedFile.path);
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    final recognizedText = await textRecognizer.processImage(inputImage);

    final fullText = recognizedText.text;

    setState(() {
      extractedName = _parseName(fullText);
      extractedID = _parseIDNumber(fullText);
      extractedDOB = _parseDOB(fullText);
      extractedExpiry = _parseExpiryDate(fullText);
      extractedSex = _parseSex(fullText);
      extractedIDType = _parseIDType(fullText);
    });

    textRecognizer.close();
  }

  String _parseName(String text) {
    final nameRegex = RegExp(r'Name[:\s]*([A-Z][a-z]+(?: [A-Z][a-z]+)+)');
    final match = nameRegex.firstMatch(text);
    return match?.group(1) ?? 'Not found';
  }

  String _parseIDNumber(String text) {
    final idRegex = RegExp(r'(ID No\.?|ID Number)[:\s]*([A-Z0-9\-]+)');
    final match = idRegex.firstMatch(text);
    return match?.group(2) ?? 'Not found';
  }

  String _parseDOB(String text) {
    final dobRegex = RegExp(
      r'(DOB|Date of Birth)[:\s]*([0-9]{2}/[0-9]{2}/[0-9]{4})',
    );
    final match = dobRegex.firstMatch(text);
    return match?.group(2) ?? 'Not found';
  }

  String _parseExpiryDate(String text) {
    final expRegex = RegExp(
      r'(Expiry|Expires)[:\s]*([0-9]{2}/[0-9]{2}/[0-9]{4})',
    );
    final match = expRegex.firstMatch(text);
    return match?.group(2) ?? 'Not found';
  }

  String _parseSex(String text) {
    final sexRegex = RegExp(r'(Sex|Gender)[:\s]*([A-Za-z]+)');
    final match = sexRegex.firstMatch(text);
    return match?.group(2) ?? 'Not found';
  }

  String _parseIDType(String text) {
    final idTypeRegex = RegExp(
      r'(ID Type|Card Type|Document Type)[:\s]*([\w\s]+)',
    );
    final match = idTypeRegex.firstMatch(text);
    var result = match?.group(2) ?? 'Not found';

    // Normalize common terms
    result = result.toLowerCase();
    if (result.contains('passport')) return 'Passport';
    if (result.contains('voter')) return 'Voter ID';
    if (result.contains('ghana')) return 'Ghana Card';
    if (result.contains('national')) return 'National ID';
    return result[0].toUpperCase() + result.substring(1); // Capitalize
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scan ID Card')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: scanIDCard,
              child: Text("Select ID Card Image"),
            ),
            const SizedBox(height: 20),
            _buildInfo("Name", extractedName),
            _buildInfo("Sex", extractedSex),
            _buildInfo("ID Type", extractedIDType),
            _buildInfo("ID Number", extractedID),
            _buildInfo("Date of Birth", extractedDOB),
            _buildInfo("Expiry Date", extractedExpiry),
          ],
        ),
      ),
    );
  }

  Widget _buildInfo(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Text("$label: $value", style: TextStyle(fontSize: 16)),
    );
  }
}
