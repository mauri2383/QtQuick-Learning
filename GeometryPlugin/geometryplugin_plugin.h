#ifndef GEOMETRYPLUGIN_PLUGIN_H
#define GEOMETRYPLUGIN_PLUGIN_H

#include <QQmlExtensionPlugin>

class GeometryPluginPlugin : public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID QQmlExtensionInterface_iid)

public:
    void registerTypes(const char *uri) override;
};

#endif // GEOMETRYPLUGIN_PLUGIN_H
