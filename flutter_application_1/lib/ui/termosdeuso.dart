import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';

class TermosDeUso extends StatefulWidget {
  @override
  _TermosDeUsoState createState() => _TermosDeUsoState();
}

class _TermosDeUsoState extends State<TermosDeUso> {
  String pdfasset = "assets/documents/Termo_Uso.docx.pdf";
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
        backgroundColor: Color.fromARGB(1000, 142, 197, 231),
        title: Text("Termos de Uso"),
      ),
      body: _loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : PDFViewer(
              document: _doc,
              indicatorBackground: Color.fromARGB(1000, 142, 197, 231),
              // showIndicator: false,
              // showPicker: false,
            ),
    );
  }
}
