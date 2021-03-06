#ifndef QTEST_PLATFORM_H
#define QTEST_PLATFORM_H

#include <QApplication>
#include <QTest>

// If we're running with a GUI (i.e. X11), we can watch the app doing tests
#define IF_VISUAL if(QApplication::platformName() != "offscreen")
#define IF_NOT_VISUAL if(!(QApplication::platformName() != "offscreen"))

#define VISUAL_WAIT                                                            \
    do                                                                         \
    {                                                                          \
        IF_VISUAL { QTest::qWait(750); }                                       \
    } while(0)

// Filter out unwanted messages arising from -platform "offscreen"
static QtMessageHandler orig_message_handler;
static void offscreenMessageOutput(QtMsgType                 type,
                                   const QMessageLogContext &context,
                                   const QString &           msg)
{
    switch(type)
    {
    case QtWarningMsg:
        if(msg.contains("Cannot find font directory")
           || msg.contains("This plugin does not support propagateSizeHints()"))
        {
            // Ignore this message.
            return;
        }
    /* FALLTHROUGH */
    default:
        orig_message_handler(type, context, msg);
    }
}

#endif
