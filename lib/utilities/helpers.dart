import '../models/custom models/cart_item.dart';
import 'consts.dart';
import 'lists.dart';
import 'values.dart';

// For each food details Screen

class CartItemsHelpers {
  int calculateTotalPrice(List<CartItem> cartItems) {
    int totalPrice = 0;
    for (CartItem cartItem in cartItems) {
      int totalEachFoodPrice =
          (cartItem.food!.foodQuantity) * (cartItem.food!.foodPrice);
      totalPrice += totalEachFoodPrice;
    }
    return totalPrice;
  }

  void addToCart(dynamic food) {
    bool itemExists = false;

    for (var item in cartItems) {
      if (item.food == food) {
        item.quantity++;
        itemExists = true;
        break;
      }
    }

    if (!itemExists) {
      cartItems.add(CartItem(food: food));
    }
  }
}

bool areFieldsEmpty() {
  if (nameControllerD.text.isEmpty ||
      streetControllerD.text.isEmpty ||
      cityControllerD.text.isEmpty ||
      phoneControllerD.text.isEmpty) {
    return true;
  } else {
    return false;
  }
}

class DeliveryProcessHelpers {
  // To select one payment & unselect the rest
  void selectPaymentTypes(int currentPayment) {
    for (int i = 0; i < paymentTypes.length; i++) {
      paymentTypes[i].paymentIsSelected = false;
    }
    paymentTypes[currentPayment].paymentIsSelected = true;
  }

  // To unselect all payment types
  void unselectPaymentTypes() {
    for (int i = 0; i < paymentTypes.length; i++) {
      paymentTypes[i].paymentIsSelected = false;
    }
  }

  // To select & unselect pay on arrival option
  void selectArrivalPayment() {
    shouldPayOnArrival = !shouldPayOnArrival;
    if (shouldPayOnArrival == true) {
      showError = false;
    } else {
      showError = true;
    }
  }

  // To only unselect pay on arrival option
  void unselectArrivalPayment() => shouldPayOnArrival = false;

  void setEverythingDefault() {
    unselectPaymentTypes();
    unselectArrivalPayment();
    useProfileForDelivery = false;

    cartItems.clear();

    for (int i = 0; i < cartItems.length; i++) {
      cartItems[i].quantity = 0;
    }
    for (int i = 0; i < popularFoodList.length; i++) {
      popularFoodList[i].foodQuantity = 0;
    }
  }
}
