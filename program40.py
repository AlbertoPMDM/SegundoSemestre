# ALberto mendez 20222704
# Trapezoid rule

class utils:

    def abs(x):
        return x if x>0 else -x

    def delta(a:float, b:float, n:int) -> float:
        return (b-a)/n

    def partition(a:float, b:float, n:int) -> list:
        tmp_list = []
        dx = utils.delta(a, b, n)
        for i in range(n):
            tmp_list.append(a + i * dx)
        return tmp_list

    def evaluate(cfs:list, x:float) -> float:

        eval = 0

        for i in range(len(cfs)):
            eval += cfs[i]*(x**utils.abs(i-len(cfs)+1))

        return eval

    def trapezoid_integrate(a:float, b:float, n:int, cfs:list) -> float:
        insum = utils.evaluate(cfs, a) + utils.evaluate(cfs, b)
        p = utils.partition(a, b, n)
        for x in range(1,len(p)):
            insum += 2*utils.evaluate(cfs, p[x])

        return (utils.delta(a, b, n)/2)* insum  

if __name__ == '__main__':

    a = []

    g = int(input('introduce el grado del polinomio \n'))
    for i in range(g+1):
        a.append(float(input('introduce el coeficiente de x^{} del polinomio\n'.format(-1*(i-g)))))

    r=[]
    r.append(float(input('introduce el limite inferior de integracion\n')))
    r.append(float(input('introduce el limite superior de integracion\n')))

    n = int(input('introduce el numero de particiones a utilizar\n'))

    print(f'''la integral cerca de x = {r[0]} a x = {r[1]} es aproximadamente {
        utils.trapezoid_integrate(r[0], r[1], n, a)
        }''')