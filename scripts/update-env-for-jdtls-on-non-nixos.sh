#!/usr/bin/env sh

if [ -n "$JAVA_HOME" ]; then
    major=$("$JAVA_HOME/bin/java" -version 2>&1 | sed -n 's/.*version "\([0-9]*\).*/\1/p')
    eval "export JAVA_${major}_HOME=\"$JAVA_HOME\""
    export NIX_JAVA_RUNTIMES="$major"
fi
