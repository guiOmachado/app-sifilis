import 'package:flutter/material.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';

class PoliticasDePrivacidade extends StatefulWidget {
  @override
  _PoliticasDePrivacidadeState createState() => _PoliticasDePrivacidadeState();
}

class _PoliticasDePrivacidadeState extends State<PoliticasDePrivacidade> {
  String pdfasset = "assets/documents/Politica_Privacidade.docx.pdf";
  PDFDocument _doc;
  bool _loading;

  @override
  void initState() {
    super.initState();
    _initPdf();
  }

  _initPdf() async {
    setState(() {
      _loading = true;
    });
    final doc = await PDFDocument.fromAsset(pdfasset);
    setState(() {
      _doc = doc;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(1000, 236, 221, 252),
        title: Text("Política de Privacidade",
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(500, 75, 66, 121))),
      ),
      body: _loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : PDFViewer(
              document: _doc,
              indicatorBackground: Color.fromARGB(500, 75, 66, 121),
              // showIndicator: false,
              showPicker: false,
            ),
    );
  }
}
