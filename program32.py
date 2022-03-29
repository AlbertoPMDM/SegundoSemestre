# ALberto Mendez 20222903

'''
el seno de x puede representarse como la serie infinita
sinx = sum_(n=1)^(\inf) (-1)^(n-1) \frac{x^(2n-1){(2n-1)!}}

como la computadora no puede calcularla infinta, se trunca a un numero de terminos

escribe un programa que de un valor de x en grados, y calcule la funcion seno usando
la serie truncada hasta N de ternimos, considerando N=1,2,3,4,5,6,7,8,9

al final compare el valor dado con el de np.sin, y diga cuantos terminos son suficientes
para una buena aproximacion
'''

import numpy as np

def sinApprox(n:int, x:float)->float:
    if n==1:
        return x
    else:
        return np.multiply(
            np.power(-1,n-1),
            np.divide(
                np.power(x,2*n-1),
                np.math.factorial(2*n-1)
                )
            ) + sinApprox(n-1, x)

for i in range(1,10):
    print(sinApprox(i, np.deg2rad(60)))

print(np.sin(np.deg2rad(60)))

print("0.864556644")

print('para n=9 queda identico a la funcion de numpy')