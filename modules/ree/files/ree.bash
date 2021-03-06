#!/usr/bin/env bash

SELF="/opt/ree.bash"
EE_URL="http://rubyforge.org/frs/download.php/71096/ruby-enterprise-1.8.7-2010.02.tar.gz"
EE_FILE="ruby-enterprise-1.8.7-2010.02.tar.gz"
EE_DIR="ruby-enterprise-1.8.7-2010.02"
OPT="/opt"
PREFIX="/opt/ruby-ee"

if [ -e "${PREFIX}/bin/ruby" ]; then
    rm "${SELF}"
    exit 0
fi

cd ${OPT}

if [ -e ${EE_FILE} ]; then
    rm -rf ${EE_URL}
fi

wget -c $EE_URL
tar -xzf ${EE_FILE}

cd $EE_DIR

ruby installer.rb -a ${PREFIX}

cd ${OPT}
rm -rf "/${OPT}/${EE_FILE}" "/${OPT}/${EE_DIR}"

if [ -e "${PREFIX}/bin/ruby" ]; then
    mkdir -p "${PREFIX}/sbin"
    rm "${SELF}"
fi
