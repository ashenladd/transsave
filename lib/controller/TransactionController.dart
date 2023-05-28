import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:transsave/controller/ProductController.dart';
import 'package:transsave/model/TransactionModel.dart';
import 'package:transsave/services/SecureStorageService.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../constant/api.dart';
import '../model/ProductModel.dart';

class TransactionController extends GetxController {
  List<Transaction> _transactions = [];
  List<Transaction> get allTransactions => _transactions;

  @override
  void onInit() {
    super.onInit();
    setTransactions();
  }

  //Ganti dengan API
  Future<void> setTransactions() async {
    final token = await SecureStorageService.readAllValue();
    final accessToken = token['accessToken'];
    final user_id = token['user_id'];
    print(accessToken);
    String url = APIService.base + APIService.transactions + '$user_id!';
    print("url ${url}");

    final response = await http.get(
      Uri.parse(url),
      headers: {"X-Auth": "Bearer $accessToken"},
    );
    print('Respon ${response.body}');
    if (response.statusCode == 200) {
      final Map<String, dynamic> result = json.decode(response.body);
      if (result['data']['results'] != null) {
        final List<dynamic> responseData = result['data']['results'];

        final List<Transaction> data = responseData
            .map((transactionJson) => Transaction.fromJson(transactionJson))
            .toList();
        print(responseData);
        _transactions = data;
      }

      // _transactions = result;
    }
    update();
  }

  //Method add transaction
  Future<Transaction> addTransaction(Map<String, dynamic> data) async {
    final token = await SecureStorageService.readAllValue();
    final accessToken = token['accessToken'];
    const String url = '${APIService.base}/transaction';
    final request = http.MultipartRequest(
      'POST',
      Uri.parse(url),
    );
    print('url:$url');
    request.fields['category'] = data['category'];
    request.fields['name'] = data['name'];
    request.fields['desc'] = data['desc'];
    request.fields['price'] = data['price'];
    request.fields['negotiable'] = data['negotiable'];
    request.fields['shipping_fee'] = data['shipping_fee'].toString();
    request.fields['weight'] = data['weight'].toString();
    request.fields['tax'] = data['tax'].toString();
    request.headers['Content-Type'] = 'multipart/form-data';
    request.headers['X-Auth'] = "Bearer $accessToken";
    print('data: $data');
    var file = await http.MultipartFile.fromPath('images', data['images'].path,
        contentType: MediaType("image", "jpeg"));
    request.files.add(file);

    final response = await request.send();
    if (response.statusCode == 200) {
      final jsonResponse = await response.stream.bytesToString();
      final decodedResponse = jsonDecode(jsonResponse);

      // Lakukan sesuatu dengan decodedResponse
      print("decode: ${decodedResponse}");
      await setTransactions();
      print(
          "decode2: ${Transaction.fromJson(decodedResponse['data']['transaction'])}");
      update();
      return (Transaction.fromJson(decodedResponse['data']['transaction']));
    } else {
      print('Request failed with status: ${response.statusCode} ');
      final jsonResponse = await response.stream.bytesToString();
      final decodedResponse = jsonDecode(jsonResponse);
      print("decode: ${decodedResponse}");
      throw Exception('Failed to add transaction');
    }
  }

  //Method get transaction by id
  Transaction getTransactionById(String id) {
    return _transactions.firstWhere((transaction) => transaction.id == id);
  }

  //Method get transaction by room
  Transaction getTransactionByRoomId(String id) {
    return _transactions.firstWhere((transaction) => transaction.room.id == id);
  }

  //Method update transaction status
  void updateTransactionStatus(String id, Status status) {
    Transaction transaction = getTransactionById(id);
    transaction.status = status;
    update();
  }
}
