# iframe_cashpay_plugin

iframe_cashpay_plugin.
A plugin to add payments Cash E-wallet to your flutter application.

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
  iframe_cashpay_plugin: ^1.0.4
```

### Example

```dart
import 'package:iframe_cashpay_plugin/iframe_cashpay_plugin.dart';

class PaySampleAppState extends State<PaySampleApp> {

  Future<String> sendItems(itemList) async {
    //Send itemList for yor server and post CreateOrder.
    //iframeURL returned from Response CreateOrder
    //Documentation https://documenter.getpostman.com/view/17550185/2s93XzwN9o
    String iframeURL = "https://############################################";
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
          ElevatedButton(
              child: const Text('الدفع عبر كاش باي'),
              onPressed: () async {
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
                          //IframeCashPay SDK to use iFrame CashPay
                          child: IframeCashPay(
                            iframeURL: iframeURL,
                            onConfirmPayment: onConfirmPayment,
                            onCancel: onCancel,
                            onError: onError,
                          ));
                    }));
              }),
        ]));
  }

//Function callback onConfirmPayment
  onConfirmPayment(message) {
    Navigator.pop(context);
    //After Confirmatin from iFrameCashPay.
    //Here use CheckOrderStatus on your server to check order status.
    //Documentation https://documenter.getpostman.com/view/17550185/2s93XzwN9o
  }

//Function callback onCancel
  onCancel(message) {
    //After Cancel from iFrameCashPay.
    Navigator.pop(context);
  }

//Function callback onError
  onError(message) {
    //After return Error from iFrameCashPay.
    Navigator.pop(context);
  }
}
```
