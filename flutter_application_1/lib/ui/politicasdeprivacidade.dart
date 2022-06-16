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
        backgroundColor: Color.fromARGB(255, 121, 215, 148),
        title: Text("Política de Privacidade",
            style: TextStyle(
                fontFamily: 'Overlock-Regular',
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
      ),
      body: _loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : PDFViewer(
              document: _doc,
              indicatorBackground: Color.fromARGB(255, 121, 215, 148),
              // showIndicator: false,
              showPicker: false,
            ),
    );
  }
}
