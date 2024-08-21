import 'dart:convert';
import 'package:http/http.dart' as http;

class ChapaService {
  final String apiUrl = 'https://api.chapa.co/v1/subaccount';
  final String apiKey = 'CHAPUBK_TEST-ovnI70zhsCmbk6CveypshZb2n51HlUw4';

  Future<void> createSubAccount({
    required String businessName,
    required String accountName,
    required String bankCode,
    required String accountNumber,
    required double splitValue,
    required String splitType,
  }) async {
    var headers = {
      'Authorization': 'Bearer $apiKey',
      'Content-Type': 'application/json',
    };

    var requestBody = json.encode({
      "business_name": businessName,
      "account_name": accountName,
      "bank_code": bankCode,
      "account_number": accountNumber,
      "split_value": splitValue,
      "split_type": splitType,
    });

    var request = http.Request('POST', Uri.parse(apiUrl));
    request.body = requestBody;
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responseString = await response.stream.bytesToString();
      print(responseString);
    } else {
      print('Failed to create subaccount: ${response.reasonPhrase}');
    }
  }
}
