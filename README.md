# Destruyendo Horrocruxes 

**Un desafío extra del universo Harry Potter, que dejamos fuera de la consigna del examen. La mejor solución tiene premio sorpresa (¿unas grajeas de Bertie Bott?)**
 
Se trata de averiguar si la saga tiene final feliz, lo que se produce si los protagonistas logran destruir todos los horrocruxes del mago tenebroso, de quien los muggles que conocemos la existencia del mundl magoo mágico no nos atrevemos a nombrar.
Un horrocrux es un elemento cualquiera en el que mediante magia oscura un mago deposita parte de su alma pretendiendo lograr su inmortalidad. Mientras exista al menos un horrocrux suyo, un mago conserva su vida.
Contamos con las siguiente definición mágica:

```
data Mago = Mago {
    nombre::String,
    horrocruxes:: [Horrocrux]
}

data Horrocrux = Horrocrux {
    denominacion::String,
    mago::Mago
}

diadema = Horrocrux {
    denominacion = "Ravenclow",
    mago = srTenebroso
}

diario = Horrocrux {
    denominacion = "Diario de Tom Riddle",
    mago = srTenebroso
}

harry = Horrocrux {
    denominacion = "Harry Postre",
    mago = srTenebroso
}

srTenebroso = Mago {
    nombre = "Voldemort",
    horrocruxes = [diadema, diario, harry]
}
```

Al momento de destruir un horrocrux, sin estar presente el mago al que corresponde dicho horrocrux de todas maneras sufre las consecuencias. Para ello, se pide definir la funcion `destruir:: Horrocrux -> Mago` donde el mago que se retorna es el que corespondía al horrocrux, pero ya sin dicho horrocrux en su poder. Se asume que la denominación de cada horrocrux es única.

_Por ejemplo, al destruir el diario de Tom Riddle, el mago tenebroso permance con vida, con los horrocruxes de la diadema y el mismo harry._

A lo largo de las películas, los protagonistas van buscando y destruyendo horrocruxes. En esta libre interpretación, contamos con una serie de horrocruxes y el objetivo es ver si al ir destruyendolos se logra vencer por completo al mago tenebroso o no. Hacerlo definiebdo la función `finalFeliz:: [Horrocrux] -> Bool`, que utilice la función `destruir`. Si aún habiendo destruido todos los horrocruxes recibidos el mago tenebroso permaneciera con vida, el final no es feliz. En caso en que en algún momento, el horrocrux que se destruye sea el último y en consecuencia el mago pierda su vida, se considera un final feliz (incluso si quedaran otros horrocruxes en la lista).

Ejemplos:
```
finalFeliz  [diadema, diario]
False 

finalFeliz  [diario, diadema, harry]
True

finalFeliz  [diario, diadema, harry, otroMas]
True
```
