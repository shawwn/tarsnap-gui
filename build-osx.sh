#!/bin/sh
set -x

rm -rf Tarsnap.app Tarsnap.zip && qmake && make clean && make -j4 && macdeployqt Tarsnap.app && zip -r Tarsnap.zip Tarsnap.app && sha256sums Tarsnap.zip
