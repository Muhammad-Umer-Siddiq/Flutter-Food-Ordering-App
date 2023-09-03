import 'dart:developer';

import '../utilities/imports.dart';

class LoginHelpers {
  static String? customEmptyValidation({String? textValue, String? fieldName}) {
    if (textValue!.isEmpty) {
      return "$fieldName is required";
    } else {
      return null;
    }
  }

  static bool registerFieldsEmpty() {
    if (AppConsts.nameControllerR.text.isEmpty ||
        AppConsts.streetControllerR.text.isEmpty ||
        AppConsts.phoneControllerR.text.isEmpty) {
      return true;
    } else {
      return false;
    }
  }
}

class CartItemsHelpers {
  // To calculate total price of food items added in user cart
  static int calculateTotalPrice(List<CartItem> cartItems) {
    int totalOrderPrice = 0;

    for (CartItem cartItem in cartItems) {
      int foodPrice = 0;

      if (cartItem.food!.extrasCheck) {
        // If user has selected extras, then add it's respective price
        foodPrice += cartItem.food!.extrasPrice;
        log("Food Price with Food Extras for ${cartItem.food!.foodName} : Rs. $foodPrice (AC)");
      }
      foodPrice += cartItem.food!.foodPrice;
      log("  Price with food price & extra ${cartItem.food!.foodName} : Rs. $foodPrice(AC)");

      int totalEachFoodPrice = foodPrice * cartItem.food!.foodQuantity;
      log("Total food price including quantity & food extras ${cartItem.food!.foodName} : Rs. $totalEachFoodPrice (AC)");

      totalOrderPrice += totalEachFoodPrice;
      log('Total Order price $totalOrderPrice (AC)');
    }
    return totalOrderPrice;
  }

  // To add static food item into cart screen
  static void addToCart(PopularFoodModel food) {
    bool itemExists = false;
    // To ensures that the same food item is not added as a new entry
    // in the cart,
    // but the quantity is increased for the existing entry.
    for (var item in cartItems) {
      if (item.food == food) {
        if (item.food!.foodQuantity > 1) {
          // item already added to cart, just changing the quantity
          item.quantity = item.food!.foodQuantity;
          itemExists = true;
          break;
        } else {
          if (item.quantity == 30) {
            itemExists = true;
            break;
          } else {
            if (item.food!.foodQuantity == 1) {
              itemExists = true;
              break;
            }
          }
        }
      }
    }

    if (!itemExists) {
      cartItems.add(CartItem(food: food));
    }
  }
}

class DeliveryProcessHelpers {
  // To select one payment & unselect the rest

  static bool deliveryFieldsEmpty() {
    if (AppConsts.nameControllerD.text.isEmpty ||
        AppConsts.addressControllerD.text.isEmpty ||
        AppConsts.phoneControllerD.text.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  static void newDetails() {
    if (DeliveryProcessHelpers.deliveryFieldsEmpty() == false) {
      AppValues.name = AppConsts.nameControllerD.text;
      AppValues.homeAddress = AppConsts.addressControllerD.text;
      AppValues.phoneNumber = AppConsts.phoneControllerD.text;
    } else {
      // If user has provided details during register screen & approve to use that,then
      AppValues.name = AppConsts.nameControllerR.text;
      AppValues.homeAddress = AppConsts.streetControllerR.text;
      AppValues.phoneNumber = AppConsts.phoneControllerR.text;
    }
  }

  static void selectPaymentTypes(int currentPayment) {
    for (int i = 0; i < paymentTypes.length; i++) {
      paymentTypes[i].paymentIsSelected = false;
    }
    paymentTypes[currentPayment].paymentIsSelected = true;
  }

  // To unselect all payment types
  static void unselectPaymentTypes() {
    for (int i = 0; i < paymentTypes.length; i++) {
      paymentTypes[i].paymentIsSelected = false;
    }
  }

  // To select & unselect pay on arrival option
  static void selectArrivalPayment() {
    AppValues.shouldPayOnArrival = !AppValues.shouldPayOnArrival;
    if (AppValues.shouldPayOnArrival == true) {
      AppValues.showError = false;
    } else {
      AppValues.showError = true;
    }
  }

  // To only unselect pay on arrival option
  static void unselectArrivalPayment() => AppValues.shouldPayOnArrival = false;

  static void setEverythingDefault() {
    unselectPaymentTypes();
    unselectArrivalPayment();
    AppValues.useProfileForDelivery = false;

    for (int i = 0; i < popularFoodList.length; i++) {
      popularFoodList[i].foodQuantity = 1;
    }

    cartItems.clear();
  }
}
