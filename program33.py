# Alberto Mendez 20223003111111

n_bin = input('ingrese un numero de 10bits en binario\n')

def cbin(n:str)->int:
    n_int=0
    
    for i in range(len(n)):
        n_int += (1 if n[len(n)-i-1] == '1' else 0)*(2**i)

    return n_int

print(cbin(n_bin) if len(n_bin)==10 else 'el numero no es de 10bits')