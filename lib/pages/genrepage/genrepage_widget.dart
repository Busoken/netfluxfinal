import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'genrepage_model.dart';
export 'genrepage_model.dart';

class GenrepageWidget extends StatefulWidget {
  const GenrepageWidget({
    super.key,
    required this.movietype,
  });

  final String? movietype;

  @override
  State<GenrepageWidget> createState() => _GenrepageWidgetState();
}

class _GenrepageWidgetState extends State<GenrepageWidget> {
  late GenrepageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GenrepageModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: true,
          actions: [],
          centerTitle: true,
          elevation: 4,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(120, 0, 120, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/dune.webp',
                    width: 1800,
                    height: 200,
                    fit: BoxFit.fill,
                    alignment: Alignment(-1, 0),
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Container(
                          width: 600,
                          child: TextFormField(
                            controller: _model.textController,
                            focusNode: _model.textFieldFocusNode,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              alignLabelWithHint: false,
                              hintText: 'Search.....',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context).info,
                                    fontSize: 28,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w500,
                                  ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,
                              fillColor: Color(0xB2494D50),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 20,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w500,
                                ),
                            minLines: null,
                            validator: _model.textControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(40, 0, 0, 20),
                    child: Text(
                      'All ${widget.movietype}',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            fontSize: 28,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(40, 0, 40, 0),
                  child: FutureBuilder<List<MoviesRow>>(
                    future: MoviesTable().queryRows(
                      queryFn: (q) => q
                          .eq(
                            'genre',
                            widget.movietype,
                          )
                          .order('id'),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<MoviesRow> gridViewMoviesRowList = snapshot.data!;
                      return GridView.builder(
                        padding: EdgeInsets.fromLTRB(
                          0,
                          10,
                          0,
                          10,
                        ),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          childAspectRatio: 1,
                        ),
                        primary: false,
                        scrollDirection: Axis.vertical,
                        itemCount: gridViewMoviesRowList.length,
                        itemBuilder: (context, gridViewIndex) {
                          final gridViewMoviesRow =
                              gridViewMoviesRowList[gridViewIndex];
                          return Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Container(
                              width: 320,
                              height: 400,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    'video',
                                    queryParameters: {
                                      'movieId': serializeParam(
                                        gridViewMoviesRow.id,
                                        ParamType.int,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    gridViewMoviesRow.imageUrl!,
                                    width: 320,
                                    height: 200,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
