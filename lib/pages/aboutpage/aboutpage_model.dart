import '/flutter_flow/flutter_flow_util.dart';
import 'aboutpage_widget.dart' show AboutpageWidget;
import 'package:flutter/material.dart';

class AboutpageModel extends FlutterFlowModel<AboutpageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
