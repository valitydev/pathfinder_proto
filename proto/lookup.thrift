namespace java com.rbkmoney.pathfinder.lookup
namespace erlang pf

typedef string         LookupID;
typedef list<LookupID> LookupIDs;

typedef i64     ID;
typedef string  EntityID;
typedef string  Timestamp;
typedef i64     DomainRevision;
typedef i64     PartyRevision;
typedef i64     Amount;
typedef string  CurrencyCode;

enum AdjustmentStatus {
    pending
    captured
    cancelled
    processed
}

struct Adjustment {
    1:  required ID               id
    2:  required Timestamp        event_created_at
    3:  required DomainRevision   domain_revision
    4:  required EntityID         adjustment_id
    5:  required EntityID         payment_id
    6:  required EntityID         invoice_id
    7:  required EntityID         party_id
    8:  required EntityID         shop_id
    9:  required Timestamp        created_at
    10: required AdjustmentStatus status
    11: optional Timestamp        status_captured_at
    12: optional Timestamp        status_cancelled_at
    13: required string           reason
    14: required Timestamp        wtime
    15: required bool             current
    16: optional Amount           fee
    17: optional Amount           provider_fee
    18: optional Amount           external_fee
    19: optional PartyRevision    party_revision
    20: optional ID               sequence_id
    21: optional ID               change_id
}

enum DestinationStatus {
    authorized
    unauthorized
}

enum DestinationResourceType {
    bank_card
    crypto_wallet
}

struct Destination {
    1:  required ID                      id
    2:  required ID                      event_id
    3:  required Timestamp               event_created_at
    4:  required Timestamp               event_occured_at
    5:  required ID                      sequence_id
    6:  required EntityID                destination_id
    7:  required string                  destination_name
    8:  required DestinationStatus       destination_status
    9:  optional string                  resource_bank_card_token
    10: optional string                  resource_bank_card_payment_system
    11: optional string                  resource_bank_card_bin
    12: optional string                  resource_bank_card_masked_pan
    13: optional EntityID                account_id
    14: optional EntityID                identity_id
    15: optional EntityID                party_id
    16: optional ID                      accounter_account_id
    17: optional CurrencyCode            currency_code
    18: required Timestamp               wtime
    19: required bool                    current
    20: optional EntityID                external_id
    21: optional Timestamp               created_at
    22: optional string                  context_json
    23: optional EntityID                resource_crypto_wallet_id
    24: optional string                  resource_crypto_wallet_type
    25: required DestinationResourceType resource_type
    26: optional string                  resource_crypto_wallet_data
    27: optional string                  resource_bank_card_type
    28: optional string                  resource_bank_card_issuer_country
    29: optional string                  resource_bank_card_bank_name
}

enum InvoiceStatus {
    unpaid
    paid
    cancelled
    fulfilled
}

struct Invoice {
    1:  required ID             id
    2:  required Timestamp      event_created_at
    3:  required EntityID       invoice_id
    4:  required EntityID       party_id
    5:  required EntityID       shop_id
    6:  optional PartyRevision  party_revision
    7:  required Timestamp      created_at
    8:  required InvoiceStatus  status
    9:  optional string         status_cancelled_details
    10: optional string         status_fulfilled_details
    11: required string         details_product
    12: optional string         details_description
    13: required Timestamp      due
    14: required Amount         amount
    15: required CurrencyCode   currency_code
    16: optional string         context
    17: optional EntityID       template_id
    18: required Timestamp      wtime
    19: required bool           current
    20: optional ID             sequence_id
    21: optional ID             change_id
    22: optional EntityID       external_id
}

enum PaymentStatus {
    pending
    processed
    captured
    cancelled
    refunded
    failed
}

enum PayerType {
    payment_resource
    customer
    recurrent
}

enum PaymentToolType {
    bank_card
    payment_terminal
    digital_wallet
    crypto_currency
    mobile_commerce
}

enum PaymentFlowType {
    instant
    hold
}


enum RiskScore {
    low
    high
    fatal
}

struct Payment {
    1:  required ID                     id
    2:  required Timestamp              event_created_at
    3:  required EntityID               payment_id
    4:  required Timestamp              created_at
    5:  required EntityID               invoice_id
    6:  required EntityID               party_id
    7:  required EntityID               shop_id
    8:  required DomainRevision         domain_revision
    9:  optional PartyRevision          party_revision
    10: required PaymentStatus          status
    11: optional string                 status_cancelled_reason
    12: optional string                 status_captured_reason
    13: optional string                 status_failed_failure
    14: required Amount                 amount
    15: required CurrencyCode           currency_code
    16: required PayerType              payer_type
    17: required PaymentToolType        payer_payment_tool_type
    18: optional string                 payer_bank_card_token
    19: optional string                 payer_bank_card_payment_system
    20: optional string                 payer_bank_card_bin
    21: optional string                 payer_bank_card_masked_pan
    22: optional string                 payer_bank_card_token_provider
    23: optional string                 payer_payment_terminal_type
    24: optional string                 payer_digital_wallet_provider
    25: optional EntityID               payer_digital_wallet_id
    26: optional string                 payer_payment_session_id
    27: optional string                 payer_ip_address
    28: optional string                 payer_fingerprint
    29: optional string                 payer_phone_number
    30: optional string                 payer_email
    31: optional EntityID               payer_customer_id
    32: optional EntityID               payer_customer_binding_id
    33: optional EntityID               payer_customer_rec_payment_tool_id
    34: optional binary                 context
    35: required PaymentFlowType        payment_flow_type
    36: optional string                 payment_flow_on_hold_expiration
    37: optional Timestamp              payment_flow_held_until
    38: optional RiskScore              risk_score
    39: optional ID                     route_provider_id
    40: optional ID                     route_terminal_id
    41: required Timestamp              wtime
    42: required bool                   current
    43: optional string                 session_payload_transaction_bound_trx_id
    44: optional string                 session_payload_transaction_bound_trx_extra_json
    45: optional Amount                 fee
    46: optional Amount                 provider_fee
    47: optional Amount                 external_fee
    48: optional Amount                 guarantee_deposit
    49: optional bool                   make_recurrent
    50: optional string                 payer_recurrent_parent_invoice_id
    51: optional string                 payer_recurrent_parent_payment_id
    52: optional string                 recurrent_intention_token
    53: optional ID                     sequence_id
    54: optional ID                     change_id
    55: optional string                 trx_additional_info_rrn
    56: optional string                 trx_additional_info_approval_code
    57: optional string                 trx_additional_info_acs_url
    58: optional string                 trx_additional_info_pareq
    59: optional string                 trx_additional_info_md
    60: optional string                 trx_additional_info_term_url
    61: optional string                 trx_additional_info_pares
    62: optional string                 trx_additional_info_eci
    63: optional string                 trx_additional_info_cavv
    64: optional string                 trx_additional_info_xid
    65: optional string                 trx_additional_info_cavv_algorithm
    66: optional string                 trx_additional_info_three_ds_verification
    67: optional string                 payer_crypto_currency_type
    68: optional string                 status_captured_started_reason
    69: optional string                 payer_mobile_phone_cc
    70: optional string                 payer_mobile_phone_ctn
    71: optional string                 capture_started_params_cart_json
    72: optional EntityID               external_id
    73: optional string                 payer_issuer_country
    74: optional string                 payer_bank_name
}

enum PayoutStatus {
    unpaid
    paid
    cancelled
    confirmed
}

enum PayoutStatusDetails {
    card_details
    account_details
}

enum UserType {
    internal_user
    external_user
    service_user
}

enum PayoutType {
    bank_card
    bank_account
    wallet
}

enum PayoutAccountType {
    russian_payout_account
    international_payout_account
}

struct Payout {
    1:  required ID                  id
    2:  required ID                  event_id
    3:  required Timestamp           event_created_at
    4:  required EntityID            payout_id
    5:  required EntityID            party_id
    6:  required EntityID            shop_id
    7:  required EntityID            contract_id
    8:  required Timestamp           created_at
    9:  required PayoutStatus        status
    10: optional PayoutStatusDetails status_paid_details
    11: optional string              status_paid_details_card_provider_name
    12: optional string              status_paid_details_card_provider_transaction_id
    13: optional string              status_cancelled_user_info_id
    14: optional UserType            status_cancelled_user_info_type
    15: optional string              status_cancelled_details
    16: optional string              status_confirmed_user_info_id
    17: optional UserType            status_confirmed_user_info_type
    18: required PayoutType          type
    19: optional string              type_card_token
    20: optional string              type_card_payment_system
    21: optional string              type_card_bin
    22: optional string              type_card_masked_pan
    23: optional string              type_card_token_provider
    24: optional PayoutAccountType   type_account_type
    25: optional string              type_account_russian_account
    26: optional string              type_account_russian_bank_name
    27: optional string              type_account_russian_bank_post_account
    28: optional string              type_account_russian_bank_bik
    29: optional string              type_account_russian_inn
    30: optional string              type_account_international_account_holder
    31: optional string              type_account_international_bank_name
    32: optional string              type_account_international_bank_address
    33: optional string              type_account_international_iban
    34: optional string              type_account_international_bic
    35: optional string              type_account_international_local_bank_code
    36: optional string              type_account_international_legal_entity_legal_name
    37: optional string              type_account_international_legal_entity_trading_name
    38: optional string              type_account_international_legal_entity_registered_address
    39: optional string              type_account_international_legal_entity_actual_address
    40: optional string              type_account_international_legal_entity_registered_number
    41: optional string              type_account_purpose
    42: optional Timestamp           type_account_legal_agreement_signed_at
    43: optional string              type_account_legal_agreement_id
    44: optional Timestamp           type_account_legal_agreement_valid_until
    45: required Timestamp           wtime
    46: required bool                current
    47: optional string              type_account_international_bank_number
    48: optional string              type_account_international_bank_aba_rtn
    49: optional string              type_account_international_bank_country_code
    50: optional string              type_account_international_correspondent_bank_number
    51: optional string              type_account_international_correspondent_bank_account
    52: optional string              type_account_international_correspondent_bank_name
    53: optional string              type_account_international_correspondent_bank_address
    54: optional string              type_account_international_correspondent_bank_bic
    55: optional string              type_account_international_correspondent_bank_iban
    56: optional string              type_account_international_correspondent_bank_aba_rtn
    57: optional string              type_account_international_correspondent_bank_country_code
    58: optional Amount              amount
    59: optional Amount              fee
    60: optional CurrencyCode        currency_code
    61: optional EntityID            wallet_id
}

enum RefundStatus {
    pending
    succeeded
    failed
}

struct Refund {
    1:  required ID             id
    2:  required Timestamp      event_created_at
    3:  required DomainRevision domain_revision
    4:  required EntityID       refund_id
    5:  required EntityID       payment_id
    6:  required EntityID       invoice_id
    7:  required EntityID       party_id
    8:  required EntityID       shop_id
    9:  required Timestamp      created_at
    10: required RefundStatus   status
    11: optional string         status_failed_failure
    12: optional Amount         amount
    13: optional CurrencyCode   currency_code
    14: optional string         reason
    15: required Timestamp      wtime
    16: required bool           current
    17: optional string         session_payload_transaction_bound_trx_id
    18: optional string         session_payload_transaction_bound_trx_extra_json
    19: optional Amount         fee
    20: optional Amount         provider_fee
    21: optional Amount         external_fee
    22: optional PartyRevision  party_revision
    23: optional ID             sequence_id
    24: optional ID             change_id
    25: optional EntityID       external_id
}

struct Wallet {
    1:  required ID           id
    2:  required ID           event_id
    3:  required Timestamp    event_created_at
    4:  required Timestamp    event_occured_at
    5:  required ID           sequence_id
    6:  required EntityID     wallet_id
    7:  required string       wallet_name
    8:  optional EntityID     identity_id
    9:  optional EntityID     party_id
    10: optional CurrencyCode currency_code
    11: required Timestamp    wtime
    12: required bool         current
    13: optional EntityID     account_id
    14: optional i64          accounter_account_id
    15: optional EntityID     external_id
}

enum WithdrawalStatus {
    pending
    succeeded
    failed
}

enum WithdrawalTransferStatus {
    created
    prepared
    committed
    cancelled
}

struct Withdrawal {
    1:  required ID                       id
    2:  required ID                       event_id
    3:  required Timestamp                event_created_at
    4:  required Timestamp                event_occured_at
    5:  required ID                       sequence_id
    6:  required EntityID                 wallet_id
    7:  required EntityID                 destination_id
    8:  required EntityID                 withdrawal_id
    9:  optional EntityID                 provider_id
    10: required Amount                   amount
    11: required CurrencyCode             currency_code
    12: required WithdrawalStatus         withdrawal_status
    13: optional WithdrawalTransferStatus withdrawal_transfer_status
    14: required Timestamp                wtime
    15: required bool                     current
    16: optional Amount                   fee
    17: optional Amount                   provider_fee
    18: optional EntityID                 external_id
    19: optional string                   context_json
    20: optional string                   withdrawal_status_failed_failure_json
}

struct Identity {
     1: required ID        id
     2: required ID        event_id
     3: required Timestamp event_created_at
     4: required Timestamp event_occured_at
     5: required ID        sequence_id
     6: required EntityID  party_id
     7: required EntityID  party_contract_id
     8: required EntityID  identity_id
     9: required EntityID  identity_provider_id
    10: required EntityID  identity_class_id
    11: optional EntityID  identity_effective_chalenge_id
    12: optional EntityID  identity_level_id
    13: required Timestamp wtime
    14: required bool      current
    15: optional string    external_id
    16: optional bool      blocked
    17: optional string    context_json
}


enum BlockingStatus {
    unblocked
    blocked
}

enum SuspensionStatus {
    active
    suspended
}

struct Party {
     1: required ID               id
     2: required ID               event_id
     3: required Timestamp        event_created_at
     4: required EntityID         party_id
     5: required string           contact_info_email
     6: required Timestamp        created_at
     7: required BlockingStatus   blocking
     8: optional string           blocking_unblocked_reason
     9: optional Timestamp        blocking_unblocked_since
    10: optional string           blocking_blocked_reason
    11: optional Timestamp        blocking_blocked_since
    12: required SuspensionStatus suspension
    13: optional Timestamp        suspension_active_since
    14: optional Timestamp        suspension_suspended_since
    15: required PartyRevision    revision
    16: optional Timestamp        revision_changed_at
    17: optional string           party_meta_set_ns
    18: optional string           party_meta_set_data_json
    19: required Timestamp        wtime
    20: required bool             current
}

struct Shop {
     1: required ID               id
     2: required ID               event_id
     3: required Timestamp        event_created_at
     4: required EntityID         party_id
     5: required EntityID         shop_id
     6: required Timestamp        created_at
     7: required BlockingStatus   blocking
     8: optional string           blocking_unblocked_reason
     9: optional Timestamp        blocking_unblocked_since
    10: optional string           blocking_blocked_reason
    11: optional Timestamp        blocking_blocked_since
    12: required SuspensionStatus suspension
    13: optional Timestamp        suspension_active_since
    14: optional Timestamp        suspension_suspended_since
    15: required string           details_name
    16: optional string           details_description
    17: required string           location_url
    18: required ID               category_id
    19: optional string           account_currency_code
    20: optional ID               account_settlement
    21: optional ID               account_guarantee
    22: optional ID               account_payout
    23: required EntityID         contract_id
    24: optional EntityID         payout_tool_id
    25: optional ID               payout_schedule_id
    26: required Timestamp        wtime
    27: required bool             current
    28: optional PartyRevision    revision
}

struct LookupRequest {
    1: required list<LookupID> ids
    2: optional list<LookupNamespace> namespaces
}

struct LookupResult {
    1: required list<ResultData> data
}

struct AdjustmentNamespace  {}
struct DestinationNamespace {}
struct IdentityNamespace    {}
struct InvoiceNamespace     {}
struct PartyNamespace       {}
struct PaymentNamespace     {}
struct PayoutNamespace      {}
struct RefundNamespace      {}
struct ShopNamespace        {}
struct WalletNamespace      {}
struct WithdrawalNamespace  {}

union LookupNamespace {
     1: AdjustmentNamespace  adjustments
     2: DestinationNamespace destinations
     3: IdentityNamespace    idenitites
     4: InvoiceNamespace     invoices
     5: PartyNamespace       parties
     6: PaymentNamespace     payments
     7: PayoutNamespace      payouts
     8: RefundNamespace      refunds
     9: ShopNamespace        shops
    10: WalletNamespace      wallets
    11: WithdrawalNamespace  withdrawals
}

union ResultData {
     1: list<Adjustment>  adjustments
     2: list<Destination> destinations
     9: list<Identity>    idenitites
     3: list<Invoice>     invoices
    10: list<Party>       parties
     4: list<Payment>     payments
     5: list<Payout>      payouts
     6: list<Refund>      refunds
    11: list<Shop>        shops
     7: list<Wallet>      wallets
     8: list<Withdrawal>  withdrawals
}

exception InvalidArguments {
    1: optional string reason
}

service Lookup {
    LookupResult Lookup (1: LookupRequest request)
        throws(1: InvalidArguments invalid_args)
}