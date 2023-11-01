
[![Flutter Community: iframe_cashpay_plugin](https://fluttercommunity.dev/_github/header/iframe_cashpay_plugin)](https://github.com/fluttercommunity/community)


# iframe_cashpay_plugin

[![pub package](https://img.shields.io/pub/v/iframe_cashpay_plugin.svg)](https://pub.dartlang.org/packages/flutter_webview_plugin)

iframe_cashpay_plugin.
A plugin to add payments iframe_cashpay to your Flutter application.

![alt iframe_cashpay_plugin](https://raw.githubusercontent.com/Mazen-Aljaradi/iframe_cashpay_plugin/main/documentation/en_US/cashb.png)

## Platform Support

| Android |
| :-----: |

## Getting Started

Before you start, create an APIs with the payment providers and follow the setup instructions:
https://documenter.getpostman.com/view/17550185/2s93XzwN9o

## Usage

To start using this plugin, add `iframe_cashpay_plugin` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/):

```yaml
dependencies:
  iframe_cashpay_plugin: ^2.0.0
```

### Example

```dart
import 'package:iframe_cashpay_plugin/iframe_cashpay_plugin.dart';
import 'package:iframe_cashpay_plugin/CashPayButton.dart';

class PaySampleAppState extends State<PaySampleApp> {
  
  Future<String> sendItems(itemList) async {
    //Send itemList for yor server and post CreateOrder.
    //iframeURL returned from Response CreateOrder
    //Documentation https://documenter.getpostman.com/view/17550185/2s93XzwN9o
    //String iframeURL = "**********************************************************";
    return iframeURL;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        backgroundColor: Colors.white,
        body: ListView(children: [
          CashPayButton(width:MediaQuery.of(context).size.width ,onTap: () async {
            await sendItems({
              {
                "itemName": "كتاب",
                "amount": 2000,
              },
              {
                "itemName": "ساعة",
                "amount": 5000,
              }
            }).then((iframeURL) => showModalBottomSheet(
                context: context,
                isDismissible: false,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30.0),
                  ),
                ),
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return Container(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 10.0),
                      height: MediaQuery.of(context).size.height * 0.7,
                      //IframeCashPay widget displays the Cash E-wallet payment iframe.
                      /// This widget IframeCashPay displays the Cash E-wallet payment iframe.
                      ///
                      /// @param iframeURL .
                      /// @param onConfirmPayment.
                      /// @param onCancel.
                      /// @param onError.
                      /// @return message onConfirmPayment or onCancel or onError.
                      ///
                      /// Example:
                      ///
                      /// ```
                      ///  IframeCashPay( iframeURL: "https://########",
                      ///    onConfirmPayment: onConfirmPayment,
                      ///    onCancel: onCancel,
                      ///    onError: onError,);
                      /// ```
                      child: IframeCashPay(
                        iframeURL: iframeURL,
                        onConfirmPayment: onConfirmPayment,
                        onCancel: onCancel,
                        onError: onError,
                      ));
                }));})
        ]));
  }

  //Await for iFrameCashPay
  onConfirmPayment(message) {
    Navigator.pop(context);
    //After Confirmatin from iFrameCashPay.
    //Here use CheckOrderStatus to check order status.
    //Documentation https://documenter.getpostman.com/view/17550185/2s93XzwN9o
  }

//Await for iFrameCashPay
  onCancel(message) {
    //After Cancel from iFrameCashPay.
    Navigator.pop(context);
  }

//Await for iFrameCashPay
  onError(message) {
    //After return Error from iFrameCashPay.
    Navigator.pop(context);
  }
}
```
