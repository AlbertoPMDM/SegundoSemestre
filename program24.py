# Alberto Mendez 20220310

# Hacer un programa que encuentre el discriminante de una ecuacion cuadratica

def discriminante(a,b,c):
    return (b**2)-4*a*c

A = float(input('ingrese el coeficiente cuadratico del polinomio\n'))

B = float(input('ingrese el coeficiente lineal del polinomio\n'))

C = float(input('ingrese el coeficiente independiente del polinomio\n'))

print('el discriminante de ({})x^2+({})x+({}) es de {}'.format(
    A,B,C,discriminante(A,B,C)
    ))

if discriminante(A,B,C)<0:
    print('las raices son imaginarias')
elif discriminante(A,B,C)==0:
    print('solo tiene una raiz')
else:
    print('las raices son reales')