module Library where
import PdePreludat

data Mago = Mago {
    nombre::String,
    horrocruxes:: [Horrocrux]
} deriving (Show,Eq)

data Horrocrux = Horrocrux {
    denominacion::String,
    mago::Mago
} 

instance Show Horrocrux where
    show horrocrux = denominacion horrocrux ++ " " ++ (nombre.mago) horrocrux ++ " "++ (show.length.horrocruxes.mago) horrocrux

instance Eq Horrocrux where
    horrocrux1 == horrocrux2 = denominacion horrocrux1 == denominacion horrocrux2

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

otroMas = Horrocrux {
    denominacion = "Para Test",
    mago = srTenebroso
}

srTenebroso = Mago {
    nombre = "Voldemort",
    horrocruxes = [diario, diadema, harry]
}

destruir :: Horrocrux -> Mago
destruir horrocrux = nuevoMago
    where nuevoMago = (mago horrocrux){horrocruxes = (actualizarReferenciasCruzadas nuevoMago.filter (/=horrocrux).horrocruxes.mago) horrocrux}

finalFeliz:: [Horrocrux] -> Bool
finalFeliz [] = False
finalFeliz (horrocrux:horrocruxes) = 
    sinHorrocruxes mago || finalFeliz (actualizarReferenciasCruzadas mago horrocruxes)
        where mago = destruir horrocrux    

actualizarReferenciasCruzadas::Mago -> [Horrocrux]->[Horrocrux]
actualizarReferenciasCruzadas nuevoMago = map (\horrocrux -> horrocrux{mago = nuevoMago}) 

sinHorrocruxes::Mago -> Bool
sinHorrocruxes = null.horrocruxes

caso1 = [diario, diadema]
caso2 = [diario, diadema, harry]
caso3 = [diario, diadema, harry, otroMas]
casoInfinito = [diario, diadema, harry] ++ repeat harry