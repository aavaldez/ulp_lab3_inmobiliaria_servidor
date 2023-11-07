CREATE DATABASE inmo_aavaldez;

USE inmo_aavaldez;
CREATE TABLE `propietarios` (
  	`id` INT NOT NULL AUTO_INCREMENT,
	`nombre` VARCHAR(255) NOT NULL,
	`apellido` VARCHAR(255) NOT  NULL,
	`dni` BIGINT NOT NULL,
	`telefono` VARCHAR(160) DEFAULT NULL,
	`email` VARCHAR(160) DEFAULT NULL,
	`password` VARCHAR(160) DEFAULT NULL,
	`avatar` VARCHAR(160) DEFAULT NULL,
	`estado` INT NOT NULL DEFAULT 1,
  	PRIMARY KEY(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `propietarios` (`id`, `nombre`, `apellido`, `dni`, `telefono`, `email`, `password`, `avatar`, `estado`) VALUES (NULL, 'Alberto', 'Valdez', '27822898', '2664659200', 'aavaldez@gmail.com', 'pOjBQ7hZuhRlsXn9P3cmGoibbWuvjSbJjkFgfeVDzQg==', NULL, '1');
INSERT INTO `propietarios` (`id`, `nombre`, `apellido`, `dni`, `telefono`, `email`, `password`, `avatar`, `estado`) VALUES (NULL, 'Mariano', 'Luzza', '27822898', '2664659200', 'mluzza@gmail.com', 'pOjBQ7hZuhRlsXn9P3cmGoibbWuvjSbJjkFgfeVDzQg==', NULL, '1');

CREATE TABLE `inquilinos` (
  	`id` INT NOT NULL AUTO_INCREMENT,
	`dni` BIGINT NOT NULL,
	`nombre` VARCHAR(255) NOT NULL,
	`apellido` VARCHAR(255) NOT NULL,
	`lugarDeTrabajo` VARCHAR(255) NOT NULL,
	`email` VARCHAR(160) DEFAULT NULL,
	`telefono` VARCHAR(160) DEFAULT NULL,
	`nombreGarante` VARCHAR(255) NOT NULL,
	`telefonoGarante` VARCHAR(255) NOT NULL,
	`estado` INT NOT NULL DEFAULT 1,
  	PRIMARY KEY(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `inmuebles` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`direccion` VARCHAR(255) DEFAULT NULL,
	`uso` VARCHAR(255) NOT NULL,
	`tipo` VARCHAR(255) NOT NULL,
	`ambientes` INT NOT NULL DEFAULT 1,
	`precio` DECIMAL(10,2) NOT NULL DEFAULT 0,
	`propietarioId` INT NOT NULL,
	`estado` INT NOT NULL DEFAULT 0,
	`imagen` VARCHAR(255) NOT NULL,
  	PRIMARY KEY(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE `inmuebles` ADD CONSTRAINT `inmuebles_propietarioId` FOREIGN KEY (`propietarioId`) REFERENCES `propietarios`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

CREATE TABLE `contratos` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`inquilinoId` INT NOT NULL,
	`inmuebleId` INT NOT NULL,
	`desde` DATETIME DEFAULT NULL,
	`hasta` DATETIME DEFAULT NULL,
	`valor` DECIMAL(10,2) NOT NULL DEFAULT 0,
	`estado` INT NOT NULL DEFAULT 1,
  	PRIMARY KEY(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE `contratos` ADD CONSTRAINT `contratos_inquilinos_inquilinoId` FOREIGN KEY (`inquilinoId`) REFERENCES `inquilinos`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `contratos` ADD CONSTRAINT `contratos_inmuebles_inmuebleId` FOREIGN KEY (`inmuebleId`) REFERENCES `inmuebles`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

CREATE TABLE `pagos` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`numero` INT NOT NULL,
	`contratoId` INT NOT NULL,
	`fecha` DATETIME DEFAULT NULL,
	`importe` DECIMAL(10,2) NOT NULL DEFAULT 0,
  	PRIMARY KEY(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE `pagos` ADD CONSTRAINT `pagos_contratos_contratoId` FOREIGN KEY (`contratoId`) REFERENCES `contratos`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
