% payshares-core(1)
% Stellar Development Foundation
%

# NAME

payshares-core - Core daemon for Payshares payment network

# SYNOPSYS

payshares-core [OPTIONS]

# DESCRIPTION

Payshares is a decentralized, federated peer-to-peer network that allows
people to send payments in any asset anywhere in the world
instantaneously, and with minimal fee. `Payshares-core` is the core
component of this network. `Payshares-core` is a C++ implementation of
the Payshares Consensus Protocol configured to construct a chain of
ledgers that are guaranteed to be in agreement across all the
participating nodes at all times.

## Configuration file

In most modes of operation, payshares-core requires a configuration
file.  By default, it looks for a file called `payshares-core.cfg` in
the current working directory, but this default can be changed by the
`--conf` command-line option.  The configuration file is in TOML
syntax.  The full set of supported directives can be found in
`%prefix%/share/doc/payshares-core_example.cfg`.

%commands%

# EXAMPLES

See `%prefix%/share/doc/*.cfg` for some example payshares-core
configuration files

# FILES

payshares-core.cfg
:   Configuration file (in current working directory by default)

# SEE ALSO

<https://www.payshares.org/developers/payshares-core/software/admin.html>
:   payshares-core administration guide

<https://www.payshares.org>
:   Home page of Payshares development foundation

# BUGS

Please report bugs using the github issue tracker:\
<https://github.com/payshares/payshares-core/issues>
