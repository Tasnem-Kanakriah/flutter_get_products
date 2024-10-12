import 'package:demo/models/product_model.dart';
import 'package:dio/dio.dart';

Future<List<ProductModel>> getProduct() async {
  try {
    Dio request = Dio();
    Response response = await request
        .get('https://657ec9263e3f5b18946421b8.mockapi.io/products');

    List<ProductModel> listProduct = [];

    for (var i = 0; i < response.data.length; i++) {
      ProductModel product = ProductModel.fromMap(
        response.data[i],
      );
      listProduct.add(product);
    }
    return listProduct;
  } catch (e) {
    print(e);
    return [];
  }
}
