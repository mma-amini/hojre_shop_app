class Api {
  static final String BASE_API = "http://localhost:8000";
  static final String CHECK_USER_API = BASE_API + "/api/v1/auth/checkUser";
  static final String LOGIN_API = BASE_API + "/api/v1/auth/login";
  static final String REFRESH_TOKEN_API = BASE_API + "/api/v1/oauth/token";
  static final String PRODUCT_GROUPS_API = BASE_API + "/api/v1/shop/productGroups";
  static final String SHOP_PRODUCTS_API = BASE_API + "/api/v1/shop/shopProducts";
}
