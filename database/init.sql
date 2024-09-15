CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- Creamos la tabla
CREATE TABLE personas (
    id_persona SERIAL PRIMARY KEY,
    nombre TEXT NOT NULL,
    apellido TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    cedula TEXT NOT NULL UNIQUE,
    rut BIGINT NOT NULL UNIQUE,
    contraseña TEXT NOT NULL
);

-- Levantamos los datos de prueba.
INSERT INTO public.personas (nombre, apellido,email,cedula,rut, contraseña) 
    VALUES('Ana', 'Lopez', 'anilopez@gmail.com','1.234.432-2','123456654321',crypt('Contraseña1-', gen_salt('bf')));
INSERT INTO public.personas (nombre, apellido,email,cedula,rut, contraseña) 
    VALUES('Juan', 'Perez', 'juancitoperez@gmail.com','1.222.432-2','113226654321',crypt('Contraseña1-', gen_salt('bf')));
INSERT INTO public.personas (nombre, apellido,email,cedula,rut, contraseña) 
    VALUES('Alvaro', 'García', 'alva@gmail.com','1.111.432-2','123411114321',crypt('Contraseña1-', gen_salt('bf')));
INSERT INTO public.personas (nombre, apellido,email,cedula,rut, contraseña) 
    VALUES('Mario', 'Silva', 'maritosilva@gmail.com','1.234.111-2','121156654321',crypt('Contraseña1-', gen_salt('bf')));
INSERT INTO public.personas (nombre, apellido,email,cedula,rut, contraseña) 
    VALUES('Jorge', 'Melnik', 'jmelnik19@gmail.com','1.222.111-2','121156674321',crypt('Contraseña1-', gen_salt('bf')));
