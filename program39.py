# Alberto Mendez 20220425

# etodo de newton
class parser:
    ATOMS = []
    ...
class utils:

    

    def abs(x):
        return x if x>0 else -x

    def derivative(f:object, x:float, h:float = 0.01) -> float:
        return (f(x+h)-f(x))/h

    def e(x:float, x_0:float) -> float:
        return abs((x-x_0)/x)

    def newtons_method(f: object, x:float, df:object, delta:float) -> float:
        if utils.e((x - (f(x)/df(f, x))), x) < delta:
            return x
        else:
            return utils.newtons_method(f, (x - (f(x)/df(f, x))), df, delta)

def f(x):
    return x**2 -x - 0.5

print(utils.newtons_method(f, -0.4, utils.derivative, 0.001))

if __name__ == '__main__':

    a = []

    n = int(input('introduce el grado del polinomio \n'))
    for i in range(n+1):
        a.append(float(input('introduce el coeficiente de x^{} del polinomio\n'.format(-1*(i-n)))))

    r=float(input('introduce la primera aproxiamcion\n'))

    delta = float(input('introduce el error maximo permitido para la aproximacion\n'))

    print(utils.newtons_method(lambda x: utils.evaluate(a, x), r, utils.derivative, delta))