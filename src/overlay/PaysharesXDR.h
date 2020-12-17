#pragma once
#include "xdr/Payshares-ledger-entries.h"
#include "xdr/Payshares-ledger.h"
#include "xdr/Payshares-overlay.h"
#include "xdr/Payshares-transaction.h"
#include "xdr/Payshares-types.h"

namespace payshares
{

std::string xdr_printer(const PublicKey& pk);
}
