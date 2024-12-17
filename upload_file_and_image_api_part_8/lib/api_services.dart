import 'dart:typed_data';
import 'dart:convert'; // For JSON parsing
import 'package:http/http.dart' as http;

class ApiServices {
  Future<Map<String, dynamic>?> getUploadFile(Uint8List bytes, String filename) async {
    try {
      var url = 'https://api.escuelajs.co/api/v1/files/upload';
      var request = http.MultipartRequest('POST', Uri.parse(url));

      // Create a multipart file from the bytes
      var multipartFile = http.MultipartFile(
        'file',
        http.ByteStream.fromBytes(bytes),
        bytes.length,
        filename: filename,
      );
      request.files.add(multipartFile);

      // Send the request
      final response = await request.send();

      if (response.statusCode == 201) {
        // Parse the response body as JSON
        var responseBody = await response.stream.bytesToString();
        return jsonDecode(responseBody) as Map<String, dynamic>;
      } else {
        // Log and return null for non-201 responses
        print('Error: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      // Handle exceptions
      print('Exception in getUploadFile: $e');
      return null;
    }
  }
}
