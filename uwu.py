def sum1(x):
    s = 0
    for i in range(len(x)):
        s += x[i] 
    return s

def sum2(x, y):
    s = 0
    for i in range(len(x)):
        s += x[i]*y[i]
    return s

x = []
y = []

N = int(input("Ingrese la cantidad de puntos que va a ingresar: "))

for i in range(N):
    x.append(float(input("Ingrese la coordenada x del punto " + str(i + 1) + ": ")))
    y.append(float(input("Ingrese la coordenada y del punto " + str(i + 1) + ": ")))

m = (N*sum2(x,y)-sum1(x)*sum1(y))/(N*sum2(x,x)- sum1(x)**2)
b = (sum1(y) - m*sum1(x))/N

print("La ecuación de la recta de los puntos dados es: y=", m, "x +", b)