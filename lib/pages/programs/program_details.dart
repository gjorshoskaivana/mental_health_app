import 'package:app/models/program.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:fwfh_webview/fwfh_webview.dart';

class ProgramDetails extends StatefulWidget {
  late final Program program;
  ProgramDetails({required this.program});

  @override
  _ProgramDetailsState createState() => _ProgramDetailsState();
}

class _ProgramDetailsState extends State<ProgramDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.program.title, style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.indigo[400],
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: widget.program.modules.length,
          itemBuilder: (context, index) {
            return Card(
                child: HtmlWidget(
                  widget.program.modules[index],
                  factoryBuilder: () => MyWidgetFactory(),
                )
            );
          },
        ),
      ),
    );
  }
}

class MyWidgetFactory extends WidgetFactory with WebViewFactory {
  // optional: override getter to configure how WebViews are built
  bool get webViewMediaPlaybackAlwaysAllow => true;
  String? get webViewUserAgent => 'My app';
}
