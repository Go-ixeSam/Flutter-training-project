class Vincom {
  List<Places>? places;
  List<Stores>? stores;
  List<Products>? products;

  Vincom({this.places, this.stores, this.products});

  Vincom.fromJson(Map<String, dynamic> json) {
    if (json['places'] != null) {
      places = <Places>[];
      json['places'].forEach((v) {
        places!.add(new Places.fromJson(v));
      });
    }
    if (json['stores'] != null) {
      stores = <Stores>[];
      json['stores'].forEach((v) {
        stores!.add(new Stores.fromJson(v));
      });
    }
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.places != null) {
      data['places'] = this.places!.map((v) => v.toJson()).toList();
    }
    if (this.stores != null) {
      data['stores'] = this.stores!.map((v) => v.toJson()).toList();
    }
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Places {
  String? id;
  String? name;
  String? address;
  String? openTime;
  String? closeTime;
  bool? isOpen;
  String? image;

  Places(
      {this.id,
        this.name,
        this.address,
        this.openTime,
        this.closeTime,
        this.isOpen,
        this.image});

  Places.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    openTime = json['openTime'];
    closeTime = json['closeTime'];
    isOpen = json['isOpen'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['openTime'] = this.openTime;
    data['closeTime'] = this.closeTime;
    data['isOpen'] = this.isOpen;
    data['image'] = this.image;
    return data;
  }
}

class Stores {
  String? image;
  String? openTime;
  String? closeTime;

  Stores({this.image, this.openTime, this.closeTime});

  Stores.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    openTime = json['openTime'];
    closeTime = json['closeTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['openTime'] = this.openTime;
    data['closeTime'] = this.closeTime;
    return data;
  }
}

class Products {
  String? image;
  String? name;
  String? position;

  Products({this.image, this.name, this.position});

  Products.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['name'] = this.name;
    data['position'] = this.position;
    return data;
  }
}
