class Accounts {
  String emailAddress;
  String password;
  Accounts({required this.emailAddress, required this.password});
}

// To store every new user data
List<Accounts> userAccounts = [
  Accounts(emailAddress: "abc123@gmail.com", password: "abc9999"),
  Accounts(emailAddress: "mno123@gmail.com", password: "mno9999")
];
