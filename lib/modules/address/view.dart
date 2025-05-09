import 'package:coin_kuber_new/routes/routes.dart';
import 'package:coin_kuber_new/widgets/custom_button.dart';
import 'package:coin_kuber_new/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'logic.dart';
import 'state.dart';

String? selectedPayment;

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  final AddressLogic logic = Get.put(AddressLogic());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AddressState state = Get.find<AddressLogic>().state;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController paymentNumberController = TextEditingController();
  final TextEditingController upiIdController = TextEditingController();
  final TextEditingController paypalIdController = TextEditingController();
  final TextEditingController cryptoIdController = TextEditingController();

  void onChangedEmail(String value) {
    setState(() {});
  }

  void onChangedPaymentNumber(String value) {
    setState(() {});
  }

  void onChangedUpiId(String value) {
    setState(() {});
  }

  void onChangedPaypalId(String value) {
    setState(() {});
  }

  void onChangedCryptoId(String value) {
    setState(() {});
  }

  void onChangedMobileNumber(String value) {
    setState(() {});
  }

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return '';
    }
    return null;
  }

  String? validateMobileNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return '';
    }

    if (value.length != 10) {
      return '';
    }
    return null;
  }

  String? validatePaymentMethod(String? value) {
    if (value == null || value.trim().isEmpty) {
      final upiPattern = RegExp(r'^[\w.-]+@[\w.-]+$');
      if (!upiPattern.hasMatch(value!)) {
        return 'Please enter a valid UPI ID.';
      }
    }

    return null;
  }

  bool _isButtonClickable() {
    final bool isFormValid = _formKey.currentState?.validate() ?? false;

    return isFormValid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: Get.width,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/bg_one.png'), fit: BoxFit.cover)
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40,),
              Padding(
                padding: EdgeInsets.only(
                  right: Get.width * 0.05,
                  left: Get.width * 0.05,
                ),
                child: Row(
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
              ),
              const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(
                  right: Get.width * 0.05,
                  left: Get.width * 0.05,
                ),
                child: Center(
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
              ),
              const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(
                  right: Get.width * 0.05,
                  left: Get.width * 0.05,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextForm(
                        label: 'Email',
                        readOnly: false,
                        textAlign: TextAlign.start,
                        controller: emailController,
                        hintText: 'Enter email',
                        width: Get.width,
                        height: 50,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: onChangedEmail,
                        validator: (v) => validateEmail(emailController.text),
                      ),
                      const SizedBox(height: 20),
                      CustomTextForm(
                        label: 'Mobile Number',
                        readOnly: false,
                        textAlign: TextAlign.start,
                        controller: numberController,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        hintText: 'Enter your mobile number',
                        width: Get.width,
                        height: 50,
                        maxLength: 10,
                        keyboardType: TextInputType.number,
                        onChanged: onChangedMobileNumber,
                        validator:
                            (v) => validateMobileNumber(numberController.text),
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
                        controller: paymentNumberController,
                        hintText: 'Enter 10 digit number',
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        width: Get.width,
                        height: 50,
                        keyboardType: TextInputType.number,
                        maxLength: 10,
                        onChanged: onChangedMobileNumber,
                        validator:
                            (v) => validateMobileNumber(
                              paymentNumberController.text,
                            ),
                      ),
                      const SizedBox(height: 20),
                      CustomTextForm(
                        label: 'UPI ID',
                        readOnly: false,
                        textAlign: TextAlign.start,
                        controller: upiIdController,
                        hintText: 'Enter UPI ID',
                        width: Get.width,
                        height: 50,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: onChangedUpiId,
                        validator: (v) => validatePaymentMethod(v),
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
                        controller: paypalIdController,
                        hintText: 'Enter Paypal ID',
                        width: Get.width,
                        height: 50,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: onChangedPaypalId,
                        validator: (v) => null,
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
                                  left: 19,
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
                                  left: 38,
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
                        controller: cryptoIdController,
                        hintText: 'Enter Crypto ID',
                        width: Get.width,
                        height: 50,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: onChangedCryptoId,
                        validator: (v) => null,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(
                  right: Get.width * 0.05,
                  left: Get.width * 0.05,
                ),
                child: CustomButton(
                  label: 'Submit',
                  showIcon: false,
                  isClickable: true,
                  bgColor: Color(0xFF9AD942),
                  onTap: () async {
                    if (!_isButtonClickable()) {
                      Get.snackbar(
                        'Error',
                        'Please fill all required fields correctly.',
                        backgroundColor: Colors.red,
                        snackPosition: SnackPosition.BOTTOM,
                      );
                      return;
                    }

                    if (selectedPayment == null || selectedPayment!.isEmpty) {
                      Get.snackbar(
                        'Error',
                        'Payment option is empty',
                        backgroundColor: Colors.red,
                        snackPosition: SnackPosition.BOTTOM,
                      );
                      return;
                    }

                    final prefs = await SharedPreferences.getInstance();

                    prefs.setString('is_participated', 'yes');
                    Get.toNamed(AppRoutes.participated);
                  },
                ),
              ),
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
  final List<Map<String, String>> paymentOptions = [
    {'label': 'Paytm', 'icon': 'assets/paytm.png'},
    {'label': 'PhonePe', 'icon': 'assets/phonepe.png'},
    {'label': 'Google Pay', 'icon': 'assets/gpay.png'},
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
          items:
              paymentOptions.map((option) {
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
                  Text(option['label']!, style: const TextStyle(fontSize: 16)),
                ],
              );
            }).toList();
          },
        ),
      ),
    );
  }
}
