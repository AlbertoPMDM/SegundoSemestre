1

'''
Si el usuario da n1, n2, y theta1, calcular en angulo de refracción que resulta
de la ley de snell

ley de snell
n1 sin(theta1) = n2 sin(theta2)
'''
import numpy as np
import warnings

def theta2(n1:float, n2:float, theta1:float) -> float:
    '''
    devuelve a theta2 de la ley de snell, dados los valores anteriores, y el 
    angulo en radianes

    si no existe la respuesta, lo indica
    '''
    return np.arcsin((n1*np.sin(theta1))/n2)

with warnings.catch_warnings():
    warnings.filterwarnings('error')
    try:
        theta2(
            float(input('introduce n1 \n')),
            float(input('introduce n2 \n')),
            np.deg2rad(float(input('introduce theta2 en grados \n')))
        )
    except RuntimeWarning as e:
        print('valores invalidos para la funcion')
        pass