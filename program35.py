# Alberto Mendez 20223104

'''
Como parte de un experimento meteorologico se hicieron medidas de 36 locaciones 
diferentes especificadas por latitud y longitud como se ven en la tabla

escriba un programa que calcule el promedio anual de temperatura a lo largo de 
cada longitud, latitud, y el promedio anual de temperatura para las 36 localizaciones
'''
import numpy as np

temps = np.array([
    [68.2, 72.1, 72.5, 74.1, 74.4, 74.2],
    [69.4, 71.1, 71.9, 73.1, 73.6, 73.7],
    [68.9, 70.5, 70.9, 71.5, 72.8, 73.0],
    [68.6, 69.9, 70.4, 70.8, 71.5, 72.2],
    [68.1, 69.3, 69.8, 70.2, 70.9, 71.2],
    [68.8, 68.8, 69.6, 70.5, 71.5, 70.9]
])

def longAvg(a:np.ndarray) -> np.ndarray:
    long_avg = np.zeros(np.shape(a)[1])
    for i in range(np.shape(a)[0]):
        for j in range(np.shape(a)[1]):
            long_avg[j] += a[i][j]/np.shape(a)[0]
    
    return long_avg

def latAvg(a:np.ndarray) -> np.ndarray:
    lat_avg = np.zeros(np.shape(a)[0])
    for i in range(np.shape(a)[1]):
        for j in range(np.shape(a)[0]):
            lat_avg[j] += a[j][i]/np.shape(a)[1]
    
    return lat_avg

def totalAvg(a:np.ndarray) -> np.ndarray:
    total_avg = 0.0
    for i in range(np.shape(a)[0]):
        for j in range(np.shape(a)[1]):
            total_avg += a[i][j]/np.size(a)

    return total_avg

LONGITUDES = np.arange(90.0, 93.0, 0.5)
P_LOGITUDES = longAvg(temps)

LATITUDES = np.arange(30.0, 33.0, 0.5)
P_LATITUDES = latAvg(temps)

P_TOTAL = totalAvg(temps)

for i in range(len(LONGITUDES)):
    print('para {}°long, la temperatura promedio es de {}°f'.format(
        LONGITUDES[i], P_LOGITUDES[i]
    ))

for i in range(len(LATITUDES)):
    print('para {}°lat, la temperatura promedio es de {}°f'.format(
        LATITUDES[i], P_LATITUDES[i]
    ))


print('la temperatura promedio de las locaclizaciones es de {}°f'.format(
    P_TOTAL
))