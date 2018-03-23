TEMPLATE = app

QT += quick multimedia

SOURCES = main.cpp filter.cpp opencvhelper.cpp
HEADERS = filter.h opencvhelper.h rgbframehelper.h

RESOURCES = qtcvrecog.qrc

OTHER_FILES = main.qml

!isEmpty(OPENCV_DIR) {
    INCLUDEPATH += $$OPENCV_DIR/include
    LIBS += -L $$OPENCV_DIR/lib
}

!contains(QT_CONFIG, no-pkg-config) {
    CONFIG += link_pkgconfig
    PKGCONFIG += opencv
} else {
    LIBS += -lopencv_core -lopencv_ximgproc -lopencv_objdetect
}

osx {
    CONFIG -= app_bundle
    # To avoid issues with the C++ libs
    CONFIG += c++11
}

QT_QUICK_NO_TEXTURE_VIDEOFRAMES=1

INCLUDEPATH += /opt/b2qt/2.2.2/sysroots/cortexa9hf-neon-poky-linux-gnueabi/usr/include/opencv
LIBS += -lopencv_core \
        -lopencv_imgproc \
        -lopencv_highgui \
        -lopencv_objdetect \
        -lopencv_imgcodecs \
        -lopencv_videoio \
        -lopencv_flann \
        -lopencv_features2d \
        -lopencv_photo \
        -lopencv_video \
        -lopencv_ccalib \
        -lopencv_videostab \
        -lopencv_shape \
        -lopencv_stitching \
        -lopencv_superres \
        -lopencv_dnn \
        -lopencv_ml \


target.path = /data/user/qt/$$TARGET
dataFiles.files = *.xml
dataFiles.path = /data/user/qt/$$TARGET
INSTALLS += target dataFiles
