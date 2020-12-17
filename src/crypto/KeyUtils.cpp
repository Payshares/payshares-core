// Copyright 2016 Stellar Development Foundation and contributors. Licensed
// under the Apache License, Version 2.0. See the COPYING file at the root
// of this distribution or at http://www.apache.org/licenses/LICENSE-2.0

#include "KeyUtils.h"

#include "crypto/PsrKey.h"

namespace payshares
{

size_t
KeyUtils::getKeyVersionSize(psrKey::PsrKeyVersionByte keyVersion)
{
    switch (keyVersion)
    {
    case psrKey::PSRKEY_PUBKEY_ED25519:
    case psrKey::PSRKEY_SEED_ED25519:
        return crypto_sign_PUBLICKEYBYTES;
    case psrKey::PSRKEY_PRE_AUTH_TX:
    case psrKey::PSRKEY_HASH_X:
        return 32U;
    default:
        throw std::invalid_argument("invalid key version: " +
                                    std::to_string(keyVersion));
    }
}
}
