# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = pract5

CONFIG += sailfishapp

SOURCES += src/pract5.cpp

DISTFILES += qml/pract5.qml \
    qml/cover/CoverPage.qml \
    qml/pages/FirstPage.qml \
    qml/pages/PageEight.qml \
    qml/pages/PageFive.qml \
    qml/pages/PageFour.qml \
    qml/pages/PageSeven.qml \
    qml/pages/PageSix.qml \
    qml/pages/SecondPage.qml \
    qml/pages/ThirdPage.qml \
    rpm/pract5.changes.in \
    rpm/pract5.changes.run.in \
    rpm/pract5.spec \
    rpm/pract5.yaml \
    translations/*.ts \
    pract5.desktop

SAILFISHAPP_ICONS = 86x86 108x108 128x128 172x172

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n

# German translation is enabled as an example. If you aren't
# planning to localize your app, remember to comment out the
# following TRANSLATIONS line. And also do not forget to
# modify the localized app name in the the .desktop file.
TRANSLATIONS += translations/pract5-de.ts
