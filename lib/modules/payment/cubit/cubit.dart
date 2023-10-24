
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/modules/payment/cubit/states.dart';
import '../../../shared/components/constant.dart';
import '../../../shared/network/dio_helper.dart';

class PaymentCubit extends Cubit<PaymentStates> {
  PaymentCubit() : super(InitialState());
  static PaymentCubit get(context) => BlocProvider.of(context);

  Future getFistToken({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String price,
  }) async {
    emit(LoadingPaymentState());
    try {
      var response = await DioHelperPayment.postData(
          url: 'auth/tokens', data: {"api_key": AppConst.paymobApikey});
      AppConst.paymobFirstToken = response.data["token"].toString();
      getOrderId(price: price);
      requestToken(
          firstName: firstName,
          lastName: lastName,
          email: email,
          phone: phone,
          price: price);
      getKiosk();
      emit(SuccessPaymentState());
    } catch (e) {
      print('error$e');
      emit(ErrorPaymentState(error: e.toString()));
    }
  }

  Future getOrderId({
    required String price,
  }) async {
    emit(LoadingOrderIdState());
    try {
      var response =
          await DioHelperPayment.postData(url: 'ecommerce/orders', data: {
        "auth_token": AppConst.paymobFirstToken,
        "delivery_needed": "false",
        "amount_cents": price,
        "currency": "EGP",
        "items": [],
      });

      AppConst.orderId = response.data['id'];

      print('Order Id1:${AppConst.orderId}');

      emit(SuccessOrderIdState());
    } catch (e) {
      emit(ErrorOrderIdState(error: e.toString()));
      print('error$e');
    }
  }

  Future requestToken({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String price,
  }) async {
    emit(LoadingRequestTokenState());

    DioHelperPayment.postData(url: 'acceptance/payment_keys', data: {
      "auth_token": AppConst.paymobFirstToken,
      "amount_cents": price,
      "expiration": 36050,
      "order_id": AppConst.orderId,
      "billing_data": {
        "apartment": "NA",
        "email": email,
        "floor": "NA",
        "first_name": firstName,
        "street": "NA",
        "building": "NA",
        "phone_number": phone,
        "shipping_method": "NA",
        "postal_code": "NA",
        "city": "NA",
        "country": "NA",
        "last_name": lastName,
        "state": "NA"
      },
      "currency": "EGP",
      "integration_id": AppConst.integrationIdCard,
      "lock_order_when_paid": "false"
    }).then((value) {
      AppConst.finalTokenCard = value.data["token"].toString();
      print('Request Token :${AppConst.finalTokenCard}');

      emit(SuccessRequestTokenState());
    }).catchError((e) {
      print('error is : $e');
      emit(ErrorRequestTokenState(error: e));
    });
  }

  Future getKiosk() async {
    emit(LoadingKioskState());
    try {
      var response = await DioHelperPayment.postData(
          url: 'acceptance/payments/pay',
          data: {
            "source": {"identifier": "AGGREGATOR", "subtype": "AGGREGATOR"},
            "payment_token": AppConst.finalTokenCard
          });
      AppConst.refCode = response.data['id'].toString();
      emit(SuccessKioskState());
    } catch (e) {
      emit(ErrorKioskState(error: e.toString()));
      print('error$e');
    }
  }
}
