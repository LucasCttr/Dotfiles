CITY="Concepcion Del Uruguay"
CURL="/usr/bin/curl"
MAX_RETRIES=3
WAIT=2  # segundos entre reintentos

raw=""       # salida cruda de wttr.in
weather=""   # clima
temp=""      # temperatura
icon=""     # ícono default

# Reintentos si la respuesta está vacía
for i in $(seq 1 $MAX_RETRIES); do
    raw=$($CURL -s --max-time 15 "https://wttr.in/Concepcion%20Del%20Uruguay?format=%C%t")
    raw=$(echo "$raw" | tr -d '[:space:]')  # eliminar espacios
    
    # Separar clima y temperatura
    weather=$(echo "$raw" | sed 's/\([^+]*\).*/\1/')   # todo antes del +
    temp=$(echo "$raw" | sed 's/[^+]*+//')             # todo después del +
    
    # Si tenemos ambos, salir del bucle
    if [ -n "$weather" ] && [ -n "$temp" ]; then
        break
    fi
    sleep $WAIT
done

# Fallback si falla la API
if [ -z "$temp" ]; then temp="0°C"; fi
if [ -z "$weather" ]; then weather="Desconocido"; fi

# Asignar ícono según clima
case "$weather" in
    Clear|Sunny) icon="☀" ;;
    Clouds|PartlyCloudy) icon="☁" ;;
    Rain|LightRain|Showers) icon="🌧" ;;
    Snow|LightSnow) icon="🌨" ;;
    Thunderstorm) icon="⛈" ;;
    Fog|Mist|Haze) icon="🌫" ;;
    *) icon="" ;;  # default
esac

# Devolver JSON válido para Waybar
echo "{\"text\": \"${icon} ${temp}\", \"tooltip\": \"Temperatura actual en ${CITY} (${weather})\"}"
