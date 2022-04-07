'''
cuando se tienen un conjunto de puntos que queremos aproximar a una linea recta,
se pueden utilizar las siguientes formulas

m = \frac{N \sum xy - \sum x \sum y}{N \sum x^{2} - \left( \sum x\right)^{2}}

b = \frac{\sum y - m \sum x}{N-1}
'''
import numpy as np

x, y = np.loadtxt('test2.csv', delimiter=',', unpack = True)

class npy:

    def cumsum(a:list)-> float:
        a_sum = 0

        for i in a:
            a_sum += i

        return a_sum

    def size(a):
        return np.size(a)

    def multiply(a:list, b:list)->list:
        a_mult = []

        for i in range(npy.size(a)):
            a_mult.append(a[i]*b[i])
        
        return a_mult

def linReg(a:list,b:list)->list:
    m = (
            (
            npy.size(a) * npy.cumsum(npy.multiply(a,b))
        ) - (
            npy.cumsum(a) * npy.cumsum(b)
        )
    )/(
        (
            npy.size(a)*npy.cumsum(npy.multiply(a,a))
        ) - (
            (npy.cumsum(a))**2
        )
    )
    
    n = (
        (
            npy.cumsum(b) - m*npy.cumsum(a  )
        ) / (
            npy.size(a)
        )
    )

    return (m,n)
    
REG = linReg(x,y)
print('{}x+{}'.format(REG[0], REG[1]))