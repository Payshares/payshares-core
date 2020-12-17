#pragma once

// Copyright 2017 Stellar Development Foundation and contributors. Licensed
// under the Apache License, Version 2.0. See the COPYING file at the root
// of this distribution or at http://www.apache.org/licenses/LICENSE-2.0

#include "catchup/CatchupWork.h"
#include "history/HistoryTestsUtils.h"
#include "lib/catch.hpp"
#include "xdr/Payshares-transaction.h"
#include "xdrpp/printer.h"

namespace payshares
{

struct OfferState;
}

namespace Catch
{

template <> std::string toString(payshares::ClaimOfferAtom const& coa);

template <> std::string toString(payshares::Hash const& tr);

template <> std::string toString(payshares::OfferEntry const& oe);

template <> std::string toString(payshares::OfferState const& os);

template <> std::string toString(payshares::TransactionResult const& tr);

template <> std::string toString(payshares::CatchupRange const& cr);

template <>
std::string toString(payshares::historytestutils::CatchupPerformedWork const& cm);
}
