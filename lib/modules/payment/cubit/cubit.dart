import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/modules/payment/cubit/states.dart';
import '../../../shared/components/constant.dart';
import '../../../shared/network/dio_helper.dart';

class PaymentCubit extends Cubit<PaymentStates> {
  PaymentCubit() : super(InitialState());
  static PaymentCubit get(context) => BlocProvider.of(context);

  Future getFistToken() async {
    emit(LoadingPaymentState());
    try {
      var response = await DioHelperPayment.postData(
          url: 'auth/tokens', data: {"api_key": AppConst.paymobApikey});
      AppConst.paymobFirstToken = response.data["token"].toString();
      getOrderId(price: '50000');
      print('token ${AppConst.paymobFirstToken}');

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

      AppConst.orderId = response.data['id'].toString();

      print('Order Id1:${AppConst.orderId}');

      print('Order Id2:${response.data['id']}');

      emit(SuccessOrderIdState());
    } catch (e) {
      emit(ErrorOrderIdState(error: e.toString()));
      print('error$e');
    }
  }
}
