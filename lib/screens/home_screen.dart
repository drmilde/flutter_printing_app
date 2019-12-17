import 'package:flutter/material.dart';
import 'package:flutter_printing_app/model/pdf_leihvertrag.dart';
import 'package:printing/printing.dart';

class HomeScreen extends StatelessWidget {
  PdfLeihvertrag vertrag = PdfLeihvertrag();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Printing Demo'),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.print),
          tooltip: 'Print Document',
          onPressed: () {
            Printing.layoutPdf(onLayout: vertrag.buildPages);
          },
        ),
        body: Center(
          child: const Text('Click on the print button below'),
        ),
      ),
    );
  }
}
