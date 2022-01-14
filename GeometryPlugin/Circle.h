#ifndef CIRCLE_H
#define CIRCLE_H

#include <QQuickPaintedItem>

class Circle : public QQuickPaintedItem
{
    Q_OBJECT
    Q_DISABLE_COPY(Circle)
    QML_ELEMENT

    Q_PROPERTY(int radius READ radius WRITE setRadius NOTIFY radiusChanged)
    Q_PROPERTY(QString color READ color WRITE setColor NOTIFY colorChanged)

    int m_radius=80;

    QString m_color="yellow";

public:
    explicit Circle(QQuickItem *parent = nullptr);
    ~Circle() override;
    int radius() const;
    void setRadius(int newRadius);

    void paint(QPainter *painter) override;
    const QString &color() const;
    void setColor(const QString &newColor);

signals:
    void radiusChanged();
    void colorChanged();
};

#endif // CIRCLE_H
