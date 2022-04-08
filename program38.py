'''
Metodo de biseccion

el metodo de biseccion es el mas elemental para determinar las raices 
de una ecuacion. Consiste en partir a partir de un intervalo [x_0, x_1]
tal que sabemos que existe al menos una raiz real en dicho intervalo
'''


class PolinomialBisection:

    def abs(x):
        return x if x>0 else -x

    def error(x0:float, x1:float) -> float:
        return abs(x0-x1)/x1

    def cumsum(a:list)-> float:
        a_sum = 0

        for i in a:
            a_sum += i

        return a_sum

    def avg(a:list)->float:
        return PolinomialBisection.cumsum(a)/len(a)

    def pCond(x0:float, x1:float, a:list) -> bool:
        return True if PolinomialBisection.evaluate(a, x0)*PolinomialBisection.evaluate(a, x1) < 0 else False

    def evaluate(cfs:list, x:float) -> float:

        eval = 0

        for i in range(len(cfs)):
            eval += cfs[i]*(x**abs(i-len(cfs)+1))

        return eval

    def getNextRange(r:list, a:list) -> list:

        if PolinomialBisection.pCond(r[0], PolinomialBisection.avg(r), a):
            return [r[0],PolinomialBisection.avg(r)]
        elif not(PolinomialBisection.pCond(r[0], PolinomialBisection.avg(r),a)):
            return [PolinomialBisection.avg(r), r[1]]

    def approximate(a:list, r:list, delta:float)-> float:
        if PolinomialBisection.error(r[0],r[1]) < delta:
            return PolinomialBisection.avg(r)
        else:
            return PolinomialBisection.approximate(
                a,
                PolinomialBisection.getNextRange(r,a),
                delta
            )
            

if __name__=='__main__':

    a = []

    n = int(input('introduce el grado del polinomio \n'))
    for i in range(n+1):
        a.append(float(input('introduce el coeficiente de x^{} del polinomio\n'.format(-1*(i-n)))))

    r=[]
    r.append(float(input('introduce el limite inferior del rango de aproximacion\n')))
    r.append(float(input('introduce el limite superior del rango de aproximacion\n')))

    delta = float(input('introduce el error maximo permitido para la aproximacion\n'))

    print('la raiz en {} para el polinomio es {}'.format(
        r,
        PolinomialBisection.approximate(a, r, delta)
        )
    )