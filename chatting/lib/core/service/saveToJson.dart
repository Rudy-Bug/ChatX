
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'dart:convert' ;

import 'package:shared_preferences/shared_preferences.dart';  
class SaveToJson {
   String kFileName = 'abc.json';
   bool _fileExists = false;
 late File filePath;
   Future<String> get _localPath async {
    final directory = await getTemporaryDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/$kFileName');
  }
  
   void writeJson(String jsonObject, String fileName) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
await prefs.setString(fileName, jsonObject );
    // kFileName = fileName ;  
    // final filePath = await _localFile;
    // filePath.writeAsString(jsonObject);
  }

  Future<dynamic> readJson( String fileName) async {
    // Initialize _filePath
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? action = prefs.getString(fileName);
    return action ;  
    kFileName = fileName ;  
    filePath = await _localFile;
    print("ReadJson Path: $filePath");

    // 0. Check whether the _file exists
    _fileExists = await filePath.exists();
    print('0. File exists? $_fileExists'); 

    // If the _file exists->read it: update initialized _json by what's in the _file
    if (_fileExists) {
      try {
        //1. Read _jsonString<String> from the _file.
        final jsonString = await filePath.readAsString();
        print('Database JSON: $jsonString');
          // final jsonDecode =   jsonDecode(jsonString) ;  
        //2. Update initialized _json by converting _jsonString<String>->_json<Map>
        // _json = jsonDecode(_jsonString);
        // print('2.(_readJson) _json: $_json \n - \n');
        return jsonString ;  
      } catch (e) {
        // Print exception errors
        print('Tried reading _file error: $e');
        // If encountering an error, return null
      }
    }
  }

}