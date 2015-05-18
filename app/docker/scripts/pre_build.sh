#!/bin/bash -x

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

BASE_DIR="${DIR}/../.."
TMP_DIR="${DIR}/../tmp"

mkdir -p ${TMP_DIR} > /dev/null 2>&1
rm -f ${TMP_DIR}/*.tar.gz ${TMP_DIR}/RELEASE

cd ${BASE_DIR}
cp Gemfile Gemfile.lock ${TMP_DIR}/
# git archive HEAD -o ${TMP_DIR}/app.tar.gz || tar czf ${TMP_DIR}/app.tar.gz .
tar czf ${TMP_DIR}/app.tar.gz .

cd ${TMP_DIR}
(git rev-parse HEAD || echo 'master') | cut -c -10 > RELEASE
