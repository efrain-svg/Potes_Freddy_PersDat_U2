package com.ups.electronica.main;

import com.ups.electronica.entities.Categoria;
import com.ups.electronica.entities.Producto;
import com.ups.electronica.entities.Proyecto;
import com.ups.electronica.entities.Ubicacion;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import java.math.BigDecimal;
import java.time.LocalDate;

public class AplicacionMain {
    public static void main(String[] args) {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("ups_electronicaPU");
        EntityManager entityManager = entityManagerFactory.createEntityManager();

        try {
            entityManager.getTransaction().begin();

            Categoria categoria = new Categoria();
            categoria.setNombre("Microcontroladores");
            entityManager.persist(categoria);

            Producto producto = new Producto();
            producto.setNombre("ESP32");
            producto.setTipoComponente("MCU");
            producto.setPrecio(new BigDecimal("12.50"));
            producto.setStock(50);
            producto.setCategoria(categoria);

            Ubicacion ubicacion = new Ubicacion();
            ubicacion.setBodega("Laboratorio 1");
            ubicacion.setEstanteria("A");
            ubicacion.setFila("2");
            ubicacion.setColumna("3");
            producto.setUbicacion(ubicacion);

            entityManager.persist(producto);

            Producto productoExtra = new Producto();
            productoExtra.setNombre("Arduino Nano");
            productoExtra.setTipoComponente("MCU");
            productoExtra.setPrecio(new BigDecimal("9.95"));
            productoExtra.setStock(30);
            productoExtra.setCategoria(categoria);

            Ubicacion ubicacionExtra = new Ubicacion();
            ubicacionExtra.setBodega("Laboratorio 2");
            ubicacionExtra.setEstanteria("B");
            ubicacionExtra.setFila("1");
            ubicacionExtra.setColumna("1");
            productoExtra.setUbicacion(ubicacionExtra);

            entityManager.persist(productoExtra);

            Proyecto proyecto = new Proyecto();
            proyecto.setNombreProyecto("Robot Seguidor");
            proyecto.setDescripcion("Proyecto de robot autonomo con sensores de linea.");
            proyecto.setFechaInicio(LocalDate.now());
            proyecto.addProducto(producto);
            proyecto.addProducto(productoExtra);
            entityManager.persist(proyecto);

            entityManager.getTransaction().commit();

            Proyecto proyectoPersistido = entityManager
                .createQuery(
                    "SELECT p FROM Proyecto p JOIN FETCH p.productos WHERE p.id = :id",
                    Proyecto.class
                )
                .setParameter("id", proyecto.getId())
                .getSingleResult();

            System.out.println("Proyecto: " + proyectoPersistido.getNombreProyecto());
            for (Producto item : proyectoPersistido.getProductos()) {
                Ubicacion ubic = item.getUbicacion();
                String ubicacionTexto = ubic == null
                    ? "SIN UBICACION"
                    : String.format("%s estanteria %s fila %s columna %s",
                        ubic.getBodega(),
                        ubic.getEstanteria(),
                        ubic.getFila(),
                        ubic.getColumna());

                System.out.println(" - " + item.getNombre() + " | " + item.getTipoComponente() + " | " + ubicacionTexto);
            }
        } catch (RuntimeException ex) {
            if (entityManager.getTransaction().isActive()) {
                entityManager.getTransaction().rollback();
            }
            throw ex;
        } finally {
            entityManager.close();
            entityManagerFactory.close();
        }
    }
}

