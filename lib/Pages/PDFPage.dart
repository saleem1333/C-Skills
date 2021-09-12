import 'package:flutter/material.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';

class PDFPage extends StatefulWidget {
  PDFPage.withoutLocatio({
    required Key key,
  }) : super(key: key);

  @override
  _PDFPageState createState() => _PDFPageState();
}

class _PDFPageState extends State<PDFPage> {
  bool _isLoading = true;
  late PDFDocument document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    document = await PDFDocument.fromAsset('assets/files/summary.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color.fromARGB(255, 154, 88, 216)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: _isLoading
            ? Center(
                child: CircularProgressIndicator(
                color: Color.fromARGB(255, 154, 88, 216),
              ))
            : PDFViewer(
                progressIndicator: CircularProgressIndicator(
                  color: Color.fromARGB(255, 154, 88, 216),
                ),
                pickerButtonColor: Color.fromARGB(255, 154, 88, 216),
                document: document,
                zoomSteps: 1,
                //uncomment below line to preload all pages
                // lazyLoad: false,
              ),
      ),
    );
  }
}
