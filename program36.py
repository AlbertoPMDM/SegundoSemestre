# ALberto Mendez 20220405

'''
media, mediana, moda, varianza, std. dev.
'''

from typing import List
import numpy as np

a = np.loadtxt('test.csv', delimiter=',')

def avg(a:np.ndarray)-> float:
    return np.sum(a)/np.size(a)

def median(a:np.ndarray)-> float:
    return a[int(np.size(a)/2)] if np.size(a)%2!=0 else (a[int(np.size(a)/2)-1]+a[int(np.size(a)/2)])/2

class Mode:

    def diffItems(a:np.ndarray)-> np.ndarray:
        '''
        returns the different values on an array
        '''

        itemList=np.array([])
        p_item = None

        for i in a:

            if p_item != i:
                itemList = np.append(itemList,np.array([i]), axis=0)
            
            p_item = i
        
        return itemList

    def count(self, a:np.ndarray)-> int:
        '''
        returns an array that counts the frequency of the different values on
        an array
        '''

        itemCount = np.array([])

        for i in self.diffItems(a):
            itemCount = np.append(itemCount, 0)
            for j in a:
                itemCount[-1] += 1 if j==i else 0

        return itemCount

    def max(a:np.ndarray) -> np.ndarray:
        '''
        returns a list with the max quantiti, and its location on an array
        '''

        max=np.array([a[0],0],dtype=int)

        for i in range(np.size(a)):
            if a[i] > max[0]:
                max[0] = a[i]
                max[1] = i

        return max

    def mode(self, a:np.ndarray)-> int:

        return self.diffItems(a)[
            Mode.max(Mode.count(Mode, a))[1]
        ]
        

def variance(a:np.ndarray)-> float:
    var = 0
    for i in range(np.size(a)):
        var += (a[i] - avg(a))**2
    var /= np.size(a) - 1
    return var

def stdDeviation(a:np.ndarray)-> float:
    return np.sqrt(variance(a))

print('array: {}'.format(a))
print('average: {}'.format(avg(a)))
print('median: {}'.format(median(a)))
print('mode: {}'.format(Mode.mode(Mode, a)))
print('variance: {}'.format(variance(a)))
print('std. deviation: {}'.format(stdDeviation(a)))
