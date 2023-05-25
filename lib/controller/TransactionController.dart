import 'package:get/get.dart';
import 'package:transsave/model/TransactionModel.dart';

class TransactionController extends GetxController {
  List<Transaction> _transactions = [];
  List<Transaction> get allTransactions => _transactions;

  @override
  void onInit() {
    super.onInit();
    setTransactions();
  }

  //Ganti dengan API
  void setTransactions() {
    _transactions = dummyTransaction;
    update();
  }

  //Method add transaction
  void addTransaction(Transaction transaction) {
    _transactions.add(transaction);
    update();
  }

  //Method get transaction by id
  Transaction getTransactionById(int id) {
    return _transactions.firstWhere((transaction) => transaction.id == id);
  }

  //Method get transaction by room id
  Transaction getTransactionByRoomId(int id) {
    return _transactions.firstWhere((transaction) => transaction.roomId == id);
  }
}
