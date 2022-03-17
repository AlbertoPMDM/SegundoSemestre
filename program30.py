# Alberto Mendez 20220316

'''
La corriente que fluye a traves de un semiconductor esta dada por la ecuacion

i_D = I_0*(((q*v_D)/(k*T))-1)

en donde v_D es el voltaje, I_0 es la corriente pico, q es la carga de un electron,
k es la cte de boltzman, y t es la temperatura absoluta

I_0 = 2mA

escriba un codigo que calcule la corriente de flujo (i_D) si el voltaje cambia de
-1V a 0.6V en saltos de dV = 0.1V

si las temperaturas cambian 75f, 100f, y 125f
'''

################ CONSTANTES #####################

K = 1.38*(10**(-23)) 
'''
cte de boltzmann en joules per kelvin
'''

Q = 1.6*(10**(-19)) 
'''
carga electrica de un electron en coulombs (ampere-second)
'''

I_0 = 2 #miliamperes
'''
corriente pico, dada en mA
'''

TEMPS_F = [75, 100, 125]

############### FUNCIONES #######################

def fahrenheitToKelvin(t:float)->float:
    return (t-32)*(5/9)+273.15

def i_D(I_0:float , q:float, v_D:float, k:float, T:float) -> float:
    '''
    Funcion que obtiene la corriente que fluye a traves de un semiconductor.

    Coulomb se cancelan con volts, y la constante se cancela con grados kelvin
    por lo que las unidades en las que se de I_0 seran las de la respuesta

    Parameters:

        I_0 (float): la corriente pico, dada en mA

        q (float): la carga electrica de un elctron, dada en coulombs.

        v_D (float): es el voltaje, en V

        k (float): la constante de boltzmann, dada en J/k

        T (float): la temperatura absoluta

    Returns:

        i_D (float): corriente que fluye a traves del semiconductor, en mA
    '''
    return I_0*(((q*v_D)/(k*T))-1)

#################### CICLO E IMPRESION ##########################

v_D = -1

while v_D <= 0.6:
    print('i_D(v_D = {}V, T = {}k) = {}mA'.format(
        v_D, TEMPS_F[0], i_D(I_0, Q, v_D, K, TEMPS_F[0])
        )
    )
    v_D += 0.1

v_D = -1

while v_D <= 0.6:
    print('i_D(v_D = {}V, T = {}k) = {}mA'.format(
        v_D, TEMPS_F[1], i_D(I_0, Q, v_D, K, TEMPS_F[1])
        )
    )
    v_D += 0.1

v_D = -1

while v_D <= 0.6:
    print('i_D(v_D = {}V, T = {}k) = {}mA'.format(
        v_D, TEMPS_F[2], i_D(I_0, Q, v_D, K, TEMPS_F[2])
        )
    )
    v_D += 0.1