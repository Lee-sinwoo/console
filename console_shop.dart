import 'dart:io';

class Product {
  String name;
  int price;

  Product(this.name, this.price);
}

class ShoppingMall {
  List<Product> products;
  int totalPrice = 0;

  ShoppingMall(this.products);

  void showProducts() {
    for (var product in products) {
      print('${product.name} / ${product.price}원');
    }
  }

  void addToCart() {
    print('상품 이름을 입력해 주세요!');
    String? name = stdin.readLineSync();
    print('상품 개수를 입력해 주세요!');
    String? countInput = stdin.readLineSync();

    try {
      int count = int.parse(countInput ?? '');

      Product? selectedProduct;
      for (var product in products) {
        if (product.name == name) {
          selectedProduct = product;
          break;
        }
      }

      if (selectedProduct == null) {
        print('입력값이 올바르지 않아요!');
      } else if (count <= 0) {
        print('0개보다 많은 개수의 상품만 담을 수 있어요!');
      } else {
        totalPrice += selectedProduct.price * count;
        print('장바구니에 상품이 담겼어요!');
      }
    } catch (e) {
      print('입력값이 올바르지 않아요!');
    }
  }

  void showTotal() {
    print('장바구니에 ${totalPrice}원 어치를 담으셨네요!');
  }
}

void main() {
  var products = [
    Product('안경', 200000),
    Product('와인', 30000),
    Product('커피', 5000),
    Product('화장품', 38000),
    Product('향수', 50000),
  ];

  var mall = ShoppingMall(products);
  bool isRunning = true;

  while (isRunning) {
    print(
        '\n[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니에 담긴 상품의 총 가격 보기 / [4] 프로그램 종료');
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        mall.showProducts();
        break;
      case '2':
        mall.addToCart();
        break;
      case '3':
        mall.showTotal();
        break;
      case '4':
        print('이용해 주셔서 감사합니다 ~ 안녕히 가세요!');
        isRunning = false;
        break;
      default:
        print('지원하지 않는 기능입니다! 다시 시도해 주세요 ..');
    }
  }
}
