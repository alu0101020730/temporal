USE viveros;

INSERT INTO VIVERO
VALUES(10,NULL,NULL);

INSERT INTO PRODUCTO
VALUES(311,'34',100);

INSERT INTO ZONA
VALUES(1,24,10,311);

INSERT INTO CLIENTE
VALUES(123456,'CRISTIAN','SI','C@GMAIL.COM');

INSERT INTO EMPLEADO
VALUES(999, 'DAADSDAD','AAAA','PEPE',NULL,NULL,1);

INSERT INTO PEDIDO
VALUES(50000,NULL,123456,999);

INSERT INTO PRODUCTO_PEDIDOS
VALUES(311,50000,10);
