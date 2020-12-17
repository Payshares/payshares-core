#pragma once
#include <xdr/Payshares-types.h>

namespace std
{
template <> struct hash<payshares::uint256>
{
    size_t operator()(payshares::uint256 const& x) const noexcept;
};
}
