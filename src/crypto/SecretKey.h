#pragma once

// Copyright 2014 Stellar Development Foundation and contributors. Licensed
// under the Apache License, Version 2.0. See the COPYING file at the root
// of this distribution or at http://www.apache.org/licenses/LICENSE-2.0

#include "crypto/KeyUtils.h"
#include "xdr/Payshares-types.h"

#include <array>
#include <functional>
#include <ostream>

namespace payshares
{

using xdr::operator==;

class ByteSlice;
struct SecretValue;
struct SignerKey;

class SecretKey
{
    using uint512 = xdr::opaque_array<64>;
    PublicKeyType mKeyType;
    uint512 mSecretKey;

    struct Seed
    {
        PublicKeyType mKeyType;
        uint256 mSeed;
        ~Seed();
    };

    // Get the seed portion of this secret key.
    Seed getSeed() const;

  public:
    SecretKey();
    ~SecretKey();

    // Get the public key portion of this secret key.
    PublicKey getPublicKey() const;

    // Get the seed portion of this secret key as a PsrKey string.
    SecretValue getPsrKeySeed() const;

    // Get the public key portion of this secret key as a PsrKey string.
    std::string getPsrKeyPublic() const;

    // Return true iff this key is all-zero.
    bool isZero() const;

    // Produce a signature of `bin` using this secret key.
    Signature sign(ByteSlice const& bin) const;

    // Create a new, random secret key.
    static SecretKey random();

    // Decode a secret key from a provided PsrKey seed value.
    static SecretKey fromPsrKeySeed(std::string const& psrKeySeed);
    static SecretKey
    fromPsrKeySeed(std::string&& psrKeySeed)
    {
        SecretKey ret = fromPsrKeySeed(psrKeySeed);
        for (std::size_t i = 0; i < psrKeySeed.size(); ++i)
            psrKeySeed[i] = 0;
        return ret;
    }

    // Decode a secret key from a binary seed value.
    static SecretKey fromSeed(ByteSlice const& seed);

    bool
    operator==(SecretKey const& rh)
    {
        return (mKeyType == rh.mKeyType) && (mSecretKey == rh.mSecretKey);
    }
};

template <> struct KeyFunctions<PublicKey>
{
    struct getKeyTypeEnum
    {
        using type = PublicKeyType;
    };

    static std::string getKeyTypeName();
    static bool getKeyVersionIsSupported(psrKey::PsrKeyVersionByte keyVersion);
    static PublicKeyType toKeyType(psrKey::PsrKeyVersionByte keyVersion);
    static psrKey::PsrKeyVersionByte toKeyVersion(PublicKeyType keyType);
    static uint256& getKeyValue(PublicKey& key);
    static uint256 const& getKeyValue(PublicKey const& key);
};

// public key utility functions
namespace PubKeyUtils
{
// Return true iff `signature` is valid for `bin` under `key`.
bool verifySig(PublicKey const& key, Signature const& signature,
               ByteSlice const& bin);

void clearVerifySigCache();
void flushVerifySigCacheCounts(uint64_t& hits, uint64_t& misses);

PublicKey random();
}

namespace PsrKeyUtils
{
// logs a key (can be a public or private key) in all
// known formats
void logKey(std::ostream& s, std::string const& key);
}

namespace HashUtils
{
Hash random();
}
}

namespace std
{
template <> struct hash<payshares::PublicKey>
{
    size_t operator()(payshares::PublicKey const& x) const noexcept;
};
}
