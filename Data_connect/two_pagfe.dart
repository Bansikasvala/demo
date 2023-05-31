// import 'package:flutter/material.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';
//
// class pagew375 extends StatefulWidget {
//   const pagew375({Key? key}) : super(key: key);
//
//   @override
//   State<pagew375> createState() => _pagew375State();
// }
//
// class _pagew375State extends State<pagew375> {
//   final razorpay = Razorpay();
//
//   @override
//   void initState() {
//     super.initState();
//
//     razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
//     razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerErrorFailure);
//   }
//
//   void handlerPaymentSuccess() {
//     print("Pament success");
//   }
//
//   void handlerErrorFailure() {
//     print("Pament error");
//   }
//
//   @override
//   dispose() {
//     razorpay.clear();
//     super.dispose();
//     print("External Wallet");
//   }
//
//   // conter  cont12 = Get.put(conter());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           ElevatedButton(
//               onPressed: () {
//                 var options = {
//                   'key': 'rzp_test_yku38SaIcujRTg',
//                   'amount': 100,
//                   'name': 'Acme Corp.',
//                   'description': 'Fine T-Shirt',
//                    'prefill': {
//                     'contact': '8888888888',
//                     'email': 'test@razorpay.com'
//                   }
//                 };
//                 razorpay.open(options);
//               },
//               child: Text("Payment")),
//         ],
//       ),
//     );
//   }
// }
