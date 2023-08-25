abstract class Account {
  int accountNumber;
  double balance;
  Account(this.accountNumber, this.balance);
  void deposit(double amount) {
    balance += amount;
  }

  void withdraw(double amount);
}

class SavingsAccount extends Account {
  double interestRate;
  SavingsAccount(int accountNumber, double balance, this.interestRate)
      : super(accountNumber, balance);
  void withdraw(double amount) {
    if (amount <= balance) {
      balance -= amount;
      balance += balance * (interestRate / 100);
    } else {
      print("Insufficient funds");
    }
  }
}

class CurrentAccount extends Account {
  double overdraftLimit;
  CurrentAccount(int accountNumber, double balance, this.overdraftLimit)
      : super(accountNumber, balance);
  void withdraw(double amount) {
    if (amount <= balance + overdraftLimit) {
      balance -= amount;
    } else {
      print("Insufficient funds");
    }
  }
}

void main() {
  var savingsAcc = SavingsAccount(12345, 1000.0, 5.0);
  var currentAcc = CurrentAccount(54321, 2000.0, 1000.0);
  print("Savings Account:");
  print("Initial Balance: ${savingsAcc.balance}");
  savingsAcc.deposit(500.0);
  print("After deposit: ${savingsAcc.balance}");
  savingsAcc.withdraw(300.0);
  print("After withdrawal: ${savingsAcc.balance}");

  print("\nCurrent Account:");
  print("Initial Balance: ${currentAcc.balance}");
  currentAcc.deposit(800.0);
  print("After deposit: ${currentAcc.balance}");
  currentAcc.withdraw(2500.0);
  print("After withdrawal: ${currentAcc.balance}");
}
