class Api {
  static const String BASE_API = "http://localhost:8000";
  static const String CHECK_USER_API = "$BASE_API/api/v1/auth/checkUser";
  static const String LOGIN_API = "$BASE_API/api/v1/auth/login";
  static const String REFRESH_TOKEN_API = "$BASE_API/api/v1/oauth/token";
  static const String PRODUCT_GROUPS_API = "$BASE_API/api/v1/shop/productGroups";
  static const String SHOP_PRODUCTS_API = "$BASE_API/api/v1/shop/shopProducts";
}
