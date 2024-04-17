class Endpoints {
  static const String categoriesEndpoint = "/api/v1/categories";
  static const String brandsEndpoint = "/api/v1/brands";
  static const String productsEndpoint = "/api/v1/products";
  static String subCategoriesEndpoint(String categoryId) => "/api/v1/categories/$categoryId/subcategories";
}