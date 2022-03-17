M = 200
'''
mass in kg
'''

L_C = 3
'''
length of cable in m
'''

L_B = 3
'''
length of bar in m
'''


def T(W:float, l_c:float, l_b:float, d:float) -> float:
    return (W*l_c*l_b)/(d*(l_b**2-d**2)**0.5)

D = 5

A = []

cT = T((M*-9.81),L_C, L_B, D)

while D > 0:

    D -= 0.1

    A.append(T((M*-9.81),L_C, L_B, D))

print(min(A))

    

