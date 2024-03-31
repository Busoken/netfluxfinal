import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({
    super.key,
    int? higestid,
  }) : this.higestid = higestid ?? 0;

  final int higestid;

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'imageOnActionTriggerAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        RotateEffect(
          curve: Curves.linear,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
    'imageOnActionTriggerAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        RotateEffect(
          curve: Curves.linear,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
    'imageOnActionTriggerAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        RotateEffect(
          curve: Curves.linear,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: FutureBuilder<ApiCallResponse>(
            future: NewMoviesCall.call(),
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
              final columnNewMoviesResponse = snapshot.data!;
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1, 0),
                              child: Text(
                                currentUserEmail,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 20,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 8, 8, 8),
                              child: FlutterFlowIconButton(
                                borderColor:
                                    FlutterFlowTheme.of(context).alternate,
                                borderRadius: 20,
                                borderWidth: 1,
                                buttonSize: 40,
                                fillColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                icon: Icon(
                                  Icons.logout,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24,
                                ),
                                onPressed: () async {
                                  GoRouter.of(context).prepareAuthEvent();
                                  await authManager.signOut();
                                  GoRouter.of(context).clearRedirectLocation();

                                  context.goNamedAuth(
                                      'account', context.mounted);
                                },
                              ),
                            ),
                          ].divide(SizedBox(width: 20)),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(0),
                          child: Image.asset(
                            'assets/images/tetris.jpg',
                            width: valueOrDefault<double>(
                              () {
                                if (MediaQuery.sizeOf(context).width <
                                    kBreakpointSmall) {
                                  return 500.0;
                                } else if (MediaQuery.sizeOf(context).width <
                                    kBreakpointMedium) {
                                  return 1500.0;
                                } else if (MediaQuery.sizeOf(context).width <
                                    kBreakpointLarge) {
                                  return 1500.0;
                                } else {
                                  return 2250.0;
                                }
                              }(),
                              1500.0,
                            ),
                            height: valueOrDefault<double>(
                              () {
                                if (MediaQuery.sizeOf(context).width <
                                    kBreakpointSmall) {
                                  return 100.0;
                                } else if (MediaQuery.sizeOf(context).width <
                                    kBreakpointMedium) {
                                  return 250.0;
                                } else if (MediaQuery.sizeOf(context).width <
                                    kBreakpointLarge) {
                                  return 500.0;
                                } else {
                                  return 750.0;
                                }
                              }(),
                              500.0,
                            ),
                            fit: BoxFit.fitWidth,
                            alignment: Alignment(0, 0),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 0, 0, 0),
                                  child: FlutterFlowDropDown<String>(
                                    controller:
                                        _model.dropDownValueController ??=
                                            FormFieldController<String>(
                                      _model.dropDownValue ??= '',
                                    ),
                                    options: List<String>.from(
                                        ['0', '1', '2', '3', '4']),
                                    optionLabels: [
                                      'Action',
                                      'Romance',
                                      'Drama',
                                      'Fantasy',
                                      'Scifi'
                                    ],
                                    onChanged: (val) async {
                                      setState(
                                          () => _model.dropDownValue = val);
                                      context.pushNamed(
                                        'genrepage',
                                        queryParameters: {
                                          'movietype': serializeParam(
                                            () {
                                              if (_model.dropDownValue == '0') {
                                                return 'action';
                                              } else if (_model.dropDownValue ==
                                                  '1') {
                                                return 'romance';
                                              } else if (_model.dropDownValue ==
                                                  '2') {
                                                return 'drama';
                                              } else if (_model.dropDownValue ==
                                                  '3') {
                                                return 'fantasy';
                                              } else {
                                                return 'sci-fi';
                                              }
                                            }(),
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
                                            duration: Duration(milliseconds: 0),
                                          ),
                                        },
                                      );
                                    },
                                    width: 200,
                                    height: 48,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 24,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.w600,
                                          lineHeight: 1,
                                        ),
                                    hintText: 'Genre',
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24,
                                    ),
                                    fillColor:
                                        FlutterFlowTheme.of(context).accent4,
                                    elevation: 2,
                                    borderColor:
                                        FlutterFlowTheme.of(context).info,
                                    borderWidth: 2,
                                    borderRadius: 8,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        16, 4, 16, 4),
                                    hidesUnderline: true,
                                    isOverButton: true,
                                    isSearchable: false,
                                    isMultiSelect: false,
                                  ),
                                ),
                              ),
                              FFButtonWidget(
                                key: ValueKey('Button_ri51'),
                                onPressed: () async {
                                  context.pushNamed('watchlist');
                                },
                                text: 'Watchlist',
                                options: FFButtonOptions(
                                  width: 200,
                                  height: 48,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24, 0, 24, 0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 0),
                                  color: FlutterFlowTheme.of(context).accent4,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 28,
                                        letterSpacing: 0,
                                      ),
                                  elevation: 3,
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).info,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  context.pushNamed('aboutpage');
                                },
                                text: 'About Page',
                                options: FFButtonOptions(
                                  width: 200,
                                  height: 48,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24, 0, 24, 0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 0),
                                  color: FlutterFlowTheme.of(context).accent4,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 28,
                                        letterSpacing: 0,
                                      ),
                                  elevation: 3,
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).info,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ].divide(SizedBox(width: 20)),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 20, 0, 20),
                            child: Text(
                              'Now Trending',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 28,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Container(
                            width: double.infinity,
                            height: 320,
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
                              child: PageView(
                                controller: _model.pageViewController1 ??=
                                    PageController(initialPage: 0),
                                scrollDirection: Axis.horizontal,
                                children: [
                                  FutureBuilder<List<MoviesRow>>(
                                    future: MoviesTable().queryRows(
                                      queryFn: (q) => q.order('rating'),
                                      limit: 20,
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<MoviesRow> rowMoviesRowList =
                                          snapshot.data!;
                                      return SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: List.generate(
                                              rowMoviesRowList.length,
                                              (rowIndex) {
                                            final rowMoviesRow =
                                                rowMoviesRowList[rowIndex];
                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 30, 0),
                                                  child: Container(
                                                    width:
                                                        valueOrDefault<double>(
                                                      () {
                                                        if (MediaQuery.sizeOf(
                                                                    context)
                                                                .width <
                                                            kBreakpointSmall) {
                                                          return 100.0;
                                                        } else if (MediaQuery
                                                                    .sizeOf(
                                                                        context)
                                                                .width <
                                                            kBreakpointMedium) {
                                                          return 150.0;
                                                        } else if (MediaQuery
                                                                    .sizeOf(
                                                                        context)
                                                                .width <
                                                            kBreakpointLarge) {
                                                          return 220.0;
                                                        } else {
                                                          return 350.0;
                                                        }
                                                      }(),
                                                      220.0,
                                                    ),
                                                    height: 176,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        context.pushNamed(
                                                          'video',
                                                          queryParameters: {
                                                            'movieId':
                                                                serializeParam(
                                                              rowMoviesRow.id,
                                                              ParamType.int,
                                                            ),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            kTransitionInfoKey:
                                                                TransitionInfo(
                                                              hasTransition:
                                                                  true,
                                                              transitionType:
                                                                  PageTransitionType
                                                                      .rightToLeft,
                                                            ),
                                                          },
                                                        );
                                                      },
                                                      child: ClipRRect(
                                                        key: ValueKey(
                                                            'Image_m4jl'),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        child: Image.network(
                                                          key: ValueKey(
                                                              'Image_m4jl'),
                                                          rowMoviesRow
                                                              .imageUrl!,
                                                          width: 300,
                                                          height: 200,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ).animateOnActionTrigger(
                                                      animationsMap[
                                                          'imageOnActionTriggerAnimation1']!,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    width: 150,
                                                    decoration: BoxDecoration(),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0, 0),
                                                      child: AutoSizeText(
                                                        valueOrDefault<String>(
                                                          rowMoviesRow.name,
                                                          'Loading data...',
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Readex Pro',
                                                              color: Theme.of(context)
                                                                          .brightness ==
                                                                      Brightness
                                                                          .dark
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary,
                                                              fontSize: 22,
                                                              letterSpacing: 0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                        minFontSize: 22,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          }),
                                        ),
                                      );
                                    },
                                  ),
                                  Container(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 20, 0, 20),
                            child: Text(
                              'New on Netflux',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 28,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Container(
                            width: double.infinity,
                            height: 320,
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
                              child: PageView(
                                controller: _model.pageViewController2 ??=
                                    PageController(initialPage: 0),
                                scrollDirection: Axis.horizontal,
                                children: [
                                  FutureBuilder<List<MoviesRow>>(
                                    future: MoviesTable().queryRows(
                                      queryFn: (q) => q.order('id'),
                                      limit: 20,
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<MoviesRow> rowMoviesRowList =
                                          snapshot.data!;
                                      return SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: List.generate(
                                              rowMoviesRowList.length,
                                              (rowIndex) {
                                            final rowMoviesRow =
                                                rowMoviesRowList[rowIndex];
                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 30, 0),
                                                  child: Container(
                                                    width:
                                                        valueOrDefault<double>(
                                                      () {
                                                        if (MediaQuery.sizeOf(
                                                                    context)
                                                                .width <
                                                            kBreakpointSmall) {
                                                          return 100.0;
                                                        } else if (MediaQuery
                                                                    .sizeOf(
                                                                        context)
                                                                .width <
                                                            kBreakpointMedium) {
                                                          return 150.0;
                                                        } else if (MediaQuery
                                                                    .sizeOf(
                                                                        context)
                                                                .width <
                                                            kBreakpointLarge) {
                                                          return 220.0;
                                                        } else {
                                                          return 350.0;
                                                        }
                                                      }(),
                                                      220.0,
                                                    ),
                                                    height: 176,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        context.pushNamed(
                                                          'video',
                                                          queryParameters: {
                                                            'movieId':
                                                                serializeParam(
                                                              rowMoviesRow.id,
                                                              ParamType.int,
                                                            ),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            kTransitionInfoKey:
                                                                TransitionInfo(
                                                              hasTransition:
                                                                  true,
                                                              transitionType:
                                                                  PageTransitionType
                                                                      .rightToLeft,
                                                            ),
                                                          },
                                                        );
                                                      },
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        child: Image.network(
                                                          rowMoviesRow
                                                              .imageUrl!,
                                                          width: 300,
                                                          height: 200,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ).animateOnActionTrigger(
                                                      animationsMap[
                                                          'imageOnActionTriggerAnimation2']!,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    width: 150,
                                                    decoration: BoxDecoration(),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0, 0),
                                                      child: AutoSizeText(
                                                        valueOrDefault<String>(
                                                          rowMoviesRow.name,
                                                          'Loading data...',
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Readex Pro',
                                                              color: Theme.of(context)
                                                                          .brightness ==
                                                                      Brightness
                                                                          .dark
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary,
                                                              fontSize: 22,
                                                              letterSpacing: 0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                        minFontSize: 22,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          }),
                                        ),
                                      );
                                    },
                                  ),
                                  Container(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 20, 0, 20),
                            child: Text(
                              'Gaming Content',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 28,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Container(
                            width: double.infinity,
                            height: 320,
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
                              child: PageView(
                                controller: _model.pageViewController3 ??=
                                    PageController(initialPage: 0),
                                scrollDirection: Axis.horizontal,
                                children: [
                                  FutureBuilder<List<MoviesRow>>(
                                    future: MoviesTable().queryRows(
                                      queryFn: (q) => q
                                          .eq(
                                            'genre',
                                            'gaming',
                                          )
                                          .order('id'),
                                      limit: 20,
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<MoviesRow> rowMoviesRowList =
                                          snapshot.data!;
                                      return SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: List.generate(
                                              rowMoviesRowList.length,
                                              (rowIndex) {
                                            final rowMoviesRow =
                                                rowMoviesRowList[rowIndex];
                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 30, 0),
                                                  child: Container(
                                                    width:
                                                        valueOrDefault<double>(
                                                      () {
                                                        if (MediaQuery.sizeOf(
                                                                    context)
                                                                .width <
                                                            kBreakpointSmall) {
                                                          return 100.0;
                                                        } else if (MediaQuery
                                                                    .sizeOf(
                                                                        context)
                                                                .width <
                                                            kBreakpointMedium) {
                                                          return 150.0;
                                                        } else if (MediaQuery
                                                                    .sizeOf(
                                                                        context)
                                                                .width <
                                                            kBreakpointLarge) {
                                                          return 220.0;
                                                        } else {
                                                          return 350.0;
                                                        }
                                                      }(),
                                                      220.0,
                                                    ),
                                                    height: 176,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        context.pushNamed(
                                                          'video',
                                                          queryParameters: {
                                                            'movieId':
                                                                serializeParam(
                                                              rowMoviesRow.id,
                                                              ParamType.int,
                                                            ),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            kTransitionInfoKey:
                                                                TransitionInfo(
                                                              hasTransition:
                                                                  true,
                                                              transitionType:
                                                                  PageTransitionType
                                                                      .rightToLeft,
                                                            ),
                                                          },
                                                        );
                                                      },
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        child: Image.network(
                                                          rowMoviesRow
                                                              .imageUrl!,
                                                          width: 300,
                                                          height: 200,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ).animateOnActionTrigger(
                                                      animationsMap[
                                                          'imageOnActionTriggerAnimation3']!,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    width: 150,
                                                    decoration: BoxDecoration(),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0, 0),
                                                      child: AutoSizeText(
                                                        valueOrDefault<String>(
                                                          rowMoviesRow.name,
                                                          'Loading data...',
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Readex Pro',
                                                              color: Theme.of(context)
                                                                          .brightness ==
                                                                      Brightness
                                                                          .dark
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary,
                                                              fontSize: 22,
                                                              letterSpacing: 0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                        minFontSize: 22,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          }),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 0, 0, 20),
                            child: Text(
                              'Genre',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 28,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        'genrepage',
                                        queryParameters: {
                                          'movietype': serializeParam(
                                            'gaming',
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: Container(
                                      width: 330,
                                      height: 240,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                            FlutterFlowTheme.of(context)
                                                .tertiary
                                          ],
                                          stops: [0, 1],
                                          begin: AlignmentDirectional(0, -1),
                                          end: AlignmentDirectional(0, 1),
                                        ),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          width: 5,
                                        ),
                                      ),
                                      child: Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Text(
                                          'Gaming',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                fontSize: 40,
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        'genrepage',
                                        queryParameters: {
                                          'movietype': serializeParam(
                                            'sci-fi',
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: Container(
                                      width: 330,
                                      height: 240,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            FlutterFlowTheme.of(context)
                                                .accent2,
                                            FlutterFlowTheme.of(context)
                                                .secondary
                                          ],
                                          stops: [0, 1],
                                          begin: AlignmentDirectional(0, -1),
                                          end: AlignmentDirectional(0, 1),
                                        ),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          width: 5,
                                        ),
                                      ),
                                      child: Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Text(
                                          'Sci-fi',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                fontSize: 40,
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        'genrepage',
                                        queryParameters: {
                                          'movietype': serializeParam(
                                            'action',
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: Container(
                                      width: 330,
                                      height: 240,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            FlutterFlowTheme.of(context).error,
                                            FlutterFlowTheme.of(context)
                                                .tertiary
                                          ],
                                          stops: [0, 1],
                                          begin: AlignmentDirectional(0, -1),
                                          end: AlignmentDirectional(0, 1),
                                        ),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          width: 5,
                                        ),
                                      ),
                                      child: Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Text(
                                          'Action',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                fontSize: 40,
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        'genrepage',
                                        queryParameters: {
                                          'movietype': serializeParam(
                                            'action',
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: Container(
                                      width: 330,
                                      height: 240,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            FlutterFlowTheme.of(context)
                                                .accent1,
                                            FlutterFlowTheme.of(context).info
                                          ],
                                          stops: [0, 1],
                                          begin: AlignmentDirectional(0, -1),
                                          end: AlignmentDirectional(0, 1),
                                        ),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          width: 5,
                                        ),
                                      ),
                                      child: Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'genrepage',
                                              queryParameters: {
                                                'movietype': serializeParam(
                                                  'romance',
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Text(
                                            'Romance',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  fontSize: 40,
                                                  letterSpacing: 0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        'genrepage',
                                        queryParameters: {
                                          'movietype': serializeParam(
                                            'action',
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: Container(
                                      width: 330,
                                      height: 240,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            FlutterFlowTheme.of(context)
                                                .accent3,
                                            FlutterFlowTheme.of(context)
                                                .tertiary
                                          ],
                                          stops: [0, 1],
                                          begin: AlignmentDirectional(0, -1),
                                          end: AlignmentDirectional(0, 1),
                                        ),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          width: 5,
                                        ),
                                      ),
                                      child: Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Text(
                                          'Drama',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                fontSize: 40,
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        'genrepage',
                                        queryParameters: {
                                          'movietype': serializeParam(
                                            'action',
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: Container(
                                      width: 330,
                                      height: 240,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            FlutterFlowTheme.of(context).info
                                          ],
                                          stops: [0, 1],
                                          begin: AlignmentDirectional(0, -1),
                                          end: AlignmentDirectional(0, 1),
                                        ),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          width: 5,
                                        ),
                                      ),
                                      child: Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'genrepage',
                                              queryParameters: {
                                                'movietype': serializeParam(
                                                  'fantasy',
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Text(
                                            'Fantasy',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  fontSize: 40,
                                                  letterSpacing: 0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ]
                                  .divide(SizedBox(width: 40))
                                  .around(SizedBox(width: 40)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
