# Alberto Mendez 20220313

#funciones (11 ma. en teams)

# chtm fernanda, me tienes hasta la verga te voy a matar te voy a machetear
# te voya te voya 
def f(s:float) -> float:

    if s>0:
        return (s**3) + (3*(s**2)) - 2
    elif s==0:
        return 2
    elif s<0:
        return (-s**3) + (3*(s**2)) - 2
    else:
        print('valor fuera del dominio de f')

print('f(s) = ' +
    str(f(
        float(input('ingrese un valor para s de f(s)'))
    ))
)