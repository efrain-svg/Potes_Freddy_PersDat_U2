AGENTS for persistencia2
=========================

Breve guía para agentes de IA que trabajan en este repositorio (objetivo: hacerles productivos de inmediato).

1) Panorama general
- Proyecto extremadamente pequeño: no hay build tool (Maven/Gradle) ni tests. Código fuente principal en `src/Main.java`.
- El archivo `src/Main.java` contiene un ejemplo/plantilla de IntelliJ (comentarios de TIP y uso de `IO.println`). No es un programa Java estándar listo para javac/java.
- Metadatos de IDE: existe `persistencia2.iml` y la carpeta `.idea/` (configuración de IntelliJ). El proyecto parece orientado a aprendizaje/demo dentro de IDEA.

2) Qué buscar primero (archivos clave)
- `src/Main.java` — punto de entrada del ejemplo; ver comentarios de atajos y breakpoint.
- `persistencia2.iml` y `.idea/workspace.xml` — contienen la configuración del entorno; útiles para reproducir la experiencia de ejecución en IntelliJ.

3) Cómo ejecutar y depurar (flujos prácticos)
- En IntelliJ: abrir el proyecto y usar el botón Run (o Run action). Los comentarios dentro de `src/Main.java` son generados por la plantilla y sugieren breakpoints y acciones rápidas.
- En PowerShell (si transformas el código a una clase Java válida):

```powershell
# compilar
javac -d out src\Main.java
# ejecutar
java -cp out Main
```

- Nota: el archivo actual no compilará con javac tal cual. Para convertirlo a programa estándar, envuelve el contenido en una clase con método `public static void main(String[] args)` y reemplaza llamadas a `IO.println` por `System.out.println`. Ejemplo mínimo:

```java
public class Main {
    public static void main(String[] args) {
        System.out.println("Hello and welcome!");
        for (int i = 1; i <= 5; i++) {
            System.out.println("i = " + i);
        }
    }
}
```

4) Convenciones y patrones específicos del proyecto
- Plantilla de IntelliJ: los comentarios TIP y referencias a atajos (`<shortcut actionId="Run"/>`) indican que el archivo fue creado por la experiencia guiada de IDEA. No asumas que es un artefacto de producción.
- No hay estructura de paquetes; el código usa top-level snippet. Antes de añadir tests o librerías, normaliza a una estructura de paquetes `src/main/java` si introduces herramientas de build.

5) Integraciones y dependencias
- Actualmente: ninguna dependencia externa detectable (no `pom.xml` / `build.gradle` / `libs/`).
- Integración más relevante: la experiencia de ejecución y depuración está centrada en IntelliJ IDEA (ver `.iml` y `.idea/`).

6) Sugerencias prácticas para un agente que edita el repo
- Si vas a hacer cambios ejecutables, convierte `src/Main.java` a una clase pública con `main` y actualiza `IO.println` → `System.out.println`.
- Mantén los commits pequeños y documenta por qué conviertes la plantilla (p. ej. "Convertir snippet de IntelliJ a clase Main compilable").
- Si introduces un build tool, añade instrucciones reproducibles en README.md y un `./gradle` wrapper o `pom.xml` para facilitar CI.

7) Qué no documentar aquí
- No incluyo reglas de estilo genéricas ni checklists de PR; documento solo lo que es observable en el repositorio.

8) Acciones rápidas recomendadas (prioritarias)
- (1) Abrir el proyecto en IntelliJ para inspeccionar run configurations auto-generadas.
- (2) Si el objetivo es ejecutar desde terminal, convertir `src/Main.java` a clase compilable (ejemplo arriba).
- (3) Añadir un README.md con instrucciones de ejecución si el proyecto crece.

Referencias rápidas
- `src/Main.java` — plantilla de ejemplo con comentarios de IntelliJ
- `.idea/workspace.xml` — referencia al archivo abierto en el IDE

Fin del archivo.

