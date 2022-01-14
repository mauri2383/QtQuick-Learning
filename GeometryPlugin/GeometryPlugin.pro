TEMPLATE = lib
TARGET = GeometryPlugin
QT += qml quick
CONFIG += plugin c++11 qmltypes

QML_IMPORT_NAME=Geometry
QML_IMPORT_VERSION=1


TARGET = $$qtLibraryTarget($$TARGET)
uri = Geometry

# Input
SOURCES += \
        Circle.cpp \
        geometryplugin_plugin.cpp

HEADERS += \
        Circle.h \
        geometryplugin_plugin.h

DISTFILES = qmldir


PLUGIN_DIR=$$shell_path($$OUT_PWD/import/$$QML_IMPORT_NAME)

!equals(_PRO_FILE_PWD_, $$OUT_PWD) {
    create_plugin_dir.target = create_plugin_dir
    create_plugin_dir.depends = $$shell_path($$_PRO_FILE_PWD_/qmldir)
    create_plugin_dir.commands = IF NOT exist $$PLUGIN_DIR (mkdir $$PLUGIN_DIR)

    copy_qmldir.target = $$OUT_PWD/qmldir
    copy_qmldir.depends = $$create_plugin_dir.target
    copy_qmldir.commands = $(COPY_FILE) $$shell_path($$create_plugin_dir.depends) $$PLUGIN_DIR

    copy_dll.target = copy_dll
    copy_dll.depends= $$copy_qmldir.target
    copy_dll.commands = $(COPY_FILE) $$shell_path($$OUT_PWD/release/$${TARGET}.dll) $$PLUGIN_DIR

    copy_qml_types.target = copy_qml_types
    copy_qml_types.depends = $$copy_dll.target
    copy_qml_types.commands = $(COPY_FILE) $$shell_path($$OUT_PWD/plugins.qmltypes) $$PLUGIN_DIR

    QMAKE_EXTRA_TARGETS += create_plugin_dir
    QMAKE_EXTRA_TARGETS += copy_qmldir
    QMAKE_EXTRA_TARGETS += copy_dll
    QMAKE_EXTRA_TARGETS += copy_qml_types
    PRE_TARGETDEPS += $$copy_qml_types.target
}

message($$QMAKE_EXTRA_TARGETS)

qmldir.files = qmldir
unix {
    installPath = $$[QT_INSTALL_QML]/$$replace(uri, \., /)
    qmldir.path = $$installPath
    target.path = $$installPath
    INSTALLS += target qmldir
}


RESOURCES += \
    res.qrc
