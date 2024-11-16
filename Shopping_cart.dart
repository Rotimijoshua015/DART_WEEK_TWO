// Shopping Cart Simulation in Dart

// Function to calculate the total price, including optional tax
double calculateTotal(List<double> prices, {double taxRate = 0.0}) {
  double subtotal = prices.reduce((a, b) => a + b);
  double tax = subtotal * taxRate;
  return subtotal + tax;
}

// Function to apply a discount using a higher-order function
List<double> applyDiscount(
    List<double> prices, double Function(double) discountFunction) {
  return prices.map(discountFunction).toList();
}

// Recursive function to calculate factorial discount
int calculateFactorialDiscount(int n) {
  if (n <= 1) return 1;
  return n * calculateFactorialDiscount(n - 1);
}

void main() {
  // Example item prices
  List<double> itemPrices = [15.0, 25.0, 5.0, 50.0];

  // Anonymous function to filter items priced above $10
  var expensiveItems = itemPrices.where((price) => price >= 10).toList();
  print("Filtered Items (>= \$10): $expensiveItems");

  // Applying a 20% discount
  var discountedPrices = applyDiscount(expensiveItems, (price) => price * 0.8);
  print("Discounted Prices: $discountedPrices");

  // Calculate total with tax (10%)
  double total = calculateTotal(discountedPrices, taxRate: 0.1);
  print("Total with Tax: \$${total.toStringAsFixed(2)}");

  // Apply a factorial discount based on the number of items
  int numItems = discountedPrices.length;
  int factorialDiscount = calculateFactorialDiscount(numItems);
  print("Factorial Discount (as %): $factorialDiscount%");

  // Final price after applying the factorial discount
  double finalPrice = total * (1 - factorialDiscount / 100.0);
  print(
      "Final Price after Factorial Discount: \$${finalPrice.toStringAsFixed(2)}");
}
