import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
class alerts extends StatefulWidget {
  const alerts({super.key});

  @override
  State<alerts> createState() => _alertsState();
}

class _alertsState extends State<alerts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Gap(20),
          Text("Alert List",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
          ),
          Gap(30),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
            child: Container(
              width: double.infinity,
              constraints: BoxConstraints(
                maxWidth: double.infinity,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.grey,
                  width: 2,
                ),
              ),
              child: Padding(
                padding:
                EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                      EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            textScaleFactor: MediaQuery.of(context)
                                .textScaleFactor,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'CaseID #: ',
                                  style:
                                  TextStyle(color: Colors.black),
                                ),
                                TextSpan(
                                  text: '4219GB',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0, 4, 0, 0),
                            child: Text(
                              'Code #5',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),

                        ],
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0, 0, 0, 12),
                          child: Text('Assigned',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontSize: 18, color: Colors.black)),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0, 12, 0, 0),
                          child: Container(
                            height: 32,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.red,
                                width: 2,
                              ),
                            ),
                            child: Align(
                              alignment:
                              AlignmentDirectional(0.00, 0.00),
                              child: Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(
                                    12, 0, 12, 0),
                                child: Text(
                                  'On Going',
                                  style:
                                  TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Gap(20),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
            child: Container(
              width: double.infinity,
              constraints: BoxConstraints(
                maxWidth: double.infinity,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.grey,
                  width: 2,
                ),
              ),
              child: Padding(
                padding:
                EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                      EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            textScaleFactor: MediaQuery.of(context)
                                .textScaleFactor,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'CaseID #: ',
                                  style:
                                  TextStyle(color: Colors.black),
                                ),
                                TextSpan(
                                  text: '34021A',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0, 4, 0, 0),
                            child: Text(
                              'Code #9',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),

                        ],
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0, 0, 0, 12),
                          child: Text('Awaiting to be Assigned',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontSize: 18, color: Colors.black)),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0, 12, 0, 0),
                          child: Container(
                            height: 32,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.green,
                                width: 2,
                              ),
                            ),
                            child: Align(
                              alignment:
                              AlignmentDirectional(0.00, 0.00),
                              child: Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(
                                    12, 0, 12, 0),
                                child: Text('On Going',
                                    style: TextStyle(
                                        color: Colors.white)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        Gap(20),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
          child: Container(
            width: double.infinity,
            constraints: BoxConstraints(
              maxWidth: double.infinity,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.grey,
                width: 2,
              ),
            ),
            child: Padding(
              padding:
              EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                    EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          textScaleFactor: MediaQuery.of(context)
                              .textScaleFactor,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'CaseID #: ',
                                style:
                                TextStyle(color: Colors.black),
                              ),
                              TextSpan(
                                text: '4219GB',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0, 4, 0, 0),
                          child: Text(
                            'Code #3',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),

                      ],
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0, 0, 0, 12),
                        child: Text('Requesting more units',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontSize: 18, color: Colors.black)),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0, 12, 0, 0),
                        child: Container(
                          height: 32,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                          child: Align(
                            alignment:
                            AlignmentDirectional(0.00, 0.00),
                            child: Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(
                                  12, 0, 12, 0),
                              child: Text(
                                'On Going',
                                style:
                                TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Gap(20),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
          child: Container(
            width: double.infinity,
            constraints: BoxConstraints(
              maxWidth: double.infinity,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.grey,
                width: 2,
              ),
            ),
            child: Padding(
              padding:
              EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                    EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          textScaleFactor: MediaQuery.of(context)
                              .textScaleFactor,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'CaseID #: ',
                                style:
                                TextStyle(color: Colors.black),
                              ),
                              TextSpan(
                                text: '34021A',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0, 4, 0, 0),
                          child: Text(
                            'Code #5',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),

                      ],
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0, 0, 0, 12),
                        child: Text('Fullfilled',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontSize: 18, color: Colors.black)),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0, 12, 0, 0),
                        child: Container(
                          height: 32,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.green,
                              width: 2,
                            ),
                          ),
                          child: Align(
                            alignment:
                            AlignmentDirectional(0.00, 0.00),
                            child: Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(
                                  12, 0, 12, 0),
                              child: Text('Resolved',
                                  style: TextStyle(
                                      color: Colors.white)),
                            ),
                          ),
                        ),  
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Gap(20),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
          child: Container(
            width: double.infinity,
            constraints: BoxConstraints(
              maxWidth: double.infinity,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.grey,
                width: 2,
              ),
            ),
            child: Padding(
              padding:
              EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                    EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          textScaleFactor: MediaQuery.of(context)
                              .textScaleFactor,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'CaseID #: ',
                                style:
                                TextStyle(color: Colors.black),
                              ),
                              TextSpan(
                                text: '34021A',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0, 4, 0, 0),
                          child: Text(
                            'Code #4',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),

                      ],
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0, 0, 0, 12),
                        child: Text('Fullfilled',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontSize: 18, color: Colors.black)),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0, 12, 0, 0),
                        child: Container(
                          height: 32,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.green,
                              width: 2,
                            ),
                          ),
                          child: Align(
                            alignment:
                            AlignmentDirectional(0.00, 0.00),
                            child: Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(
                                  12, 0, 12, 0),
                              child: Text('Resolved',
                                  style: TextStyle(
                                      color: Colors.white)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Gap(20),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
          child: Container(
            width: double.infinity,
            constraints: BoxConstraints(
              maxWidth: double.infinity,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.grey,
                width: 2,
              ),
            ),
            child: Padding(
              padding:
              EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                    EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          textScaleFactor: MediaQuery.of(context)
                              .textScaleFactor,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'CaseID #: ',
                                style:
                                TextStyle(color: Colors.black),
                              ),
                              TextSpan(
                                text: '34021A',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0, 4, 0, 0),
                          child: Text(
                            'Code #3',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),

                      ],
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0, 0, 0, 12),
                        child: Text('Fullfilled',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontSize: 18, color: Colors.black)),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0, 12, 0, 0),
                        child: Container(
                          height: 32,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.green,
                              width: 2,
                            ),
                          ),
                          child: Align(
                            alignment:
                            AlignmentDirectional(0.00, 0.00),
                            child: Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(
                                  12, 0, 12, 0),
                              child: Text('Resolved',
                                  style: TextStyle(
                                      color: Colors.white)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Gap(20),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
          child: Container(
            width: double.infinity,
            constraints: BoxConstraints(
              maxWidth: double.infinity,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.grey,
                width: 2,
              ),
            ),
            child: Padding(
              padding:
              EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                    EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          textScaleFactor: MediaQuery.of(context)
                              .textScaleFactor,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'CaseID #: ',
                                style:
                                TextStyle(color: Colors.black),
                              ),
                              TextSpan(
                                text: '34021A',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0, 4, 0, 0),
                          child: Text(
                            'Case #7',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),

                      ],
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0, 0, 0, 12),
                        child: Text('Fullfilled',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontSize: 18, color: Colors.black)),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0, 12, 0, 0),
                        child: Container(
                          height: 32,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.green,
                              width: 2,
                            ),
                          ),
                          child: Align(
                            alignment:
                            AlignmentDirectional(0.00, 0.00),
                            child: Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(
                                  12, 0, 12, 0),
                              child: Text('Resolved',
                                  style: TextStyle(
                                      color: Colors.white)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Gap(20),
        ]
    )
    );
  }
}
