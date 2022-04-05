# ALberto Mendez 20223104

import numpy as np

def pol(v:np.ndarray)-> np.ndarray:

    if (v[0]>0 and v[1]>0):
        theta = np.arctan(v[1]/v[0])
    elif (v[0]<0 and v[1]>0):
        theta = np.arctan(v[1]/v[0]) + np.pi
    elif (v[0]<0 and v[1]<0):
        theta = np.arctan(v[1]/v[0]) + np.pi
    elif (v[0]>0 and v[1]<0):
        theta = np.arctan(v[1]/v[0]) + 2*np.pi

    return np.array([
        np.sqrt(v[0]**2+v[1]**2),
        theta
    ])

def rec(v:np.ndarray) -> np.ndarray:
    return np.array([
        v[0] * np.cos(v[1]),
        v[0] * np.sin(v[1])
    ])

print(pol(np.array([1,1])))
print(pol(np.array([-1,1])))
print(pol(np.array([-1,-1])))
print(pol(np.array([1,-1])))

print(rec(pol(np.array([1,1]))))
print(rec(pol(np.array([-1,1]))))
print(rec(pol(np.array([-1,-1]))))
print(rec(pol(np.array([1,-1]))))
