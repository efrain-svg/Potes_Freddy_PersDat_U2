# PracticaPersistencia_ComponentesElectronicos

Proyecto de persistencia con JPA (Jakarta Persistence), Hibernate y MySQL para inventario de componentes electronicos.

## Ejecucion del script SQL

1. Abrir una consola MySQL y ejecutar el script:

```powershell
mysql -u root -p < src/main/resources/schema_and_data.sql
```

2. Verificar que exista la base de datos `bd_componentes_electronicos`.

## Modelo de datos (resumen)

- `tb_categoria`: categorias de componentes.
- `tb_producto`: productos con referencia a categoria y ubicacion.
- `tb_ubicacion`: ubicacion fisica del producto.
- `tb_proyecto`: proyectos donde se usan componentes.
- `tb_proyecto_producto`: relacion muchos-a-muchos entre proyectos y productos.

## Nota sobre credenciales

Actualiza la propiedad `jakarta.persistence.jdbc.password` en `src/main/resources/META-INF/persistence.xml` con la clave real de tu usuario MySQL.

