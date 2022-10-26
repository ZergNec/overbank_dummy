class CustomerAssets {
  List<Bank>? bank;
  List<Crypto>? crypto;
  List<Nft>? nft;

  CustomerAssets({this.bank, this.crypto, this.nft});

  CustomerAssets.fromJson(Map<String, dynamic> json) {
    if (json['bank'] != null) {
      bank = <Bank>[];
      json['bank'].forEach((v) {
        bank!.add(new Bank.fromJson(v));
      });
    }
    if (json['crypto'] != null) {
      crypto = <Crypto>[];
      json['crypto'].forEach((v) {
        crypto!.add(new Crypto.fromJson(v));
      });
    }
    if (json['nft'] != null) {
      nft = <Nft>[];
      json['nft'].forEach((v) {
        nft!.add(new Nft.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bank != null) {
      data['bank'] = this.bank!.map((v) => v.toJson()).toList();
    }
    if (this.crypto != null) {
      data['crypto'] = this.crypto!.map((v) => v.toJson()).toList();
    }
    if (this.nft != null) {
      data['nft'] = this.nft!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Bank {
  int? account;
  String? bank;
  String? currency;
  String? currencyCode;
  double? ammount;

  Bank(
      {this.account,
      this.bank,
      this.currency,
      this.currencyCode,
      this.ammount});

  Bank.fromJson(Map<String, dynamic> json) {
    account = json['account'];
    bank = json['bank'];
    currency = json['currency'];
    currencyCode = json['currencyCode'];
    ammount = json['ammount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['account'] = this.account;
    data['bank'] = this.bank;
    data['currency'] = this.currency;
    data['currencyCode'] = this.currencyCode;
    data['ammount'] = this.ammount;
    return data;
  }
}

class Crypto {
  String? wallet;
  String? walletName;
  List<CurrencyList>? currencyList;

  Crypto({this.wallet, this.walletName, this.currencyList});

  Crypto.fromJson(Map<String, dynamic> json) {
    wallet = json['wallet'];
    walletName = json['walletName'];
    if (json['currencyList'] != null) {
      currencyList = <CurrencyList>[];
      json['currencyList'].forEach((v) {
        currencyList!.add(new CurrencyList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['wallet'] = this.wallet;
    data['walletName'] = this.walletName;
    if (this.currencyList != null) {
      data['currencyList'] = this.currencyList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CurrencyList {
  String? title;
  String? code;
  double? ammount;

  CurrencyList({this.title, this.code, this.ammount});

  CurrencyList.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    code = json['code'];
    ammount = json['ammount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['code'] = this.code;
    data['ammount'] = this.ammount;
    return data;
  }
}

class Nft {
  String? currency;
  String? code;

  Nft({this.currency, this.code});

  Nft.fromJson(Map<String, dynamic> json) {
    currency = json['currency'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currency'] = this.currency;
    data['code'] = this.code;
    return data;
  }
}
