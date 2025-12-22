// To parse this JSON data, do
//
//     final userDataModel = userDataModelFromJson(jsonString);

import 'dart:convert';

UserDataModel userDataModelFromJson(String str) => UserDataModel.fromJson(json.decode(str));

String userDataModelToJson(UserDataModel data) => json.encode(data.toJson());

class UserDataModel {
  UserModel body;

  UserDataModel({
    required this.body,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
    body: UserModel.fromJson(json["body"]),
  );

  Map<String, dynamic> toJson() => {
    "body": body.toJson(),
  };
}

class UserModel {
  String token;
  User user;

  UserModel({
    required this.token,
    required this.user,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    token: json["token"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "user": user.toJson(),
  };
}

class User {
  PrivacySettings privacySettings;
  NotificationPreferences notificationPreferences;
  dynamic passwordChangedAt;
  String id;
  String inviteCode;
  String email;
  String fullName;
  String profileImage;
  List<String> role;
  bool isActive;
  bool isTwoFactorEnabled;
  List<String> myCaregivers;
  List<String> iCareFor;
  List<dynamic> recoveryCode;
  String fcmToken;
  bool isBlocked;
  dynamic blockedBy;
  String superadminApproveStatus;
  String gender;
  int experience;
  String phoneNumber;
  dynamic description;
  List<dynamic> specialization;
  List<dynamic> qualifications;
  bool isSubscribed;
  String subscriptionStatus;
  DateTime subscriptionStartDate;
  DateTime subscriptionEndDate;
  String subscriptionType;
  bool isPremium;
  String stripeCustomerId;
  String stripeSubscriptionId;
  DateTime lastPaymentDate;
  StripeDetails stripeDetails;
  DateTime subscriptionPurchasedAt;
  bool cancelAtPeriodEnd;
  bool isCaregiverBlock;
  String temperatureUnit;
  bool isOnboarded;

  User({
    required this.privacySettings,
    required this.notificationPreferences,
    required this.passwordChangedAt,
    required this.id,
    required this.inviteCode,
    required this.email,
    required this.fullName,
    required this.profileImage,
    required this.role,
    required this.isActive,
    required this.isTwoFactorEnabled,
    required this.myCaregivers,
    required this.iCareFor,
    required this.recoveryCode,
    required this.fcmToken,
    required this.isBlocked,
    required this.blockedBy,
    required this.superadminApproveStatus,
    required this.gender,
    required this.experience,
    required this.phoneNumber,
    required this.description,
    required this.specialization,
    required this.qualifications,
    required this.isSubscribed,
    required this.subscriptionStatus,
    required this.subscriptionStartDate,
    required this.subscriptionEndDate,
    required this.subscriptionType,
    required this.isPremium,
    required this.stripeCustomerId,
    required this.stripeSubscriptionId,
    required this.lastPaymentDate,
    required this.stripeDetails,
    required this.subscriptionPurchasedAt,
    required this.cancelAtPeriodEnd,
    required this.isCaregiverBlock,
    required this.temperatureUnit,
    required this.isOnboarded,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    privacySettings: PrivacySettings.fromJson(json["privacySettings"]),
    notificationPreferences: NotificationPreferences.fromJson(json["notificationPreferences"]),
    passwordChangedAt: json["passwordChangedAt"],
    id: json["_id"],
    inviteCode: json["inviteCode"],
    email: json["email"],
    fullName: json["fullName"],
    profileImage: json["profileImage"],
    role: List<String>.from(json["role"].map((x) => x)),
    isActive: json["is_active"],
    isTwoFactorEnabled: json["isTwoFactorEnabled"],
    myCaregivers: List<String>.from(json["myCaregivers"].map((x) => x)),
    iCareFor: List<String>.from(json["iCareFor"].map((x) => x)),
    recoveryCode: List<dynamic>.from(json["recoveryCode"].map((x) => x)),
    fcmToken: json["fcmToken"],
    isBlocked: json["isBlocked"],
    blockedBy: json["blockedBy"],
    superadminApproveStatus: json["superadminApproveStatus"],
    gender: json["gender"],
    experience: json["experience"],
    phoneNumber: json["phoneNumber"],
    description: json["description"],
    specialization: List<dynamic>.from(json["specialization"].map((x) => x)),
    qualifications: List<dynamic>.from(json["qualifications"].map((x) => x)),
    isSubscribed: json["isSubscribed"],
    subscriptionStatus: json["subscriptionStatus"],
    subscriptionStartDate: DateTime.parse(json["subscriptionStartDate"]),
    subscriptionEndDate: DateTime.parse(json["subscriptionEndDate"]),
    subscriptionType: json["subscriptionType"],
    isPremium: json["is_premium"],
    stripeCustomerId: json["stripeCustomerId"],
    stripeSubscriptionId: json["stripeSubscriptionId"],
    lastPaymentDate: DateTime.parse(json["lastPaymentDate"]),
    stripeDetails: StripeDetails.fromJson(json["stripeDetails"]),
    subscriptionPurchasedAt: DateTime.parse(json["subscriptionPurchasedAt"]),
    cancelAtPeriodEnd: json["cancelAtPeriodEnd"],
    isCaregiverBlock: json["is_caregiver_block"],
    temperatureUnit: json["temperatureUnit"],
    isOnboarded: json["isOnboarded"],
  );

  Map<String, dynamic> toJson() => {
    "privacySettings": privacySettings.toJson(),
    "notificationPreferences": notificationPreferences.toJson(),
    "passwordChangedAt": passwordChangedAt,
    "_id": id,
    "inviteCode": inviteCode,
    "email": email,
    "fullName": fullName,
    "profileImage": profileImage,
    "role": List<dynamic>.from(role.map((x) => x)),
    "is_active": isActive,
    "isTwoFactorEnabled": isTwoFactorEnabled,
    "myCaregivers": List<dynamic>.from(myCaregivers.map((x) => x)),
    "iCareFor": List<dynamic>.from(iCareFor.map((x) => x)),
    "recoveryCode": List<dynamic>.from(recoveryCode.map((x) => x)),
    "fcmToken": fcmToken,
    "isBlocked": isBlocked,
    "blockedBy": blockedBy,
    "superadminApproveStatus": superadminApproveStatus,
    "gender": gender,
    "experience": experience,
    "phoneNumber": phoneNumber,
    "description": description,
    "specialization": List<dynamic>.from(specialization.map((x) => x)),
    "qualifications": List<dynamic>.from(qualifications.map((x) => x)),
    "isSubscribed": isSubscribed,
    "subscriptionStatus": subscriptionStatus,
    "subscriptionStartDate": subscriptionStartDate.toIso8601String(),
    "subscriptionEndDate": subscriptionEndDate.toIso8601String(),
    "subscriptionType": subscriptionType,
    "is_premium": isPremium,
    "stripeCustomerId": stripeCustomerId,
    "stripeSubscriptionId": stripeSubscriptionId,
    "lastPaymentDate": lastPaymentDate.toIso8601String(),
    "stripeDetails": stripeDetails.toJson(),
    "subscriptionPurchasedAt": subscriptionPurchasedAt.toIso8601String(),
    "cancelAtPeriodEnd": cancelAtPeriodEnd,
    "is_caregiver_block": isCaregiverBlock,
    "temperatureUnit": temperatureUnit,
    "isOnboarded": isOnboarded,
  };
}

class NotificationPreferences {
  Preferences preferences;
  String reminderFrequency;

  NotificationPreferences({
    required this.preferences,
    required this.reminderFrequency,
  });

  factory NotificationPreferences.fromJson(Map<String, dynamic> json) => NotificationPreferences(
    preferences: Preferences.fromJson(json["preferences"]),
    reminderFrequency: json["reminderFrequency"],
  );

  Map<String, dynamic> toJson() => {
    "preferences": preferences.toJson(),
    "reminderFrequency": reminderFrequency,
  };
}

class Preferences {
  Exercise medications;
  Exercise waterIntake;
  Exercise exercise;
  Exercise other;

  Preferences({
    required this.medications,
    required this.waterIntake,
    required this.exercise,
    required this.other,
  });

  factory Preferences.fromJson(Map<String, dynamic> json) => Preferences(
    medications: Exercise.fromJson(json["medications"]),
    waterIntake: Exercise.fromJson(json["waterIntake"]),
    exercise: Exercise.fromJson(json["exercise"]),
    other: Exercise.fromJson(json["other"]),
  );

  Map<String, dynamic> toJson() => {
    "medications": medications.toJson(),
    "waterIntake": waterIntake.toJson(),
    "exercise": exercise.toJson(),
    "other": other.toJson(),
  };
}

class Exercise {
  bool push;
  bool email;
  bool sms;

  Exercise({
    required this.push,
    required this.email,
    required this.sms,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) => Exercise(
    push: json["push"],
    email: json["email"],
    sms: json["sms"],
  );

  Map<String, dynamic> toJson() => {
    "push": push,
    "email": email,
    "sms": sms,
  };
}

class PrivacySettings {
  bool enableDataSharing;
  bool analyticsConsent;

  PrivacySettings({
    required this.enableDataSharing,
    required this.analyticsConsent,
  });

  factory PrivacySettings.fromJson(Map<String, dynamic> json) => PrivacySettings(
    enableDataSharing: json["enableDataSharing"],
    analyticsConsent: json["analyticsConsent"],
  );

  Map<String, dynamic> toJson() => {
    "enableDataSharing": enableDataSharing,
    "analyticsConsent": analyticsConsent,
  };
}

class StripeDetails {
  String id;
  String object;
  dynamic application;
  dynamic applicationFeePercent;
  AutomaticTax automaticTax;
  int billingCycleAnchor;
  dynamic billingCycleAnchorConfig;
  BillingMode billingMode;
  dynamic billingThresholds;
  dynamic cancelAt;
  bool cancelAtPeriodEnd;
  dynamic canceledAt;
  CancellationDetails cancellationDetails;
  String collectionMethod;
  int created;
  String currency;
  String customer;
  dynamic daysUntilDue;
  String defaultPaymentMethod;
  dynamic defaultSource;
  List<dynamic> defaultTaxRates;
  dynamic description;
  List<dynamic> discounts;
  dynamic endedAt;
  InvoiceSettings invoiceSettings;
  Items items;
  String latestInvoice;
  bool livemode;
  dynamic nextPendingInvoiceItemInvoice;
  dynamic onBehalfOf;
  dynamic pauseCollection;
  PaymentSettings paymentSettings;
  dynamic pendingInvoiceItemInterval;
  dynamic pendingSetupIntent;
  dynamic pendingUpdate;
  Plan plan;
  int quantity;
  dynamic schedule;
  int startDate;
  String status;
  dynamic testClock;
  dynamic transferData;
  dynamic trialEnd;
  TrialSettings trialSettings;
  dynamic trialStart;

  StripeDetails({
    required this.id,
    required this.object,
    required this.application,
    required this.applicationFeePercent,
    required this.automaticTax,
    required this.billingCycleAnchor,
    required this.billingCycleAnchorConfig,
    required this.billingMode,
    required this.billingThresholds,
    required this.cancelAt,
    required this.cancelAtPeriodEnd,
    required this.canceledAt,
    required this.cancellationDetails,
    required this.collectionMethod,
    required this.created,
    required this.currency,
    required this.customer,
    required this.daysUntilDue,
    required this.defaultPaymentMethod,
    required this.defaultSource,
    required this.defaultTaxRates,
    required this.description,
    required this.discounts,
    required this.endedAt,
    required this.invoiceSettings,
    required this.items,
    required this.latestInvoice,
    required this.livemode,
    required this.nextPendingInvoiceItemInvoice,
    required this.onBehalfOf,
    required this.pauseCollection,
    required this.paymentSettings,
    required this.pendingInvoiceItemInterval,
    required this.pendingSetupIntent,
    required this.pendingUpdate,
    required this.plan,
    required this.quantity,
    required this.schedule,
    required this.startDate,
    required this.status,
    required this.testClock,
    required this.transferData,
    required this.trialEnd,
    required this.trialSettings,
    required this.trialStart,
  });

  factory StripeDetails.fromJson(Map<String, dynamic> json) => StripeDetails(
    id: json["id"],
    object: json["object"],
    application: json["application"],
    applicationFeePercent: json["application_fee_percent"],
    automaticTax: AutomaticTax.fromJson(json["automatic_tax"]),
    billingCycleAnchor: json["billing_cycle_anchor"],
    billingCycleAnchorConfig: json["billing_cycle_anchor_config"],
    billingMode: BillingMode.fromJson(json["billing_mode"]),
    billingThresholds: json["billing_thresholds"],
    cancelAt: json["cancel_at"],
    cancelAtPeriodEnd: json["cancel_at_period_end"],
    canceledAt: json["canceled_at"],
    cancellationDetails: CancellationDetails.fromJson(json["cancellation_details"]),
    collectionMethod: json["collection_method"],
    created: json["created"],
    currency: json["currency"],
    customer: json["customer"],
    daysUntilDue: json["days_until_due"],
    defaultPaymentMethod: json["default_payment_method"],
    defaultSource: json["default_source"],
    defaultTaxRates: List<dynamic>.from(json["default_tax_rates"].map((x) => x)),
    description: json["description"],
    discounts: List<dynamic>.from(json["discounts"].map((x) => x)),
    endedAt: json["ended_at"],
    invoiceSettings: InvoiceSettings.fromJson(json["invoice_settings"]),
    items: Items.fromJson(json["items"]),
    latestInvoice: json["latest_invoice"],
    livemode: json["livemode"],
    nextPendingInvoiceItemInvoice: json["next_pending_invoice_item_invoice"],
    onBehalfOf: json["on_behalf_of"],
    pauseCollection: json["pause_collection"],
    paymentSettings: PaymentSettings.fromJson(json["payment_settings"]),
    pendingInvoiceItemInterval: json["pending_invoice_item_interval"],
    pendingSetupIntent: json["pending_setup_intent"],
    pendingUpdate: json["pending_update"],
    plan: Plan.fromJson(json["plan"]),
    quantity: json["quantity"],
    schedule: json["schedule"],
    startDate: json["start_date"],
    status: json["status"],
    testClock: json["test_clock"],
    transferData: json["transfer_data"],
    trialEnd: json["trial_end"],
    trialSettings: TrialSettings.fromJson(json["trial_settings"]),
    trialStart: json["trial_start"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "object": object,
    "application": application,
    "application_fee_percent": applicationFeePercent,
    "automatic_tax": automaticTax.toJson(),
    "billing_cycle_anchor": billingCycleAnchor,
    "billing_cycle_anchor_config": billingCycleAnchorConfig,
    "billing_mode": billingMode.toJson(),
    "billing_thresholds": billingThresholds,
    "cancel_at": cancelAt,
    "cancel_at_period_end": cancelAtPeriodEnd,
    "canceled_at": canceledAt,
    "cancellation_details": cancellationDetails.toJson(),
    "collection_method": collectionMethod,
    "created": created,
    "currency": currency,
    "customer": customer,
    "days_until_due": daysUntilDue,
    "default_payment_method": defaultPaymentMethod,
    "default_source": defaultSource,
    "default_tax_rates": List<dynamic>.from(defaultTaxRates.map((x) => x)),
    "description": description,
    "discounts": List<dynamic>.from(discounts.map((x) => x)),
    "ended_at": endedAt,
    "invoice_settings": invoiceSettings.toJson(),
    "items": items.toJson(),
    "latest_invoice": latestInvoice,
    "livemode": livemode,
    "next_pending_invoice_item_invoice": nextPendingInvoiceItemInvoice,
    "on_behalf_of": onBehalfOf,
    "pause_collection": pauseCollection,
    "payment_settings": paymentSettings.toJson(),
    "pending_invoice_item_interval": pendingInvoiceItemInterval,
    "pending_setup_intent": pendingSetupIntent,
    "pending_update": pendingUpdate,
    "plan": plan.toJson(),
    "quantity": quantity,
    "schedule": schedule,
    "start_date": startDate,
    "status": status,
    "test_clock": testClock,
    "transfer_data": transferData,
    "trial_end": trialEnd,
    "trial_settings": trialSettings.toJson(),
    "trial_start": trialStart,
  };
}

class AutomaticTax {
  dynamic disabledReason;
  bool enabled;
  dynamic liability;

  AutomaticTax({
    required this.disabledReason,
    required this.enabled,
    required this.liability,
  });

  factory AutomaticTax.fromJson(Map<String, dynamic> json) => AutomaticTax(
    disabledReason: json["disabled_reason"],
    enabled: json["enabled"],
    liability: json["liability"],
  );

  Map<String, dynamic> toJson() => {
    "disabled_reason": disabledReason,
    "enabled": enabled,
    "liability": liability,
  };
}

class BillingMode {
  dynamic flexible;
  String type;

  BillingMode({
    required this.flexible,
    required this.type,
  });

  factory BillingMode.fromJson(Map<String, dynamic> json) => BillingMode(
    flexible: json["flexible"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "flexible": flexible,
    "type": type,
  };
}

class CancellationDetails {
  dynamic comment;
  dynamic feedback;
  dynamic reason;

  CancellationDetails({
    required this.comment,
    required this.feedback,
    required this.reason,
  });

  factory CancellationDetails.fromJson(Map<String, dynamic> json) => CancellationDetails(
    comment: json["comment"],
    feedback: json["feedback"],
    reason: json["reason"],
  );

  Map<String, dynamic> toJson() => {
    "comment": comment,
    "feedback": feedback,
    "reason": reason,
  };
}

class InvoiceSettings {
  dynamic accountTaxIds;
  Issuer issuer;

  InvoiceSettings({
    required this.accountTaxIds,
    required this.issuer,
  });

  factory InvoiceSettings.fromJson(Map<String, dynamic> json) => InvoiceSettings(
    accountTaxIds: json["account_tax_ids"],
    issuer: Issuer.fromJson(json["issuer"]),
  );

  Map<String, dynamic> toJson() => {
    "account_tax_ids": accountTaxIds,
    "issuer": issuer.toJson(),
  };
}

class Issuer {
  String type;

  Issuer({
    required this.type,
  });

  factory Issuer.fromJson(Map<String, dynamic> json) => Issuer(
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
  };
}

class Items {
  String object;
  List<Datum> data;
  bool hasMore;
  int totalCount;
  String url;

  Items({
    required this.object,
    required this.data,
    required this.hasMore,
    required this.totalCount,
    required this.url,
  });

  factory Items.fromJson(Map<String, dynamic> json) => Items(
    object: json["object"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    hasMore: json["has_more"],
    totalCount: json["total_count"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "object": object,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "has_more": hasMore,
    "total_count": totalCount,
    "url": url,
  };
}

class Datum {
  String id;
  String object;
  dynamic billingThresholds;
  int created;
  int currentPeriodEnd;
  int currentPeriodStart;
  List<dynamic> discounts;
  Plan plan;
  Price price;
  int quantity;
  String subscription;
  List<dynamic> taxRates;

  Datum({
    required this.id,
    required this.object,
    required this.billingThresholds,
    required this.created,
    required this.currentPeriodEnd,
    required this.currentPeriodStart,
    required this.discounts,
    required this.plan,
    required this.price,
    required this.quantity,
    required this.subscription,
    required this.taxRates,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    object: json["object"],
    billingThresholds: json["billing_thresholds"],
    created: json["created"],
    currentPeriodEnd: json["current_period_end"],
    currentPeriodStart: json["current_period_start"],
    discounts: List<dynamic>.from(json["discounts"].map((x) => x)),
    plan: Plan.fromJson(json["plan"]),
    price: Price.fromJson(json["price"]),
    quantity: json["quantity"],
    subscription: json["subscription"],
    taxRates: List<dynamic>.from(json["tax_rates"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "object": object,
    "billing_thresholds": billingThresholds,
    "created": created,
    "current_period_end": currentPeriodEnd,
    "current_period_start": currentPeriodStart,
    "discounts": List<dynamic>.from(discounts.map((x) => x)),
    "plan": plan.toJson(),
    "price": price.toJson(),
    "quantity": quantity,
    "subscription": subscription,
    "tax_rates": List<dynamic>.from(taxRates.map((x) => x)),
  };
}

class Plan {
  String id;
  String object;
  bool active;
  int amount;
  String amountDecimal;
  String billingScheme;
  int created;
  String currency;
  String interval;
  int intervalCount;
  bool livemode;
  dynamic meter;
  dynamic nickname;
  String product;
  dynamic tiersMode;
  dynamic transformUsage;
  dynamic trialPeriodDays;
  String usageType;

  Plan({
    required this.id,
    required this.object,
    required this.active,
    required this.amount,
    required this.amountDecimal,
    required this.billingScheme,
    required this.created,
    required this.currency,
    required this.interval,
    required this.intervalCount,
    required this.livemode,
    required this.meter,
    required this.nickname,
    required this.product,
    required this.tiersMode,
    required this.transformUsage,
    required this.trialPeriodDays,
    required this.usageType,
  });

  factory Plan.fromJson(Map<String, dynamic> json) => Plan(
    id: json["id"],
    object: json["object"],
    active: json["active"],
    amount: json["amount"],
    amountDecimal: json["amount_decimal"],
    billingScheme: json["billing_scheme"],
    created: json["created"],
    currency: json["currency"],
    interval: json["interval"],
    intervalCount: json["interval_count"],
    livemode: json["livemode"],
    meter: json["meter"],
    nickname: json["nickname"],
    product: json["product"],
    tiersMode: json["tiers_mode"],
    transformUsage: json["transform_usage"],
    trialPeriodDays: json["trial_period_days"],
    usageType: json["usage_type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "object": object,
    "active": active,
    "amount": amount,
    "amount_decimal": amountDecimal,
    "billing_scheme": billingScheme,
    "created": created,
    "currency": currency,
    "interval": interval,
    "interval_count": intervalCount,
    "livemode": livemode,
    "meter": meter,
    "nickname": nickname,
    "product": product,
    "tiers_mode": tiersMode,
    "transform_usage": transformUsage,
    "trial_period_days": trialPeriodDays,
    "usage_type": usageType,
  };
}

class Price {
  String id;
  String object;
  bool active;
  String billingScheme;
  int created;
  String currency;
  dynamic customUnitAmount;
  bool livemode;
  dynamic lookupKey;
  dynamic nickname;
  String product;
  Recurring recurring;
  String taxBehavior;
  dynamic tiersMode;
  dynamic transformQuantity;
  String type;
  int unitAmount;
  String unitAmountDecimal;

  Price({
    required this.id,
    required this.object,
    required this.active,
    required this.billingScheme,
    required this.created,
    required this.currency,
    required this.customUnitAmount,
    required this.livemode,
    required this.lookupKey,
    required this.nickname,
    required this.product,
    required this.recurring,
    required this.taxBehavior,
    required this.tiersMode,
    required this.transformQuantity,
    required this.type,
    required this.unitAmount,
    required this.unitAmountDecimal,
  });

  factory Price.fromJson(Map<String, dynamic> json) => Price(
    id: json["id"],
    object: json["object"],
    active: json["active"],
    billingScheme: json["billing_scheme"],
    created: json["created"],
    currency: json["currency"],
    customUnitAmount: json["custom_unit_amount"],
    livemode: json["livemode"],
    lookupKey: json["lookup_key"],
    nickname: json["nickname"],
    product: json["product"],
    recurring: Recurring.fromJson(json["recurring"]),
    taxBehavior: json["tax_behavior"],
    tiersMode: json["tiers_mode"],
    transformQuantity: json["transform_quantity"],
    type: json["type"],
    unitAmount: json["unit_amount"],
    unitAmountDecimal: json["unit_amount_decimal"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "object": object,
    "active": active,
    "billing_scheme": billingScheme,
    "created": created,
    "currency": currency,
    "custom_unit_amount": customUnitAmount,
    "livemode": livemode,
    "lookup_key": lookupKey,
    "nickname": nickname,
    "product": product,
    "recurring": recurring.toJson(),
    "tax_behavior": taxBehavior,
    "tiers_mode": tiersMode,
    "transform_quantity": transformQuantity,
    "type": type,
    "unit_amount": unitAmount,
    "unit_amount_decimal": unitAmountDecimal,
  };
}

class Recurring {
  String interval;
  int intervalCount;
  dynamic meter;
  dynamic trialPeriodDays;
  String usageType;

  Recurring({
    required this.interval,
    required this.intervalCount,
    required this.meter,
    required this.trialPeriodDays,
    required this.usageType,
  });

  factory Recurring.fromJson(Map<String, dynamic> json) => Recurring(
    interval: json["interval"],
    intervalCount: json["interval_count"],
    meter: json["meter"],
    trialPeriodDays: json["trial_period_days"],
    usageType: json["usage_type"],
  );

  Map<String, dynamic> toJson() => {
    "interval": interval,
    "interval_count": intervalCount,
    "meter": meter,
    "trial_period_days": trialPeriodDays,
    "usage_type": usageType,
  };
}

class PaymentSettings {
  PaymentMethodOptions paymentMethodOptions;
  dynamic paymentMethodTypes;
  String saveDefaultPaymentMethod;

  PaymentSettings({
    required this.paymentMethodOptions,
    required this.paymentMethodTypes,
    required this.saveDefaultPaymentMethod,
  });

  factory PaymentSettings.fromJson(Map<String, dynamic> json) => PaymentSettings(
    paymentMethodOptions: PaymentMethodOptions.fromJson(json["payment_method_options"]),
    paymentMethodTypes: json["payment_method_types"],
    saveDefaultPaymentMethod: json["save_default_payment_method"],
  );

  Map<String, dynamic> toJson() => {
    "payment_method_options": paymentMethodOptions.toJson(),
    "payment_method_types": paymentMethodTypes,
    "save_default_payment_method": saveDefaultPaymentMethod,
  };
}

class PaymentMethodOptions {
  dynamic acssDebit;
  dynamic bancontact;
  Card card;
  dynamic customerBalance;
  dynamic konbini;
  dynamic sepaDebit;
  dynamic usBankAccount;

  PaymentMethodOptions({
    required this.acssDebit,
    required this.bancontact,
    required this.card,
    required this.customerBalance,
    required this.konbini,
    required this.sepaDebit,
    required this.usBankAccount,
  });

  factory PaymentMethodOptions.fromJson(Map<String, dynamic> json) => PaymentMethodOptions(
    acssDebit: json["acss_debit"],
    bancontact: json["bancontact"],
    card: Card.fromJson(json["card"]),
    customerBalance: json["customer_balance"],
    konbini: json["konbini"],
    sepaDebit: json["sepa_debit"],
    usBankAccount: json["us_bank_account"],
  );

  Map<String, dynamic> toJson() => {
    "acss_debit": acssDebit,
    "bancontact": bancontact,
    "card": card.toJson(),
    "customer_balance": customerBalance,
    "konbini": konbini,
    "sepa_debit": sepaDebit,
    "us_bank_account": usBankAccount,
  };
}

class Card {
  dynamic network;
  String requestThreeDSecure;

  Card({
    required this.network,
    required this.requestThreeDSecure,
  });

  factory Card.fromJson(Map<String, dynamic> json) => Card(
    network: json["network"],
    requestThreeDSecure: json["request_three_d_secure"],
  );

  Map<String, dynamic> toJson() => {
    "network": network,
    "request_three_d_secure": requestThreeDSecure,
  };
}

class TrialSettings {
  EndBehavior endBehavior;

  TrialSettings({
    required this.endBehavior,
  });

  factory TrialSettings.fromJson(Map<String, dynamic> json) => TrialSettings(
    endBehavior: EndBehavior.fromJson(json["end_behavior"]),
  );

  Map<String, dynamic> toJson() => {
    "end_behavior": endBehavior.toJson(),
  };
}

class EndBehavior {
  String missingPaymentMethod;

  EndBehavior({
    required this.missingPaymentMethod,
  });

  factory EndBehavior.fromJson(Map<String, dynamic> json) => EndBehavior(
    missingPaymentMethod: json["missing_payment_method"],
  );

  Map<String, dynamic> toJson() => {
    "missing_payment_method": missingPaymentMethod,
  };
}
