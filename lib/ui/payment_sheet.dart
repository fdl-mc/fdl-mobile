import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freedomland/constants/pallettes.dart';
import 'package:freedomland/controller/payement_controller.dart';
import 'package:freedomland/ui/general/bottom_sheet_page.dart';
import 'package:freedomland/ui/general/gradient_button.dart';
import 'package:get/get.dart';

class PaymentSheet extends GetView<PaymentController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return BottomSheetPage(
          height: 330,
          child: Scrollbar(
            thickness: 2,
            child: ListView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
              children: [
                Row(
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Перевести на другой счёт',
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                        )),
                    Spacer(),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                          onPressed: () {
                            Get.close(0);
                          },
                          icon: Icon(
                            Icons.close,
                            color: Colors.black54,
                          )),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 16)),
                TextFormField(
                  keyboardType: TextInputType.name,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp('([A-Za-z0-9\_]+)'),
                    ),
                    LengthLimitingTextInputFormatter(16),
                  ],
                  controller: controller.usernameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.person_outline_outlined,
                    ),
                    labelText: 'Получатель',
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 16)),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: controller.amountController,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.paid_outlined),
                    labelText: 'Сумма',
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 32)),
                ConstrainedBox(
                  constraints: BoxConstraints.tightFor(
                      width: double.infinity, height: 48),
                  child: GradientButton(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [primaryP.shade800, primaryP.shade400],
                    ),
                    onPressed: controller.fetching ? null : controller.pay,
                    child: controller.fetching
                        ? Padding(
                            padding: EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 18,
                              height: 18,
                              child: CircularProgressIndicator(
                                color: Colors.white38,
                              ),
                            ),
                          )
                        : Text('Перевести'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
