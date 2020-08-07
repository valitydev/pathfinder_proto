namespace java com.rbkmoney.pathfinder.lookup
namespace erlang pf

typedef string LookupID;
typedef string Timestamp;

enum LookupNamespace {
    adjustments = 1
    destinations = 2
    identities = 9
    invoices = 3
    parties = 10
    payments = 4
    payouts = 5
    refunds = 6
    shops = 11
    wallets = 7
    withdrawals = 8
}

struct LookupParameters {
    1: required list<LookupID> ids
    2: optional list<LookupNamespace> namespaces
}

struct RelationParameters {
    1: required LookupNamespace parent_namespace
    2: required LookupID parent_id
    3: optional list<LookupNamespace> child_namespaces
}

struct Filter {
    // Limit and offset for pagination
    1: optional i32 limit
    2: optional i32 offset
    // Only fetch the event that is considered "current" (latest)
    3: optional bool is_current
}

/**
* UPDATE: Since the source database has a tendency to change its schema a lot, the result data is now a
* flat map of string keys and values with no strict schema. Please do not rely on any fields to be present
* between repeated requests, or interpet the data as anything but a set of unformatted strings.
**/

typedef map<string, string> ResultData

struct Result {
    1: required LookupID id
    2: required LookupNamespace ns
    3: required ResultData data
    4: required Timestamp created_at
}

typedef list<Result> SearchResults

exception InvalidArguments {
    1: optional string reason
}

service Lookup {
    SearchResults Lookup (1: LookupParameters params, 2: Filter filter)

    SearchResults SearchRelated(1: RelationParameters params, 2: Filter filter)
        throws(1: InvalidArguments invalid_args)
}
