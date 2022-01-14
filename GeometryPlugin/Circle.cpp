#include "Circle.h"
#include <QBrush>
#include <QPainter>

Circle::Circle(QQuickItem *parent)
    : QQuickPaintedItem(parent)
{
    // By default, QQuickItem does not draw anything. If you subclass
    // QQuickItem to create a visual item, you will need to uncomment the
    // following line and re-implement updatePaintNode()

    // setFlag(ItemHasContents, true);
    setWidth(m_radius);
    setHeight(m_radius);
    update();

}

Circle::~Circle()
{
}

int Circle::radius() const
{
    return m_radius;
}

void Circle::setRadius(int newRadius)
{
    if (m_radius == newRadius)
        return;
    m_radius = newRadius;
    setWidth(m_radius);
    setHeight(m_radius);
    emit radiusChanged();
}

void Circle::paint(QPainter *painter)
{
    // Object rendering
    QColor c(m_color);
    QBrush  brush(c);               // choose background color, ...

    painter->setPen(Qt::NoPen);                             // We remove the outline
    painter->setRenderHints(QPainter::Antialiasing, true);  // Turn on anti-aliasing

    painter->setBrush(c);
    painter->drawEllipse(0, 0, radius(), radius());
}

const QString &Circle::color() const
{
    return m_color;
}

void Circle::setColor(const QString &newColor)
{
    if (m_color == newColor)
        return;
    m_color = newColor;
    emit colorChanged();
}
