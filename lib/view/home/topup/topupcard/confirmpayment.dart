import 'package:flutter/material.dart';
import 'package:wargaku/view/bottombar/bottombar.dart';
import 'package:wargaku/view/card/inoutpayment.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/button.dart';
import '../../../utils/colornotifire.dart';
import '../../../utils/media.dart';
import '../../../utils/string.dart';

class ConfirmPayment extends StatefulWidget {
  const ConfirmPayment({super.key});

  @override
  State<ConfirmPayment> createState() => _ConfirmPaymentState();
}

class _ConfirmPaymentState extends State<ConfirmPayment> {
  late ColorNotifire notifire;

  getdarkmodepreviousstate() async {
    final prefs = await SharedPreferences.getInstance();
    bool? previusstate = prefs.getBool("setIsDark");
    notifire.setIsDark = previusstate;
    }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: notifire.getdarkscolor),
        centerTitle: true,
        backgroundColor: notifire.getprimerycolor,
        elevation: 0,
        title: Text(
          CustomStrings.confirmpayment,
          style: TextStyle(
              fontFamily: 'Gilroy Bold',
              fontSize: height / 40,
              color: notifire.getdarkscolor),
        ),
      ),
      backgroundColor: notifire.getprimerycolor,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: height / 20),
            Text(
              CustomStrings.enteryourpin,
              style: TextStyle(
                  fontFamily: 'Gilroy Bold',
                  fontSize: height / 30,
                  color: notifire.getdarkscolor),
            ),
            SizedBox(height: height / 80),
            Text(
              CustomStrings.pleasepayment,
              style: TextStyle(
                color: notifire.getdarkgreycolor,
                fontFamily: 'Gilroy Medium',
                fontSize: height / 60,
              ),
            ),
            SizedBox(height: height / 30),
            animatedBorders(),
            SizedBox(height: height / 1.8),
            GestureDetector(
              onTap: () {
                _showMyDialog();
              },
              child: Custombutton.button(notifire.getbluecolor,
                  CustomStrings.confirmpayment, width / 1.1),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(32.0),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: notifire.gettabwhitecolor,
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            height: height / 2,
            child: Column(
              children: [
                SizedBox(
                  height: height / 40,
                ),
                Image.asset(
                  "images/paymentsuccess.png",
                  height: height / 5,
                ),
                SizedBox(
                  height: height / 40,
                ),
                Text(
                  CustomStrings.paymentsuccessful,
                  style: TextStyle(
                    color: notifire.getbluecolor,
                    fontFamily: 'Gilroy Bold',
                    fontSize: height / 40,
                  ),
                ),
                SizedBox(
                  height: height / 100,
                ),
                Text(
                  CustomStrings.paying,
                  style: TextStyle(
                    color: notifire.getdarkgreycolor,
                    fontFamily: 'Gilroy Bold',
                    fontSize: height / 60,
                  ),
                ),
                SizedBox(
                  height: height / 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const InOutPayment(),
                      ),
                    );
                  },
                  child: buttons(notifire.getbluecolor,
                      CustomStrings.viewreceipt, Colors.white),
                ),
                SizedBox(
                  height: height / 60,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Bottombar(),
                      ),
                    );
                  },
                  child: buttons(const Color(0xffd3d3d3), CustomStrings.home,
                      notifire.getbluecolor),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buttons(clr, txt, clr2) {
    return Container(
      height: height / 20,
      width: width / 2,
      decoration: BoxDecoration(
        color: clr,
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: Center(
        child: Text(
          txt,
          style: TextStyle(
              color: clr2, fontSize: height / 60, fontFamily: 'Gilroy Bold'),
        ),
      ),
    );
  }

  Widget animatedBorders() {
    return Container(
      color: notifire.getprimerycolor,
      height: height / 14,
      width: width / 1.2,
      child: OTPTextField(
          // controller: otpController,
          length: 4,
          width: MediaQuery.of(context).size.width,
          textFieldAlignment: MainAxisAlignment.spaceAround,
          otpFieldStyle: OtpFieldStyle(
            enabledBorderColor: Colors.grey.withOpacity(0.4),
            borderColor: Colors.grey.withOpacity(0.4),
          ),
          fieldWidth: 50,
          fieldStyle: FieldStyle.box,
          outlineBorderRadius: 15,
          style: TextStyle(fontSize: 17, color: notifire.getdarkscolor),
          onChanged: (pin) {},
          onCompleted: (pin) {}),
    );
  }
}
