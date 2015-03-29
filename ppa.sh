#!/bin/sh

DISTS="precise trusty"

for DIST in ${DISTS}; do
    sed "s/%%DIST%%/${DIST}/g" debian/changelog.template > debian/changelog
    debuild --no-tgz-check -S
done
