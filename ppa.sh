#!/bin/sh

DISTS="precise trusty"

for DIST in ${DISTS}; do
    sed "s/%%DIST%%/${DIST}/g" debian/changelog.template > debian/changelog
    debuild --no-tgz-check -S
    (cd ..; dput ppa:gslin/gohls "gohls_1.0.5-1ppa1~${DIST}_source.changes")
done
