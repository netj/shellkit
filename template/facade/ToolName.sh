#!/usr/bin/env bash
# ToolName -- The command-line interface to ToolName
# Usage: ToolName COMMAND [ARG]...
#
# Generator: ShellKit (https://github.com/netj/shellkit)
# Generated: @ShellKitTimestamp@
set -eu

# Detect where ToolName is installed
Self=`readlink -f "$0" || echo "$0"`
Here=`dirname "$Self"`


# Setup some environment
export TOOLNAME_HOME=${Here%/@TOOLNAME_BINDIR@}
export TOOLNAME_BINDIR="$TOOLNAME_HOME/@TOOLNAME_BINDIR@"
export TOOLNAME_LIBDIR="$TOOLNAME_HOME/@TOOLNAME_LIBDIR@"
export TOOLNAME_TOOLSDIR="$TOOLNAME_HOME/@TOOLNAME_TOOLSDIR@"
export TOOLNAME_DATADIR="$TOOLNAME_HOME/@TOOLNAME_DATADIR@"
export TOOLNAME_DOCDIR="$TOOLNAME_HOME/@TOOLNAME_DOCDIR@"

export PATH="$TOOLNAME_TOOLSDIR:$TOOLNAME_HOME/lib/shellkit:$PATH"


# Process input arguments
[ $# -gt 0 ] || usage "$0" "No COMMAND given"
Cmd=$1; shift


# Check it is a valid command
exe=ToolName-"$Cmd"
if type "$exe" &>/dev/null; then
    set -- "$exe" "$@"
else
    error "$Cmd: Unknown ToolName command" || true
    echo "Try \`ToolName help' for usage."
    false
fi


# Run given command under this environment
exec "$@"
