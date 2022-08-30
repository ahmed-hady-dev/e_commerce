import 'package:e_commerce/model/product_model.dart';

abstract class BaseProductRepository {
  Stream<List<Product>> getAllProducts();
}
