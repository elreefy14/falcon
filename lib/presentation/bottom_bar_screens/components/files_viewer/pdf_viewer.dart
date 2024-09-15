import 'package:falcon/core/core_exports.dart';

class PdfViewerPage extends StatefulWidget {
  final String pdfPath;

  PdfViewerPage({required this.pdfPath});

  @override
  _PdfViewerPageState createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
  late PdfController _pdfController;

  @override
  void initState() {
    super.initState();
    _pdfController = PdfController(
      document: PdfDocument.openAsset(widget.pdfPath),
    );
  }

  @override
  void dispose() {
    _pdfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.grey,
      appBar: CustomAppBar(
        context: context,
        hasArrowBack: true,
        elevation: 0  ,
        title: 'Artificial Intelligence Content',
      ),
      body: PdfView(
        scrollDirection: Axis.vertical,
        controller: _pdfController,
      ),
    );
  }
}
