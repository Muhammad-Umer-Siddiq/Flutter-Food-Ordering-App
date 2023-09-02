import 'package:flutter/widgets.dart';

class AppConsts {
  // App's privacy Policy & terms conditions
  static const String privacyPolicyInfo =
          "At Order @ Eat, we take your privacy seriously. This Privacy Policy outlines how we collect, use, disclose, and safeguard your personal information.\n We may collect personal information, such as your name, email address, phone number, and location, to process your orders and improve our services. We use your personal information to process your orders, improve our app's functionality, and communicate with you regarding your orders or app updates.\n We do not sell, trade, or rent your personal information to third parties; however, we may share your information with our trusted partners and service providers to facilitate order processing and delivery.\n We employ industry-standard security measures to protect your personal information from unauthorized access, disclosure, or alteration. We use cookies and similar tracking technologies to enhance your app experience and gather information about app usage.\n Our app may contain links to third-party websites or services. We are not responsible for the content or privacy practices of those websites.\n Our app is not intended for use by children under the age of 13. We reserve the right to update or modify this Privacy Policy at any time.\n By using Order @ Eat, you consent to the practices described in this Privacy Policy. If you have any questions or concerns, please contact our customer support. Thank you for choosing Order @ Eat for your food needs!",
      termsConditionsInfo =
          "Welcome to Order @ Eat! By using our app, you agree to the following Terms & Conditions, which govern your use of the app and the services we provide. By accessing or using Order @ Eat, you agree to be bound by these Terms & Conditions and any additional terms that may apply to specific features of our app.\n Our app allows you to browse menus, place food orders, and make payments online. By placing an order, you confirm that the information you provide is accurate and complete.\n Prices listed on the app are inclusive of all applicable taxes. We reserve the right to change pricing and payment methods at any time without prior notice.\n We strive to process orders promptly and deliver food within the estimated delivery time; however, circumstances beyond our control may cause delays. You may cancel your order before it has been processed by contacting our customer support. Refunds, if applicable, will be processed according to our Refund Policy.\n To access certain features of the app, you may be required to create a user account. You are responsible for maintaining the confidentiality of your account information and accept responsibility for all activities that occur under your account.\n All content on our app is protected by intellectual property rights and belongs to Order @ Eat or its partners. We shall not be liable for any direct, indirect, incidental, special, or consequential damages arising out of or relating to the use of our app. We reserve the right to update or modify these Terms & Conditions at any time without prior notice.";

  // For sign in screen
  static final TextEditingController emailControllerS = TextEditingController(),
      passwordControllerS = TextEditingController(),

      // For register in screen
      nameControllerR = TextEditingController(),
      emailControllerR = TextEditingController(),
      phoneControllerR = TextEditingController(),
      streetControllerR = TextEditingController(),
      passwordControllerR = TextEditingController(),
      passwordControllerRR = TextEditingController(),

      // For delivery address screen
      nameControllerD = TextEditingController(),
      addressControllerD = TextEditingController(),
      phoneControllerD = TextEditingController();

  static const String appName = 'Order @ Eat';
}
