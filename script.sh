echo "Ingresa el nombre exacto del archivo (ej: sample.java):"
read archivo

if [ ! -f "$archivo" ]; then
  echo "Error: Sube el archivo primero usando el menú de PWD."
  exit 1
fi

extension="${archivo##*.}"
case "$extension" in
  "py") imagen="python:3.9" ; comando=(python "$archivo") ;;
  "java")
    imagen="openjdk:17"
    clase=$(basename "$archivo" .java)
    comando=(sh -c "javac '$archivo' && java '$clase'") ;;
  "cpp"|"cc")
    imagen="gcc:latest"
    exe=$(basename "$archivo" ."$extension")
    comando=(sh -c "g++ -O3 '$archivo' -o '$exe' && ./'$exe'") ;;
  "js") imagen="node:latest" ; comando=(node "$archivo") ;;
  "rb") imagen="ruby:latest" ; comando=(ruby "$archivo") ;;
  *) echo "Extensión no soportada." ; exit 1 ;;
esac

inicio=$(date +%s%3N)
salida=$(docker run --rm -v "$(pwd)":/code -w /code "$imagen" "${comando[@]}" 2>&1)
fin=$(date +%s%3N)
tiempo=$((fin - inicio))

echo "Salida del programa:"
echo "$salida"
echo "Tiempo de ejecución del contenedor: ${tiempo} ms"