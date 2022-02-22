import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;
import 'dart:io';

class WordAPI {
  Future<String> getWord() async {
    var url = Uri.parse(
        'https://ja.wikipedia.org/wiki/%E7%89%B9%E5%88%A5:%E3%81%8A%E3%81%BE%E3%81%8B%E3%81%9B%E8%A1%A8%E7%A4%BA');

    String word = "";

    while (word.length == 0 || word.length > 6) {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        final document = parse(response.body);
        String? rawTitle = document.querySelector('title')?.text;
        word = rawTitle?.substring(0, rawTitle.indexOf(" -")) ?? "";
        print(word);
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
      await new Future.delayed(new Duration(seconds: 1));
    }

    return word;
  }
}
