import 'package:atele_online/core/utils/app_strings.dart';
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

abstract class PaymentManager {
  /* fun to take amount of money and the currency type that user need and to do the process */
  static Future<void> MakePayment(int amount, String currency) async {
    try {
      String ClientSecret = await _getclientSecret((amount * 1).toString(),
          currency); //(amount*100).toString() cuz stripe take the ammount and devided by 100 and the function getclient takes the ammount as string
   await _initializedPaymentSheet(ClientSecret);
   await Stripe.instance.presentPaymentSheet();//show payment sheet
    } catch (error) {

      throw Exception(error.toString());
    
    }
  }




  static Future<void> _initializedPaymentSheet(String ClientSecret) async
  {
   await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: ClientSecret,
            merchantDisplayName: /* buisness name dont care if test but must have a value */
                ' Omar '));
  }

  static Future<String> _getclientSecret(String amount, String currency) async {
    Dio dio = Dio();
    var response = await dio.post(
      'https://api.stripe.com/v1/payment_intents', //endpoint or url that create the payment intent
      options: Options(
        headers: {
          'Authorization':
              'Bearer ${AppStrings.SecretKey}', //that tells that you have privellage to access stripe to crate intents
          'Content-Type':
              'application/x-www-form-urlencoded' //then give it this
        },
      ),
      data: {
        //the body
        'amount': amount, //must string when call .toint
        'currency': currency, //must string
      },
    );
    return response.data['client_secret'];
  }
}
