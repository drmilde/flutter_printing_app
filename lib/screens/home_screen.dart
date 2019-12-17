import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdf;
import 'package:printing/printing.dart';

class HomeScreen extends StatelessWidget {
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
            /*
            Printing.layoutPdf(
              onLayout: buildPages,
            );
            */
            buildPages();
          },
        ),
        body: Center(
          child: const Text('Click on the print button below'),
        ),
      ),
    );
  }

  void buildPages() {
    final pdf.Document doc = pdf.Document();

    doc.addPage(
      pdf.MultiPage(
        pageFormat: PdfPageFormat.a4.copyWith(marginBottom: 1.5 * PdfPageFormat.cm),
        crossAxisAlignment: pdf.CrossAxisAlignment.start,
        build: (pdf.Context context) => <pdf.Widget> [
          pdf.Header(
            level: 0,
            text: "Eine Überschrift"
          ),
          pdf.Paragraph (
            text: "Lorem ipsum und so weiter, hier sollte ein langer Text stehen. "
                "Lorem ipsum und so weiter, hier sollte ein langer Text stehen. "
                "Lorem ipsum und so weiter, hier sollte ein langer Text stehen. "
                "Lorem ipsum und so weiter, hier sollte ein langer Text stehen. "
          )
        ]
      )
    );

    final File file = File("example.pdf");
    file.writeAsBytesSync(doc.save());
  }


    List<int> buildPdf(PdfPageFormat format) {
    final pdf.Document doc = pdf.Document();

    doc.addPage(
      pdf.Page(
        pageFormat: format,
        build: (pdf.Context context) {
          return pdf.ConstrainedBox(
            constraints: pdf.BoxConstraints.tight(const PdfPoint(1000, 200)),
            child: pdf.FittedBox(
              child: pdf.Column(children: <pdf.Widget>[
                pdf.Padding(
                  padding: const pdf.EdgeInsets.all(10.0),
                  child: pdf.Text(
                    'Hello World Hello'
                    ' Hello World Hello World',
                    softWrap: true,
                    maxLines: 5,
                  ),
                ),
              ]),
            ),
          );
        },
      ),
    );

    return doc.save();
  }
}
