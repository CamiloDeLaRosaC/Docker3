# 🐳 Ejecución de Script en Play with Docker (PWD)

**Autores**: Daniel Geraldino Rivadeneira, Camilo De La Rosa Castañeda

Este repositorio contiene un script para ejecutar programas en múltiples lenguajes (Python, Java, C++, etc.) dentro de contenedores Docker. A continuación los pasos para usarlo en [Play with Docker](https://labs.play-with-docker.com/):

## 🚀 Pasos para Ejecutar en PWD

### 1. Clonar el repositorio (o subir archivos manualmente)

```bash
git clone https://github.com/CamiloDeLaRosaC/Docker3.git
cd Docker3
```

**Si prefieres subir manualmente:**

1. Haz clic en el ícono de upload (↗️) en PWD
2. Selecciona estos archivos:
   - `script.sh`
   - `sample.py`, `sample.java`, `sample.cpp`, `sample.js`, `sample.rb`

### 2. Dar permisos al script

```bash
chmod +x script.sh
```

### 3. Ejecutar el script principal

```bash
./script.sh
```

### 4. Ingresar el nombre del archivo

Cuando el script lo solicite, escribe el nombre del ejemplo que quieras ejecutar:

```
Ingresa la ruta del archivo ejemplo (ej: sample.py):
sample.cpp  # <-- Ejemplo para C++
```

### 5. Esperar resultados

Verás la salida del programa y el tiempo de ejecución:

```
C(0) = 1
C(1) = 1
...
Tiempo de ejecución del contenedor: 12 ms
```

## 🔍 Explicación Clave

- **Montaje de volumen**:  
  `-v "$(pwd)":/code` permite acceder a tus archivos locales dentro del contenedor.

- **Imágenes oficiales**:  
  Se usan imágenes estándar de Docker Hub (Python, Node, OpenJDK, etc).

- **Primera ejecución**:  
  La primera vez será más lenta mientras se descargan las imágenes.

## 📌 Notas Importantes

1. **Sesiones temporales**:  
   Las instancias en PWD se eliminan después de 4 horas. Descarga los logs manualmente si los necesitas.

2. **Nombres exactos**:  
   Los archivos deben llamarse exactamente igual que en el repositorio (ej: `sample.java` no `Sample.Java`).

3. **Recursos limitados**:  
   Para cálculos pesados (ej: N=30 en números de Catalan), reduce el valor en los archivos `sample.*`.

4. **Seguridad**:  
   El script no requiere privilegios especiales de Docker, pero solo ejecuta archivos de confianza.

> ⚡ **Tip**: Usa `Ctrl + C` para detener cualquier ejecución en curso.
