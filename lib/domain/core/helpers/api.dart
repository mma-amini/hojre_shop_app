class Api {
  static const String BASE_API = "http://192.168.10.110:8000";
  static const String CHECK_USER_API = "$BASE_API/api/v1/auth/checkUser";
  static const String LOGIN_API = "$BASE_API/api/v1/auth/login";
  static const String REFRESH_TOKEN_API = "$BASE_API/api/v1/oauth/token";
  static const String PRODUCT_GROUPS_API = "$BASE_API/api/v1/shop/productGroups";
  static const String GROUP_SPECS_API = "$BASE_API/api/v1/shop/groupSpecs";
  static const String SHOP_PRODUCTS_API = "$BASE_API/api/v1/shop/shopProducts";
  static const String PRODUCT_DESIGNS_API = "$BASE_API/api/v1/shop/productDesigns";
  static const String BRANDS_API = "$BASE_API/api/v1/shop/brands";
}
