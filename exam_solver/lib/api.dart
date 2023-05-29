import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

Future<WolframSolution> getSolution(String cloudUri) async {
  final response = await http.get(Uri.parse(cloudUri));

  if (response.statusCode == 200) {
    return WolframSolution.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to connect!');
  }
}

class WolframSolution {
  final bool success;
  final double timing;
  final String result;
  final List<dynamic> message;

  const WolframSolution({
    required this.success,
    required this.timing,
    required this.result,
    required this.message,
  });

  factory WolframSolution.fromJson(Map<String, dynamic> json) {
    return WolframSolution(
        success: json['Success'],
        timing: json['Timing'],
        result: json['Result'],
        message: json['Messages']);
  }
}
