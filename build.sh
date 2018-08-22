#!/bin/sh
set -x

case `uname` in Darwin)
  rm -rf Tarsnap.app Tarsnap.zip
  export PATH="$(brew --prefix qt)/bin:$PATH";;
esac

QT_SELECT=qt5 qmake && make "$@" || exit 1

case `uname` in Darwin)
  macdeployqt Tarsnap.app && zip -r Tarsnap.zip Tarsnap.app && sha256sums Tarsnap.zip;;
esac
