import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'payment_page.dart';

class CheckoutPage extends StatelessWidget {
  CheckoutPage({super.key});

  final country = TextEditingController();
  final state = TextEditingController();
  final district = TextEditingController();
  final city = TextEditingController();
  final postOffice = TextEditingController();
  final pincode = TextEditingController();
  final house = TextEditingController();
  final contact = TextEditingController();

  final RxString paymentMethod = "COD".obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              const Text(
                "Delivery Address",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              /// Address Expansion
              ExpansionTile(
                title: const Text("Tap to Add Address"),

                children: [

                  TextField(
                    controller: country,
                    decoration: const InputDecoration(labelText: "Country"),
                  ),

                  TextField(
                    controller: state,
                    decoration: const InputDecoration(labelText: "State"),
                  ),

                  TextField(
                    controller: district,
                    decoration: const InputDecoration(labelText: "District"),
                  ),

                  TextField(
                    controller: city,
                    decoration: const InputDecoration(labelText: "City"),
                  ),

                  TextField(
                    controller: postOffice,
                    decoration: const InputDecoration(labelText: "Post Office"),
                  ),

                  TextField(
                    controller: pincode,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: "Pincode"),
                  ),

                  TextField(
                    controller: house,
                    decoration: const InputDecoration(labelText: "House Number"),
                  ),

                  TextField(
                    controller: contact,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(labelText: "Contact Number"),
                  ),

                  const SizedBox(height: 15),

                ],
              ),

              const SizedBox(height: 30),

              /// Payment Method
              const Text(
                "Payment Method",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Obx(() => Column(
                children: [

                  RadioListTile(
                    title: const Text("Cash on Delivery"),
                    value: "COD",
                    groupValue: paymentMethod.value,
                    onChanged: (value) {
                      paymentMethod.value = value!;
                    },
                  ),

                  RadioListTile(
                    title: const Text("UPI Payment"),
                    value: "UPI",
                    groupValue: paymentMethod.value,
                    onChanged: (value) {
                      paymentMethod.value = value!;
                    },
                  ),

                  RadioListTile(
                    title: const Text("Debit / Credit Card"),
                    value: "CARD",
                    groupValue: paymentMethod.value,
                    onChanged: (value) {
                      paymentMethod.value = value!;
                    },
                  ),

                ],
              )),

              const SizedBox(height: 30),

              /// Continue Button
              SizedBox(
                width: double.infinity,

                child: ElevatedButton(

                  onPressed: () {

                    /// Address Validation
                    if (country.text.isEmpty ||
                        state.text.isEmpty ||
                        district.text.isEmpty ||
                        city.text.isEmpty ||
                        postOffice.text.isEmpty ||
                        pincode.text.isEmpty ||
                        house.text.isEmpty ||
                        contact.text.isEmpty) {

                      Get.snackbar(
                        "Missing Address",
                        "Please fill all address fields",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );

                      return;
                    }

                    /// Create Address String
                    String address =
                        "${house.text}, ${city.text}, ${district.text}, "
                        "${state.text}, ${country.text} - ${pincode.text}";

                    /// Go to Payment Page
                    Get.to(() => PaymentPage(
                      paymentMethod: paymentMethod.value,
                      address: address,
                    ));
                  },

                  child: const Text("Continue to Payment"),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}