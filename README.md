# QtQuick-Learning

This repository contains some very basic projects, but useful enough to address and understand some of the peculiar features of QtQuick development



## GeometryPlugin

It is a QtQuick [plugin](https://doc.qt.io/qt-5/plugins-howto.html). The basic role of a plugin in Qt is to provide a set of re-usable graphical or not-graphical components.  
The output of a plugin project  is a set of elements:

* **a library** (assuming we are in Windows, it will be a dll). This library will not be linked with the application at build time, but it will be loaded at runtime by the QmlEngine

* **qmldir** - a file which provides some metadata about the plugin (the module and the plugin class)

* **plugin.qmltypes** - a file which contains some information about the components exported by the plugin. It will be used by QtCreator in order to detect how to manage such components (e.g. their properties, their signals, their method)

  

The GeometryPlugin provides 3 simple graphical elements:

- A square

- A rectangle

- A circle

  

## App

This is an example of application which uses the GeometryPlugin.  

It simply create a window in which are instantiated all the 3 elements exported by the GeometryPlugin.



# Setup

1. Open QtCreator and open the GeometryPlugin/GeometryPlugin.pro file
2. Build in release mode
3. If everything went well, the following files shall exist:
   1. <OUT_DIR>/import/Geometry/GeometryPlugin.dll (or .so)
   2. <OUT_DIR>/import/Geometry/qmldir
   3. <OUT_DIR>/import/Geometry/plugin.qmltypes
4. Open a new instance of QtCreator
5. Open the App/App.pro file
6. In the Build Environment, add the following environment variable:
   1. MY_PLUGIN_PATH=<set the path of the **import** directory used in step 3a-b-c
7. Build & Run

Step 4 is required if you want to investigate about the open issue #1



# Open Issues

1. The GeometryPlugin exports 2 components defined in pure QML (Square and Rect) and a component defined in C++ (Circle).  
   According to [this](https://www.qt.io/blog/qml-type-registration-in-qt-5.15) article, it is possible to generate the plugin.qmltypes automatically for the C++ defined components.   
   **Is there a way to generate the plugin.qmltypes content also for the pure QML components?**  
   Currently, the plugin.qmltypes contains in fact only the information about the Circle. This can be verified also in the App project: QtCreator does not recognize Rect and Square as a type.  
   **N.B.** In this particular scenario, if the two projects are opened in the same QtCreator instance, the problem is hidden, because QtCreator can somehow retrieve the information of the QML components. This is not the standard scenario, because usually the plugins are 3rd party software 
2. Let's suppose that we want to use the Circle component in QtDesigner.
   After opening the ShapeForm.ui there is a warning about the unrecognized component (Rect and Square). Go on and discard the warning, you can still interact with circle.  
   The circle has a property called **radius**, which allows to specify the size of the shape. **Is there a way to display such property in the *properties* secion of QtDesigner and therefore interact with it?** I could not find any tutorial on this.  
   Moreover I'd like to see the Circle component into the components Library, in order to be able to add it to the scene by a simple drag&drop like any other QML component
