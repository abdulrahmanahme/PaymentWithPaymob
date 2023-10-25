import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/modules/cubit/states.dart';
import '../../shared/components/constant.dart';
import '../../shared/network/dio_helper.dart';

class PaymentCubit extends Cubit<PaymentStates> {
  PaymentCubit() : super(InitialState());
  static PaymentCubit get(context) => BlocProvider.of(context);

  Future getFistToken(
   
  ) async {
    emit(LoadingPaymentState());
    try {
      var response = await DioHelperPayment.postData(
          url: AppConst.getAuthToken, data: {"api_key": AppConst.paymobApikey});
      AppConst.paymobFirstToken = response.data["token"].toString();
      print('first ${AppConst.paymobFirstToken}');
     
      emit(SuccessPaymentState());
    } catch (e) {
      print('error$e');
      emit(ErrorPaymentState(error: e.toString()));
    }
  }

  Future getOrderId({
     required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String price,
  }) async {
    emit(LoadingOrderIdState());

    DioHelperPayment.postData(url: AppConst.getOrderId, data: {
      "auth_token": AppConst.paymobFirstToken,
      "delivery_needed": "false",
      "amount_cents": price,
      "currency": "EGP",
      "items": [],
    }).then((value) {
      // AppConst.orderId = response.data['id'];
      print('Order Id1:${value.data}');
requestToken(firstName: firstName,lastName: lastName,email: email,phone: phone,price: price);
      emit(SuccessOrderIdState());
    }).catchError((e) {
      emit(ErrorOrderIdState(error: e.toString()));
      print('error$e');
    });
  }


   Future getKiosk() async {
    emit(LoadingKioskState());
    try {
      var response =
          await DioHelperPayment.postData(url: AppConst.getRefCode, data: {
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


  Future requestToken({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String price,
  }) async {
    emit(LoadingRequestTokenState());

    DioHelperPayment.postData(url: AppConst.getPaymentRequest, data: {
      "auth_token": AppConst.paymobFirstToken,
      "amount_cents": price,
      "expiration": 36050,
      "order_id": 159620414,
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

 
}