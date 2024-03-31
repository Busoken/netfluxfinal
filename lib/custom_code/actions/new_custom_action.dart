// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
Future newCustomAction() async {
  // Get the id of the lastest element in the list of PageView1 where the data is being queried
// Assuming that the list of PageView1 is stored in a database or API
// and can be accessed through a function called getPageView1Data()

  List<PageView1> pageView1List = await getPageView1Data();

  // Sort the list in descending order based on the id
  pageView1List.sort((a, b) => b.id.compareTo(a.id));

  // Return the id of the first element in the sorted list
  return pageView1List.isNotEmpty ? pageView1List.first.id : null;
}
