//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:overbank/customer_assets_class.dart';

//
// 13 pro - bottomnavbar = 77.5
// homeicon = 41.0
// other icons = 22.8
// space without appbar and btmnav = 664.8
// height = 844
// width = 390
//

const TextStyle header1 = TextStyle(
  fontSize: 20,
  //color: Color.fromARGB(255, 1, 80, 145),
);

const Color bgColor = Color(0xFFFFFAF4);
const Color majorColor = Color(0xFF52706E);
const Color btnBgColor = Color(0xFF7DA4A1);
const Color btnLightColor = Color(0xFFFBE5C8);
const Color negativeAmount = Color(0xFFFE6F61);
const Color containerColor = Color(0xffFFF6EC);
const Color increaseColor = Color(0xffBAD147);

class Clients {
  int id = 0;
  String name, avatarPath = '';
  int sendOperations_count, requestOperations_count;

  Clients(this.id, this.name, this.avatarPath, this.sendOperations_count,
      this.requestOperations_count);
}

List<Clients> recents = [
  Clients(2, 'Amy', 'assets/people_avatars/Amy.png', 5, 5),
  Clients(3, 'Adam', 'assets/people_avatars/Adam.png', 4, 4),
  Clients(4, 'Sarah', 'assets/people_avatars/Sarah.png', 3, 3),
  Clients(5, 'Mark', 'assets/people_avatars/Mark.png', 2, 2),
  Clients(6, 'Peter', 'assets/people_avatars/Peter.png', 1, 1),
  Clients(7, 'Dimitris', 'assets/people_avatars/Dimitris.jpg', 1, 1),
  Clients(8, 'Mohathma-Fatal-Error', 'assets/people_avatars/T-Rex.png', 1, 1),
];

class BankPageTransaction {
  String whoToPay;
  String purpose;
  bool arrow;
  double amount;
  DateTime dateTransaction;

  BankPageTransaction(this.whoToPay, this.purpose, this.arrow, this.amount,
      this.dateTransaction);
}

List<BankPageTransaction> BankPageTransactions = [
  BankPageTransaction(
      'Kerkya Estate inc.', 'Mortgage', true, -500, DateTime.utc(2022, 07, 25)),
  BankPageTransaction(
      'OverBank inc.', 'Salary June', false, 2800, DateTime.utc(2022, 07, 25)),
  BankPageTransaction(
      'Peter Gabriel', 'Loan return', false, 950, DateTime.utc(2022, 07, 25)),
  BankPageTransaction('Elpedison', 'Electricity bill', true, -50.57,
      DateTime.utc(2022, 07, 25)),
  BankPageTransaction('Atlantis - Koskorellos NIK', 'Carpet cleaning service',
      true, -76.23, DateTime.utc(2022, 07, 25)),
  BankPageTransaction(
      'Pagratio Gym', 'Gym monthly fee', true, -85, DateTime.utc(2022, 07, 24)),
  BankPageTransaction('Bobby Axelrod', 'Transfer from Amro bank', false, 500,
      DateTime.utc(2022, 07, 14)),
  BankPageTransaction('Heron Group', 'Gas monthly apt. fee', true, -110,
      DateTime.utc(2022, 07, 24)),
  BankPageTransaction('Lizzy Axelrod', 'Child support funds', true, -450,
      DateTime.utc(2022, 07, 22)),
  BankPageTransaction(
      'Mark Wahlberg', 'Split bill', false, -450, DateTime.utc(2022, 07, 22)),
  BankPageTransaction('Ad Astra Rigs AS', 'Author fee', false, 5000,
      DateTime.utc(2022, 07, 22)),
  BankPageTransaction('Kinsen Hellas A.E.', 'Car financing payment', true,
      -250.67, DateTime.utc(2022, 07, 22)),
  BankPageTransaction('Kerkya Estate Inc.', 'Mortgage', true, -450.56,
      DateTime.utc(2022, 07, 22)),
];

class BankTransaction {
  int id = 0;
  String From, Purpose, logo;
  bool arrow;
  DateTime dateTrans;
  double Amount;
  String currency;

  BankTransaction(this.id, this.From, this.Purpose, this.logo, this.arrow,
      this.dateTrans, this.Amount, this.currency);
}

List<BankTransaction> BankTransactions = [
  BankTransaction(
      1,
      'Sony PlayStation',
      'FIFA 2022 Game',
      'assets/transaction_logos/Playstation.png',
      true,
      DateTime.utc(2022, 07, 14),
      -53.95,
      'EUR'),
  BankTransaction(
      2,
      'Bank Transfer',
      'Salary for June',
      'assets/transaction_logos/Bank.png',
      false,
      DateTime.utc(2022, 07, 14),
      2500.95,
      'EUR'),
  BankTransaction(
      3,
      'Coffee Shop',
      'Coffee with Sarah',
      'assets/transaction_logos/hot-cup-of-coffee.png',
      true,
      DateTime.utc(2022, 07, 12),
      -5.42,
      'EUR'),
  BankTransaction(
      4,
      'Flat Rental',
      'Apartment Rental',
      'assets/transaction_logos/House.png',
      true,
      DateTime.utc(2022, 07, 11),
      -445.00,
      'EUR'),
  BankTransaction(
      5,
      'Zara',
      'Purchase # 234809',
      'assets/transaction_logos/House.png',
      false,
      DateTime.utc(2022, 07, 14),
      -100.50,
      'EUR'),
  BankTransaction(
      5,
      'IKEA',
      'Delivery # 455-45',
      'assets/transaction_logos/House.png',
      true,
      DateTime.utc(2022, 07, 14),
      -100.50,
      'EUR'),
  BankTransaction(
      6,
      'Mark Stefenson',
      'lunch at Joe\'s',
      'assets/transaction_logos/hot-cup-of-coffee.png',
      false,
      DateTime.utc(2022, 07, 11),
      30.00,
      'EUR'),
  BankTransaction(7, 'Emirates', 'JFK-ATH', 'assets/transaction_logos/Bank.png',
      false, DateTime.utc(2022, 07, 10), -470, 'EUR')
];

class Crypto {
  String code, wallet, path;
  double amount, rate;

  Crypto(this.code, this.wallet, this.path, this.amount, this.rate);
}

final List<Crypto> CryptoAssets = [
  Crypto('BTC', 'Exodus', 'assets/crypto_logos/Bitcoin.png', 2.1, 19618.24),
  Crypto('ETH', 'Trezor One', 'assets/crypto_logos/Ethereum.png', 150.4, 28.92),
  Crypto('XRP', 'Freewallet', 'assets/crypto_logos/Ripple.png', 1256.0, 0.52),
  Crypto('BNB', 'Coinomi', 'assets/crypto_logos/Binance.png', 14.56, 280.98),
  Crypto('TRX', 'Tronscan', 'assets/crypto_logos/Solana.png', 7800.17, 0.062),
  Crypto('TST', 'Test', 'assets/crypto_logos/Solana.png', 444750.91, 120.5)
];

class BankCard {
  String cardNumber, iban, bank, currency, currencyCode, imgPath;
  double amount;

  BankCard(this.cardNumber, this.iban, this.bank, this.currency,
      this.currencyCode, this.amount, this.imgPath);
}

final List<BankCard> BankCards = [
  BankCard('4279 1600 2200 1234', 'AMRO01718220007022123123123', 'AMRO Bank',
      'euro', 'EUR', 2750.01, 'assets/card_faces/AMRO Bank Card.png'),
  BankCard('2300 5345 8464 1234', 'INGB01718220007022123123123', 'ING Bank',
      'euro', 'EUR', 3312.29, 'assets/card_faces/ING Bank Card.png'),
  BankCard('5536 0091 1234 4331', 'RABO01718220007022123123123', 'Raboank',
      'euro', 'EUR', 10.01, 'assets/card_faces/Robobank Card.png'),
];

class NFTs {
  String title, currencyName, path, acquired;
  double amount, inUSD;

  NFTs(this.title, this.currencyName, this.path, this.acquired, this.amount,
      this.inUSD);
}

final List<NFTs> NFTAssets = [
  NFTs('Daddy\'s Cool Ride', 'USN', 'assets/NFTs/NFT1.png', '20.09.2022', 200.0,
      272.65),
  NFTs('Mental Minecraft', 'OCT', 'assets/NFTs/NFT2.png', '17.07.2022', 0.6317,
      2.65),
  NFTs('Mynt Madonna', 'NEAR', 'assets/NFTs/NFT3.png', '14.05.2022', 198.24,
      1251.41),
  NFTs('Split Charlie', 'NEAR', 'assets/NFTs/NFT4.png', '01.03.2022', 198.24,
      1251.41),
];

class BankAccount {
  String bankName,
      accountNumber,
      accountTitle,
      bankLogoPath,
      iban,
      currencyCode,
      currencyName;
  double amount;

  BankAccount(
      this.bankName,
      this.accountNumber,
      this.accountTitle,
      this.bankLogoPath,
      this.iban,
      this.currencyCode,
      this.currencyName,
      this.amount);
}

final List<BankAccount> BankAccounts = [
  BankAccount('ING', 'FR91AXNF0R1916A541', 'Mortgage transit',
      'assets/bank_logos/Bank logo 1.svg', 'iban', 'EUR', 'euro', 5801.0),
  BankAccount('HA', 'GB91ABNA041716C773', 'Internet basic usage',
      'assets/bank_logos/Bank logo 2.png', 'iban', 'EUR', 'euro', 90.0),
  BankAccount('Rabobank', 'NL91ABNA0417164300', 'Study Savings',
      'assets/bank_logos/Bank logo 3.png', 'iban', 'EUR', 'euro', 25901.02),
  BankAccount('Shield Bank', 'DE91EKBR0417167762', 'Travel Savings',
      'assets/bank_logos/Bank logo 4.svg', 'iban', 'EUR', 'euro', 10000.0),
  BankAccount('Infinite', 'GR91ITMPS041128531', 'Personal Insurance',
      'assets/bank_logos/Bank logo 5.svg', 'iban', 'EUR', 'euro', 0.02),
];

class Stock {
  String name;
  double amount, delta;
  bool viewed;

  Stock(this.name, this.amount, this.delta, this.viewed);
}

List<Stock> Stocks = [
  Stock('High tech stocks', 4750.91, 20.5, true),
  Stock('Industrial stocks', 4750.91, -10.2, true),
  Stock('General stocks', 0, 7.30, true),
  Stock('Finance stocks', 0, 43.2, false),
  Stock('Medical stocks', 0, 72.2, false),
];
