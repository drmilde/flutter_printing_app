import 'package:flutter/material.dart' as material;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

class PdfLeihvertrag {
  Future<List<int>> buildPages(PdfPageFormat format) async {
    final Document doc = Document();
    final PdfImage assetImage = await pdfImageFromImageProvider(
      pdf: doc.document,
      image: const material.AssetImage('assets/images/ludwigvan.png'),
    );

    doc.addPage(MultiPage(
        pageFormat:
            PdfPageFormat.a4.copyWith(marginBottom: 1.5 * PdfPageFormat.cm),
        crossAxisAlignment: CrossAxisAlignment.start,
        build: (Context context) => <Widget>[
              //Image(assetImage),
              _buildCenteredText("Leihvertrag", 20),
              _spacer(20),
              _buildCenteredText(
                "zwischen",
                10,
                fontStyle: FontStyle.italic,
              ),
              _spacer(40),
              _buildCenteredText("______________________________", 15),
              _spacer(20),
              _buildCenteredText("______________________________", 15),
              _spacer(10),
              _buildCenteredText(
                "- im Folgenden Leihnehmer genannt -",
                10,
                fontStyle: FontStyle.italic,
              ),
              _spacer(50),
              _buildCenteredText("und", 15),
              _spacer(40),
              _buildCenteredText("Leihladen Fulda ______________", 15),
              _spacer(20),
              _buildCenteredText("Bürgerbüro Ziehers ___________", 15),
              _spacer(10),
              _buildCenteredText(
                "- im Folgenden Leihgeber genannt -",
                10,
                fontStyle: FontStyle.italic,
              ),
              _spacer(20),
              _buildCenteredText(
                "wird folgender Leihvertrag geschlossen:",
                15,
                fontStyle: FontStyle.italic,
              ),
              _spacer(50),
              _buildCenteredText(
                "§1 Überlassung",
                15,
                fontWeight: FontWeight.bold,
              ),
              _spacer(20),
              Paragraph(
                text:
                    "1. Der Leihgeber stellt dem Leihnehmer folgende Objekte leihweise"
                    " zur Verfügung: ",
              ),
              _spacer(20),
              Paragraph(
                text: "2. Der Gesamtwert der Leihobjekte beträgt  __________"
                    " (__________ Euro)."
                    "",
              ),

              _spacer(200),
              Header(level: 0, text: "Eine Überschrift"),
              Paragraph(
                  text:
                      "Lorem ipsum und so weiter, hier sollte ein langer Text stehen. "
                      "Lorem ipsum und so weiter, hier sollte ein langer Text stehen. "
                      "Lorem ipsum und so weiter, hier sollte ein langer Text stehen. "
                      "Lorem ipsum und so weiter, hier sollte ein langer Text stehen. "),
            ]));

    //final File file = File("example.pdf");
    //file.writeAsBytesSync(doc.save());
    return (doc.save());
  }

  SizedBox _spacer(double height) {
    return SizedBox(
      height: height,
    );
  }

  Center _buildCenteredText(String text, double size, {fontStyle, fontWeight}) {
    return Center(
      child: Text(text,
          style: TextStyle(
            fontSize: size,
            fontStyle: fontStyle ?? FontStyle.normal,
            fontWeight: fontWeight ?? FontWeight.normal,
          )),
    );
  }
}
