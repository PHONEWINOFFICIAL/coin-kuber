import 'package:coin_kuber_new/routes/routes.dart';
import 'package:coin_kuber_new/widgets/custom_button.dart';
import 'package:coin_kuber_new/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class AddressPage extends StatelessWidget {
  AddressPage({Key? key}) : super(key: key);

  final AddressLogic logic = Get.put(AddressLogic());
  final AddressState state = Get.find<AddressLogic>().state;

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: Get.width,
          padding: EdgeInsets.only(
            top: 40,
            right: Get.width * 0.05,
            left: Get.width * 0.05,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Get.back(),
                    child: Image(
                      image: AssetImage('assets/arrow_back.png'),
                      width: 25,
                      height: 25,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'COIN KUBER',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Rubik',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  'Enter your payment withdraw details',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: Get.width * 0.045,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Rubik',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CustomTextForm(
                label: 'Email',
                readOnly: false,
                textAlign: TextAlign.start,
                controller: controller,
                hintText: 'Enter email',
                width: Get.width,
                height: 50,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {},
              ),
              const SizedBox(height: 20),
              CustomTextForm(
                label: 'Mobile Number',
                readOnly: false,
                textAlign: TextAlign.start,
                controller: controller,
                hintText: 'Enter your mobile number',
                width: Get.width,
                height: 50,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {},
              ),
              const SizedBox(height: 20),
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  'Select Payment Gateway',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: Get.width * 0.05,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Rubik',
                  ),
                ),
              ),
              const SizedBox(height: 10),
              PaymentDropdown(),
              const SizedBox(height: 10),
              CustomTextForm(
                label: 'UPI ID',
                showLabel: false,
                readOnly: false,
                textAlign: TextAlign.start,
                controller: controller,
                hintText: 'Enter 10 digit number',
                width: Get.width,
                height: 50,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {},
              ),
              const SizedBox(height: 20),
              CustomTextForm(
                label: 'UPI ID',
                readOnly: false,
                textAlign: TextAlign.start,
                controller: controller,
                hintText: 'Enter UPI ID',
                width: Get.width,
                height: 50,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {},
              ),
              const SizedBox(height: 20),
              CustomTextForm(
                label: 'Paypal ID',
                readOnly: false,
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 8.0),
                  child: SizedBox(
                    width: 35,
                    height: 35,
                    child: Image.asset(
                      'assets/paypal.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                textAlign: TextAlign.start,
                controller: controller,
                hintText: 'Enter Paypal ID',
                width: Get.width,
                height: 50,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {},
              ),
              const SizedBox(height: 20),
              CustomTextForm(
                label: 'Crypto ID',
                readOnly: false,
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 5),
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    width: 80,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          left: 0,
                          child: SizedBox(
                            width: 35,
                            height: 35,
                            child: Image.asset(
                              'assets/binance.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 15,
                          child: SizedBox(
                            width: 35,
                            height: 35,
                            child: Image.asset(
                              'assets/eth.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 15,
                          child: SizedBox(
                            width: 35,
                            height: 35,
                            child: Image.asset(
                              'assets/btc.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                textAlign: TextAlign.start,
                controller: controller,
                hintText: 'Enter Crypto ID',
                width: Get.width,
                height: 50,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {},
              ),
              const SizedBox(height: 20),
              CustomButton(label: 'Submit', showIcon: false, isClickable: true, onTap: () {
                Get.toNamed(AppRoutes.participated);
              },),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentDropdown extends StatefulWidget {
  const PaymentDropdown({super.key});

  @override
  _PaymentDropdownState createState() => _PaymentDropdownState();
}

class _PaymentDropdownState extends State<PaymentDropdown> {
  String? selectedPayment;

  final List<Map<String, String>> paymentOptions = [
    {
      'label': 'Paytm',
      'icon': 'assets/paytm.png',
    },
    {
      'label': 'PhonePe',
      'icon': 'assets/phonepe.png',
    },
    {
      'label': 'Google Pay',
      'icon': 'assets/gpay.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black.withOpacity(0.2)),
        borderRadius: BorderRadius.circular(8),
        color: Colors.transparent,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedPayment,
          isExpanded: true,
          icon: const Icon(Icons.arrow_drop_down),
          dropdownColor: Colors.white,
          onChanged: (String? newValue) {
            setState(() {
              selectedPayment = newValue;
            });
          },
          borderRadius: BorderRadius.circular(10),
          hint: const Text(
            'Select Your Phonepe/Paytm/Gpay Number ',
            style: TextStyle(color: Colors.grey),
          ),
          items: paymentOptions.map((option) {
            final label = option['label']!;
            final iconPath = option['icon']!;
            return DropdownMenuItem<String>(
              value: label,
              child: Row(
                children: [
                  Image.asset(
                    iconPath,
                    width: 24,
                    height: 24,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      label,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  Radio<String>(
                    value: label,
                    groupValue: selectedPayment,
                    onChanged: (value) {
                      setState(() {
                        selectedPayment = value!;
                      });
                    },
                    visualDensity: VisualDensity.compact,
                  ),
                ],
              ),
            );
          }).toList(),
          selectedItemBuilder: (BuildContext context) {
            return paymentOptions.map((option) {
              return Row(
                children: [
                  Image.asset(
                    option['icon']!,
                    width: 24,
                    height: 24,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    option['label']!,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              );
            }).toList();
          },
        ),
      ),
    );
  }
}