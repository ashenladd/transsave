import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../model/TransactionModel.dart';
import '../../themes/fonts.dart';

class AppRectangleBuyer extends StatelessWidget {
  // final bool isJoin;
  // final bool isPaid;
  // final bool isThereNego;
  // final bool isNegoAccepted;
  // final bool isDoneProcessed;
  // final bool isSent;
  // final bool isSentSuccess;

  final Status status;
  final Nego nego;

  const AppRectangleBuyer({
    super.key,
    required this.status,
    required this.nego,
  });

  Widget getRectangleContent() {
    if (status == Status.join && nego == Nego.negoAccepted) {
      return Column(children: [
        Text(
          'Penjual Menyetujui Nego Harga',
          style: rectangleTitleStyle,
        ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Text(
            'Segera lakukan pembayaran untuk melanjutkan proses transaksi',
            style: rectangleSubtitleStyle,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'BAYAR SEBELUM',
          style: rectangleTitle2Style,
        ),
        Text(
          '16 MEI 2023 14:35 WIB',
          style: rectangleTimeStyle,
        )
      ]);
    } else if (status == Status.join && nego == Nego.nego) {
      return Column(children: [
        Text(
          'Anda Mengajukan Nego Harga',
          style: rectangleTitleStyle,
        ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Text(
            'Menunggu persetujuan dari penjual untuk melakukan nego harga',
            style: rectangleSubtitleStyle,
            textAlign: TextAlign.center,
          ),
        ),
      ]);
    } else if (status == Status.join && nego == Nego.notNego) {
      return Column(children: [
        Text(
          'Anda Bergabung dengan Transaksi',
          style: rectangleTitleStyle,
        ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Text(
            'Sekarang anda dapat membayar pesanan,melakukan nego harga,maupun berdiskusi dengan penjual',
            style: rectangleSubtitleStyle,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'BAYAR SEBELUM',
          style: rectangleTitle2Style,
        ),
        Text(
          '16 MEI 2023 14:35 WIB',
          style: rectangleTimeStyle,
        )
      ]);
    } else if (status == Status.paid) {
      return Column(children: [
        Text(
          'Pembayaran Berhasil',
          style: rectangleTitleStyle,
        ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Text(
            'Pembayaran anda telah kami terima.Menunggu penjual memproses pesanan',
            style: rectangleSubtitleStyle,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'AKAN DIPROSES SEBELUM',
          style: rectangleTitle2Style,
        ),
        Text(
          '16 MEI 2023 14:36 WIB',
          style: rectangleTimeStyle,
        )
      ]);
    } else if (status == Status.doneProcessed) {
      return Column(children: [
        Text(
          'Pesanan Diproses Penual',
          style: rectangleTitleStyle,
        ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Text(
            'Pesananan sedang diproses oleh penjual dan pesanan akan segera dikirimkan ke anda',
            style: rectangleSubtitleStyle,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'AKAN DIKIRIM SEBELUM',
          style: rectangleTitle2Style,
        ),
        Text(
          '16 MEI 2023 14:37 WIB',
          style: rectangleTimeStyle,
        )
      ]);
    } else if (status == Status.sent) {
      return Column(children: [
        Text(
          'Pesanan Telah Dikirim Oleh Penjual',
          style: rectangleTitleStyle,
        ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Text(
            'Segera konfirmasi pesanan jika anda telah menerima pesanan,pastikan pesanan yang anda terima dalam kondisi baik.',
            style: rectangleSubtitleStyle,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'KONFIRMASI SEBELUM',
          style: rectangleTitle2Style,
        ),
        Text(
          '24 MEI 2023 14:40 WIB',
          style: rectangleTimeStyle,
        )
      ]);
    } else if (status == Status.sentSuccess) {
      return Column(children: [
        Text(
          'Anda Sudah Terima Pesanan',
          style: rectangleTitleStyle,
        ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Text(
            'Uang telah kami teruskan ke akun penjual',
            style: rectangleSubtitleStyle,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'TERIMAKASIH TELAH BERTRANSAKSI DENGAN AMAN DI TRANSAFE',
          style: rectangleTitle2Style,
          textAlign: TextAlign.center,
        ),
      ]);
    }
    return Text('');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 27, vertical: 20),
          width: 325,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: const DecorationImage(
              image: AssetImage('assets/transaction/gradient.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: getRectangleContent()),
    );
  }
}
