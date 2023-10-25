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

////////////  request token 
class LoadingRequestTokenState extends PaymentStates{}

class SuccessRequestTokenState extends PaymentStates{}

class ErrorRequestTokenState extends PaymentStates{
  String error;
  ErrorRequestTokenState({required this.error});
}

////////////  Kiosk
class LoadingKioskState extends PaymentStates{}

class SuccessKioskState extends PaymentStates{}

class ErrorKioskState extends PaymentStates{
  String error;
  ErrorKioskState({required this.error});
}




