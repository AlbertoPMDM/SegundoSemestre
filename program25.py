# Alberto Mendez 20220313

#funciones (11 ma. en teams)

def R(x:float,y:float)-> float:

    if (x>0) and (y>0):
        return ((4/x)*y) + ((x**5)*(y**2))
    elif (x<0) and (y>0):
        return ((4/x)*-y) + ((x**5)*(y**2))
    elif (x>0) and (y<0):
        return ((4/-x)*y) + ((-x**5)*(y**2))
    elif (x<0) and (y<0):
        return ((4/x)*y) + ((x**5)*(-y**2))
    else:
        print('valor fuera del dominio de R')

print('R(x,y) = ' + str(
    R(
    float(input('ingrese un valor para x de R(x,y)')),
    float(input('ingrese un valor para y de R(x,y)'))
)))