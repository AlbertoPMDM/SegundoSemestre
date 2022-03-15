# Alberto Mendez 20220315

# Escriba un codigo con un ciclo 
# que imprima la suma de todos los valores
# desde 1 hasta un numero dado por el usuario

n = int(input('ingresa un numero n para sumar desde uno hasta n\n'))

sum = 0

while n>=1:
    sum += n
    n-=1

print(sum)