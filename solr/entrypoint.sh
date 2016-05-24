#!/usr/bin/env bash
#  vim:ts=4:sts=4:sw=4:et
#
#  Author: Hari Sekhon
#  Date: 2016-04-24 21:29:46 +0100 (Sun, 24 Apr 2016)
#
#  https://github.com/harisekhon/Dockerfiles
#
#  License: see accompanying Hari Sekhon LICENSE file
#
#  If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback
#
#  https://www.linkedin.com/in/harisekhon
#

set -euo pipefail
[ -n "${DEBUG:-}" ] && set -x

srcdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

export JAVA_HOME="${JAVA_HOME:-/usr}"

export SOLR_HOME="/solr"

# solr -e cloud fails if not called from $SOLR_HOME
cd "$SOLR_HOME"

if [ $# -gt 0 ]; then
    exec $@
else
    if ls -d "$SOLR_HOME-3"* &>/dev/null; then
        cd "$SOLR_HOME/example"
        java -jar start.jar
    else
        solr
    fi
fi
