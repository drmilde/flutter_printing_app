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
              _spacer(30),
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
              _spacer(30),
              _buildCenteredText(
                "wird folgender Leihvertrag geschlossen:",
                15,
                fontStyle: FontStyle.italic,
              ),
              _spacer(40),
              _buildParagraph("§1 Überlassung"),
              _spacer(20),
              Paragraph(
                text:
                    "1. Der Leihgeber stellt dem Leihnehmer folgende Objekte leihweise"
                    " zur Verfügung: ",
              ),
              Table.fromTextArray(context: context, data: const <List<String>>[
                <String>['Datum', 'Bezeichnung', 'Beschreibung'],
                <String>['17.01.2020', 'Rasenmäher', 'Der grüne Rasenmäher'],
                <String>['17.01.2020', 'Rasenmäher', 'Der grüne Rasenmäher'],
                <String>['17.01.2020', 'Rasenmäher', 'Der grüne Rasenmäher'],
              ]),
              _spacer(20),
              Paragraph(
                text: "2. Der Gesamtwert der Leihobjekte beträgt  __________"
                    " (__________ Euro)."
                    "",
              ),
              Paragraph(
                text: "3. An den Objekten dürfen keine irreversiblen,"
                    " technischen Veränderungen vorgenommen werden."
                    "",
              ),
              Paragraph(
                text: "4. Die Leihobjekte dürfen nur mit vorheriger"
                    " Genehmigung des Leihgebers zur Nutzung an"
                    " unberechtigte Dritte vermietet oder verkauft werden."
                    "",
              ),
              _buildParagraph("§2 Zweck der Leihe"),
              Paragraph(
                text: "Der Zweck der Leihe ist folgender:"
                    "",
              ),
              _buildParagraph("§3 Leihzeit"),
              _spacer(20),
              Paragraph(
                text: "1. Die Leihzeit beginnt mit der Ausleihe der Leihobjekte"
                    " durch den Leihgeber am  _________ und endet am ________"
                    " mit dem Wiedereintreffen der Leihobjekte an einem vom"
                    " Leihgeber bestimmten Aufbewahrungsort."
                    "",
              ),
              Paragraph(
                text: "2. Werden die Leihobjekte nicht zu dem unter §2"
                    " genannten Zeitpunkt an den Leihgeber "
                    " zurückgegeben, kann dem Leihgeber der Gesamtwert"
                    " der Objekte in Rechnung"
                    " gestellt werden."
                    "",
              ),
              _buildParagraph("§4 Leihgebühr"),
              _spacer(20),
              Paragraph(
                text: "Für den Verleih erhebt der Leihgeber nach § 598 BGB"
                    " keine Leihgebühr."
                    "",
              ),
              _buildParagraph("§5 Sorgfaltspflicht und Haftung bei Schäden"),
              _spacer(20),
              Paragraph(
                text: "1. Der Leihnehmer verpflichtet sich zu besonderer"
                    " Sorgfalt im Umgang mit den"
                    " Leihobjekten. Sollte die Leihobjekte"
                    " durch unsachgemäße Behandlung beschädigt werden,"
                    " dann haftet der Leihnehmer für den"
                    " entstandenen Schaden. Dies gilt auch bei Verlust."
                    " Der Leihnehmer verpflichtet sich,"
                    " für ausreichenden Diebstahlschutz zu sorgen."
                    "",
              ),
              Paragraph(
                text: "2. Jede Beschädigung (oder Verlust) muss dem"
                    " Leihgeber unverzüglich schriftlich"
                    " angeeigt werden."
                    "",
              ),
              _buildParagraph("§6 Rücktritt"),
              _spacer(20),
              Paragraph(
                text: "Der Leihgeber ist zum sofortigen Rücktritt"
                    " vom Vertrag berechtigt, wenn"
                    " Vertragsbedingungen verletzt werden."
                    " Die geliehenen Objekte müssen sofort"
                    " an den Leihgeber zurückgegeben werden."
                    "",
              ),
              _buildParagraph("§7 Versicherungen"),
              Paragraph(
                text: "1. Für die Versicherung der Leihobjekte ist"
                    " der Leihnehmer zuständig. Die"
                    " Versicherung muss den Gesamtwert in §1 decken."
                    "",
              ),
              Paragraph(
                text: "2. Die Versicherung erfolgt durch"
                    " folgendes Unternehmen: ________________"
                    "",
              ),

              _buildParagraph("§8 Zusätzliche Vereinbarungen"),
              _spacer(20),
              Paragraph(
                text: "Weiterhin wird zwischen Leihgeber und Leihnehmer"
                    " Folgendes vereinbart:"
                    "",
              ),
              _buildParagraph("§9 ......"),
              _spacer(20),
              _spacer(50),
              Paragraph(
                text: "Ort: ________________, den: ____________________"
                    "",
              ),
              _spacer(20),
              Paragraph(
                text: "______________________________"
                    "",
              ),
              Paragraph(
                text: "Unterschrift Leihgeber"
                    "",
              ),
              _spacer(20),
              Paragraph(
                text: "______________________________"
                    "",
              ),
              Paragraph(
                text: "Unterschrift Leihnehmer"
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

  Center _buildParagraph(text) {
    return _buildCenteredText(
      text,
      15,
      fontWeight: FontWeight.bold,
    );
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
