# Alberto Mendez 20220315

# Haga un programa que imprima
# 'Hola'
# 10
# 8
# 6
# 4
# 2
# 2
# 4
# 6
# 8
# 10
# 'adios'
# con un solo ciclo

print('hola')

flag = False

n = 10

def abs(n):
    return -n if n<0 else n

while (n>=-10):

    print(abs(n))

    n-= 2 if abs(n) > 2 else 4
    

print('adios')