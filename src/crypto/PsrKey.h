#pragma once
// Copyright 2014 Stellar Development Foundation and contributors. Licensed
// under the Apache License, Version 2.0. See the COPYING file at the root
// of this distribution or at http://www.apache.org/licenses/LICENSE-2.0

#include "ByteSlice.h"
#include <string>

namespace payshares
{

struct SecretValue;

namespace psrKey
{

enum PsrKeyVersionByte : uint8_t
{
    // version bytes - 5 bits only
    /* Payshares Modification to Addressing
    STRKEY_PUBKEY_ED25519 = 6, // 'G'
    STRKEY_SEED_ED25519 = 18,  // 'S'
    STRKEY_PRE_AUTH_TX = 19,   // 'T',
    STRKEY_HASH_X = 23         // 'X' 
    */
    PSRKEY_PUBKEY_ED25519 = 15, // 'P'
    PSRKEY_SEED_ED25519 = 18,  // 'S'
    PSRKEY_PRE_AUTH_TX = 19,   // 'T',
    PSRKEY_HASH_X = 23         // 'X'
};

// Encode a version byte and ByteSlice into PsrKey
SecretValue toPsrKey(uint8_t ver, ByteSlice const& bin);

// computes the size of the PsrKey that would result from encoding
// a ByteSlice of dataSize bytes
size_t getPsrKeySize(size_t dataSize);

// returns true if the psrKey could be decoded
bool fromPsrKey(std::string const& psrKey, uint8_t& outVersion,
                std::vector<uint8_t>& decoded);
}
}
