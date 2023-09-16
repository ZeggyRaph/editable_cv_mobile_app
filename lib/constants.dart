import 'package:flutter/material.dart';

var kContainerDecoration = BoxDecoration(
  border:  Border.all(
    color: Colors.teal,
    style: BorderStyle.solid,
    width: 2.0,
  ),
  color: Colors.white,
  borderRadius: const BorderRadius.only(
    topRight: Radius.circular(15.0),
    bottomRight: Radius.circular(15.0),
    topLeft: Radius.circular(15.0),
    bottomLeft: Radius.circular(15.0),
  ),
);
const kPaddingTextStyle = TextStyle(
  color:Colors.teal,
  fontSize: 12,
  fontWeight: FontWeight.normal,
  fontFamily:'SourceSan3',
);

const kTextStyle = TextStyle(
  color: Colors.teal,
  fontSize: 18.0,
  fontFamily: 'Candal',
);