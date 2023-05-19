import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../themes/fonts.dart';

class AppRectangle extends StatelessWidget {
  final bool isJoin;
  final bool isPaid;
  final bool isThereNego;
  final bool isDoneProcessed;
  final bool isSent;
  final bool isSentSuccess;
  final bool isTransactionSuccess;

  const AppRectangle(
      {super.key,
      required this.isJoin,
      required this.isPaid,
      required this.isThereNego,
      required this.isDoneProcessed,
      required this.isSent,
      required this.isSentSuccess,
      required this.isTransactionSuccess});

  Widget getRectangleContent() {
    if (!isJoin) {
      return Column(children: [
        Text(
          'Pembeli Belum Bergabung',
          style: rectangleTitleStyle,
        ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 33),
          child: Text(
            'Silahkan salin kode join dan bagikan kode join ke pembeli',
            style: rectangleSubtitleStyle,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'BATAS GABUNG',
          style: rectangleTitle2Style,
        ),
        Text(
          '16 MEI 2023 14:30 WIB',
          style: rectangleTimeStyle,
        )
      ]);
    } else if (isJoin && !isPaid & isThereNego) {
      return Column(children: [
        Text(
          'Pembeli Belum Bayar',
          style: rectangleTitleStyle,
        ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Pembeli mengajukan nego harga,setujui atau tolak penawaran dari pembeli untuk melanjutkan proses transaksi.',
            style: rectangleSubtitleStyle,
            textAlign: TextAlign.center,
          ),
        ),
      ]);
    } else if (isJoin && !isPaid) {
      return Column(children: [
        Text(
          'Pembeli Belum Bayar',
          style: rectangleTitleStyle,
        ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 33),
          child: Text(
            'Pembeli sudah bergabung dengan transaksi.Namun belum melakukan pembayaran',
            style: rectangleSubtitleStyle,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'BATAS PEMBAYARAN',
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
          'Pembeli Sudah Bayar',
          style: rectangleTitleStyle,
        ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 33),
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
          padding: const EdgeInsets.symmetric(horizontal: 33),
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
          padding: const EdgeInsets.symmetric(horizontal: 33),
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
          padding: const EdgeInsets.symmetric(horizontal: 33),
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
        ),
      ]);
    }
    return Text('');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 27, vertical: 14),
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
