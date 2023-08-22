import '../models/custom_models/cart_item.dart';
import 'helpers.dart';

bool isExtraChecked = false;
bool useProfileForDelivery = false;
int timeInOrderToArrive = 10;
bool shouldPayOnArrival = false;
bool showError = true;

// For calculator screen
double buttonSize = 92;
int totalButtons = 4;
var userQuestion = '';
var userAnswer = '';

var totalPrice = calculateTotalPrice(cartItems);
