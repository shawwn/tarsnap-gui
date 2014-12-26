#-------------------------------------------------
#
# Project created by QtCreator 2014-12-10T01:25:38
#
#-------------------------------------------------

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = Tarsnappy
TEMPLATE = app


SOURCES += main.cpp\
        mainwidget.cpp \
    backuplistwidget.cpp \
    setupdialog.cpp

HEADERS  += mainwidget.h \
    backuplistwidget.h \
    setupdialog.h

FORMS    += mainwidget.ui \
    restoreitemwidget.ui \
    backupitemwidget.ui \
    setupdialog.ui

RESOURCES += \
    resources.qrc
