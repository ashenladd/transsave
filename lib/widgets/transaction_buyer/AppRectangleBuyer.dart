import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../themes/fonts.dart';

class AppRectangleBuyer extends StatelessWidget {
  final bool isJoin;
  final bool isPaid;
  final bool isThereNego;
  final bool isNegoAccepted;
  final bool isDoneProcessed;
  final bool isSent;
  final bool isSentSuccess;
  final bool isTransactionSuccess;

  const AppRectangleBuyer({
    super.key,
    required this.isJoin,
    required this.isPaid,
    required this.isThereNego,
    required this.isNegoAccepted,
    required this.isDoneProcessed,
    required this.isSent,
    required this.isSentSuccess,
    required this.isTransactionSuccess,
  });

  Widget getRectangleContent() {
    if (isJoin && !isPaid && !isThereNego && isNegoAccepted) {
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
    } else if (isJoin && !isPaid & isThereNego) {
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
    } else if (isJoin && !isPaid && !isThereNego) {
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
    } else if (isJoin && isPaid && !isDoneProcessed) {
      return Column(children: [
        Text(
          'Pembeli Sudah Baffyar',
          style: rectangleTitleStyle,
        ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Text(
            'Kami sudah menerima pembayaran dari pembeli ,saatnya penjual memproses pesanan',
            style: rectangleSubtitleStyle,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'PROSES SEBELUM',
          style: rectangleTitle2Style,
        ),
        Text(
          '16 MEI 2023 14:36 WIB',
          style: rectangleTimeStyle,
        )
      ]);
    } else if (isJoin && isPaid && isDoneProcessed && !isSent) {
      return Column(children: [
        Text(
          'Berhasil Proses Transaksi',
          style: rectangleTitleStyle,
        ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Text(
            'Saatnya kirim pesanan ke pembeli.Pastikan pesanan sudah benar dan alamat kirim sudah sesuai',
            style: rectangleSubtitleStyle,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'KIRIM SEBELUM',
          style: rectangleTitle2Style,
        ),
        Text(
          '16 MEI 2023 14:37 WIB',
          style: rectangleTimeStyle,
        )
      ]);
    } else if (isJoin &&
        isPaid &&
        isDoneProcessed &&
        isSent &&
        !isSentSuccess) {
      return Column(children: [
        Text(
          'Pesanan Berhasil Dikirim',
          style: rectangleTitleStyle,
        ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Text(
            'Uang akan kami teruskan ke akun anda setelah pembeli konfirmasi pesanan.',
            style: rectangleSubtitleStyle,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'BATAS KONFIRMASI TERIMA PESANAN',
          style: rectangleTitle2Style,
        ),
        Text(
          '24 MEI 2023 14:40 WIB',
          style: rectangleTimeStyle,
        )
      ]);
    } else if (isJoin && isPaid && isDoneProcessed && isSent && isSentSuccess) {
      return Column(children: [
        Text(
          'Pembeli Sudah Terima Pesanan',
          style: rectangleTitleStyle,
        ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Text(
            'Uang telah kami teruskan ke akun anda',
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
