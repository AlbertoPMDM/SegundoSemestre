fun = []
error = 1

def f(fun, x):
    s = 0
    for i in range(len(fun)):
        s += fun[i] * x **(len(fun)- i - 1)
    return s

def pm(a, b):
    return (b + a)/2

n = int(input("Ingrese el grado del polinomio: "))
print("\n")

for i in range(n + 1):
    fun.append(float(input("Ingrese el coeficiente de grado " + str(n-i) + ": ")))

print("\n")
a = float(input("Ingrese el extremo iquierdo del intervalo: "))
b = float(input("Ingrese el extremo derecho del intervalo: "))

while error >= 0.001:

    if f(fun, a)*f(fun, pm(a,b)) < 0:
        b2 = pm(a,b)
        error = abs((pm(a,b)-b)/pm(a,b))
        b = b2
 
    else:
        a2 = pm(a,b)
        error = abs((pm(a,b)-a)/pm(a,b))
        a = a2

print("\n")
print("La raiz es: " + str(pm(a,b)))
