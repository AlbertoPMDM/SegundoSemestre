# Alberto Mendez 20220315

# escriba un codigo que lea dos numeros, los imprima, y 
# lea el resultado, envie un mensaje de error si el divisor es 
# cero

a = float(input('ingresa un valor para el denominador\n'))
b = float(input('ingresa un valor para el numerador\n'))

if b==0:
    print('no se puede dividir entre cero')
else:
    print(a/b)