import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:transsave/themes/color.dart';
import 'package:transsave/widgets/auth/AppButton.dart';
import 'package:transsave/widgets/transaction/AppDarkContainer.dart';
import 'package:transsave/widgets/transaction/AppJoinCodeContainer.dart';
import 'package:transsave/widgets/transaction/AppTileItem.dart';
import 'package:transsave/widgets/transaction/AppTransactionStep.dart';
import 'package:transsave/widgets/transaction/CustomAppBar.dart';

import '../../../themes/fonts.dart';
import '../../../widgets/transaction/AppChatContainer.dart';
import '../../../widgets/transaction/AppChoiceButton.dart';
import '../../../widgets/transaction/AppRectangle.dart';

class TransaksiFirstStep extends StatefulWidget {
  const TransaksiFirstStep({super.key});

  @override
  State<TransaksiFirstStep> createState() => _TransaksiFirstStepState();
}

class _TransaksiFirstStepState extends State<TransaksiFirstStep> {
  @override
  Widget build(BuildContext context) {
    bool isJoin = true;
    bool isPaid = true;
    bool isThereNego = true;
    bool isDoneProcessed = false;
    bool isSent = false;
    bool isSentSuccess = false;
    bool isTransactionSuccess = false;

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Transaksi',
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTransactionStep(
                isJoin: isJoin,
                isPaid: isPaid,
                isDoneProcessed: isDoneProcessed,
                isSent: isSent,
                isSentSuccess: isSentSuccess,
                isTransactionSuccess: isTransactionSuccess),
            SizedBox(
              height: 20,
            ),
            AppRectangle(
                isJoin: isJoin,
                isPaid: isPaid,
                isThereNego: isThereNego,
                isDoneProcessed: isDoneProcessed,
                isSent: isSent,
                isSentSuccess: isSentSuccess,
                isTransactionSuccess: isTransactionSuccess),
            SizedBox(
              height: 25,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 27),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Barang Pembelian',
                    style: mainStyle.copyWith(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  AppTileItem(),
                  SizedBox(
                    height: 34,
                  ),
                  Center(
                    child: AppJoinCodeContainer(
                      code: 'A52PX2',
                    ),
                  ),
                  SizedBox(
                    height: 34,
                  ),
                  isJoin && !isPaid & isThereNego
                      ? AppDarkContainer(
                          isJoin: isJoin,
                          isPaid: isPaid,
                          isThereNego: isThereNego)
                      : Container(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Nego Harga',
                                    style: subtitleStyle2.copyWith(
                                      color: Colors.black.withOpacity(0.4),
                                    ),
                                  ),
                                  Text(
                                    'Aktif',
                                    style: subtitleStyle2.copyWith(
                                        color: Colors.black),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Ongkos Kirim',
                                    style: subtitleStyle2.copyWith(
                                      color: Colors.black.withOpacity(0.4),
                                    ),
                                  ),
                                  Text(
                                    'Rp. 0',
                                    style: subtitleStyle2.copyWith(
                                        color: Colors.black),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Berat',
                                    style: subtitleStyle2.copyWith(
                                      color: Colors.black.withOpacity(0.4),
                                    ),
                                  ),
                                  Text(
                                    '0 gram',
                                    style: subtitleStyle2.copyWith(
                                        color: Colors.black),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                  SizedBox(
                    height: 27,
                  ),
                  isJoin && !isPaid & isThereNego
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppChoiceButton(
                              isAgree: true,
                            ),
                            AppChoiceButton(
                              isAgree: false,
                            ),
                            AppChatContainer(
                              isActive: true,
                            )
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppButton(
                              text: 'BAGIKAN KODE',
                              width: 233,
                            ),
                            AppChatContainer(
                              isActive: true,
                            )
                          ],
                        ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
