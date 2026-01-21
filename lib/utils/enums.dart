enum SharedPreferencesKeys {
  authToken("auth_token");

  const SharedPreferencesKeys(this.text);

  final String text;
}

enum EndPoints {
  register("auth/register"),
  login("auth/login"),
  forgotPassword("forgetPassword"),
  updateDeviceId("updateDeviceId"),
  sendOtp("sendOTP"),
  resetPassword("resetPassword"),
  verifyOTP("verifyOTP"),
  resendOTP("resendOTP"),
  setBankDetails("ws/setBankDetails"),
  bankDetails("ws/bankDetails"),
  setDefaultBank("ws/setDefaultBank"),
  widthdrawl("yapily/withdrawal"),
  validateWSID("validateWSID"),
  validateEmail("auth/validateEmail"),
  setIdPin("ws/setIdPin"),
  updatePhoneNumber("ws/updatePhoneNumber"),
  validatePhoneNumber("validatePhoneNumber"),
  userDetails("ws/userDetails"),
  getUserDetails("ws/getUserDetails"),
  getQuestions("ws/getQuestions"),
  changePassword("ws/changePassword"),
  setQuestions("ws/insertQuesAttempt"), //
  setUserDetails("ws/userDetails"), //
  getStripeKyc("stripe/customerKYC"),
  getHomePage("ws/homePage"),
  addAmount("stripe/topup"),
  getUserDetailByToken("ws/getUserDetailsByToken"),
  paymentIntent("stripe/addCardToCustomer"),
  getSavedCards("stripe/getUserSavedCards"),
  addCard("stripe/addCardToCustomer"),
  validatePin("ws/validatePin"),
  transferWallet("txn/transfer/wallet"),
  paymentTransfer("txn/paymentPurpose"),
  getBeneficiries("ws/getBeneficiary?"),
  getBeneficiriesFavorites("ws/getFavBeneficiaries"),
  uploadNic('ws/storeNic/'),
  getSearchBeneficiary("ws/searchBeneficiary"),
  getFavSearchBeneficiary('ws/searchFavBeneficiary'),
  changeAccountPin("ws/changePin"),
  // beneficiries
  getBeneficiryDetails("ws/getBeneficiaryDetails/"),
  addBeneficiary("ws/addBeneficiary"),
  getBeneficiaryCategory("ws/beneficiaryTypes"),
  // beneficiries //
  getTransactionHistory("txn/transfer/history"),
  updateBeneficiary("ws/updateBeneficiaryType"),
  updateFavBeneficiary("ws/updateFavBeneficiaryType"),
  deleteBeneficiary("ws/deleteBeneficiary"),
  notifications('notification/getNoitification'),
  // contact
  contactApi("contacts"),
  // my wallet
  getGraphKeys("ws/graph/keys"),
  getGraphDataAndTransactions('ws/graph'),
  // my wallet //
  // top up
  getBanks("yapily/institutions"),
  topupYapily('yapily/topupYapily'),
  createPaymentYapily('yapily/createPaymentYapily'),
  // my wallet //
  //Inbox
  listConversations("ws/listConversations"),
  fullConversation("ws/fullConversation"),
  //Inbox //
  deleteCard("stripe/deleteCard"),
  // sockets
  homePage("homepage"),
  liveChatSocket("liveChatSocket"),
  // sockets //
  // FAQS
  getFaqs("ws/getFaqs"),
  // FAQS //
  // legal document
  privacypolicy("ws/legalDocuments?q=privacy-policy"),
  termsandconditions("ws/legalDocuments?q=terms-and-conditions"),
  // legal document //

  getUserDetailsByWSId("ws/initiateChat"),

  setDefaultCard("stripe/setDefaultCard");

  final String url;

  const EndPoints(this.url);
}

enum BaseUrls {
  stagUrl("https://gsxbsrfj-8081.euw.devtunnels.ms/api/");

  final String url;

  const BaseUrls(this.url);
}

enum Screens {
  addMoney("Add Money"),
  myAccount("My Account"),
  home("home"),
  transaction("transaction");

  final String text;

  const Screens(this.text);
}

enum DesignType { tablet, smallTablet, mobile }

enum TransactionType {
  credit("Credit"),
  debit("Debit");

  final String text;

  const TransactionType(this.text);
}

enum TransactionStatus {
  completed("COMPLETED"),
  pending("PENDING"),
  authorized("AUTHORIZED"),
  created("CREATED"),
  failed("FAILED");

  final String text;

  const TransactionStatus(this.text);
}

enum HiveBoxesEnums {
  conversations("conversations"),
  messages("messages");

  final String name;

  const HiveBoxesEnums(this.name);
}

enum TransactionTypeEnums {
  bankTopUp("bank_top_up"),
  bankWithdrawal("bank_withdrawal"),
  cardTopup("card_top_up"),
  walletToWallet("wallet_to_wallet");

  final String name;

  const TransactionTypeEnums(this.name);
}

enum SocketEventsEnums {
  onlineStatus(1),
  textMessage(0);

  final int value;

  const SocketEventsEnums(this.value);
}
