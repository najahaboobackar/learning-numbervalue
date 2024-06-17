import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:myapp/numberfact/numberfact.dart';

Future<Numberfact> getNumberfact({required int number}) async {
  final _response = await http.get(Uri.parse('http://numberapi.com/$number?json'));
  final _bodyJson = jsonDecode(_response.body) as Map<String, dynamic>;
  final data = Numberfact.fromJson(_bodyJson);
  return data;
}
