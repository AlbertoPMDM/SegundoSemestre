# Alberto Mendez 20220425

# Metodo de newton
class utils:

    def evaluate(cfs:list, x:float) -> float:

        eval = 0

        for i in range(len(cfs)):
            eval += cfs[i]*(x**abs(i-len(cfs)+1))

        return eval

    def abs(x):
        return x if x>0 else -x

    def derivative(f:object, x:float, h:float = 0.01) -> float:
        return (f(x+h)-f(x))/h

    def e(x:float, x_0:float) -> float:
        return abs((x-x_0)/x)

    def newtons_method(f: object, x:float, df:object, delta:float) -> float:
        if utils.e((x - (f(x)/df(f, x))), x) < delta:
            return (x - (f(x)/df(f, x)))
        else:
            return utils.newtons_method(f, (x - (f(x)/df(f, x))), df, delta)

if __name__ == '__main__':

    a = []

    n = int(input('introduce el grado del polinomio \n'))
    for i in range(n+1):
        a.append(float(input('introduce el coeficiente de x^{} del polinomio\n'.format(-1*(i-n)))))

    x_0=float(input('introduce la primera aproxiamcion\n'))

    delta = float(input('introduce el error maximo permitido para la aproximacion\n'))

    print(f'''la raiz pilin cerca de {x_0} es aproximadamente {
        utils.newtons_method(lambda x: utils.evaluate(a, x), x_0, utils.derivative, delta)
        }''')