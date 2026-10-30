#!/bin/bash
echo "============================================================"
echo "    PRUEBAS FUNCIONALES AUTOMATIZADAS DE INFRAESTRUCTURA    "
echo "============================================================"

echo -n "[TEST 1] Verificando estado del contenedor 'servidor-lab'... "
STATUS=$(docker inspect -f '{{.State.Running}}' servidor-lab 2>/dev/null)

if [ "$STATUS" == "true" ]; then
    echo "PASÓ (En ejecución)"
else
    echo "FALLÓ (Contenedor inactivo o no encontrado)"
    exit 1
fi

echo -n "[TEST 2] Verificando respuesta HTTP en http://localhost:8085... "
HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:8085)

if [ "$HTTP_STATUS" == "200" ]; then
    echo "PASÓ (Código 200 OK)"
else
    echo "FALLÓ (Código recibido: $HTTP_STATUS)"
    exit 1
fi

echo "============================================================"
echo "  RESULTADO: TODAS LAS PRUEBAS FUNCIONALES PASARON CON ÉXITO"
echo "============================================================"
