abstract class PaymentStates{}
class InitialState extends PaymentStates{}

/////////  first Token
class LoadingPaymentState extends PaymentStates{}

class SuccessPaymentState extends PaymentStates{}

class ErrorPaymentState extends PaymentStates{
  String error;
  ErrorPaymentState({required this.error});

}

////////////  Order Id
class LoadingOrderIdState extends PaymentStates{}

class SuccessOrderIdState extends PaymentStates{}

class ErrorOrderIdState extends PaymentStates{
  String error;
  ErrorOrderIdState({required this.error});

}



