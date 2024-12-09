ALTER SESSION SET "_ORACLE_SCRIPT" = true;

CREATE USER usr_gestao_hotel IDENTIFIED BY gestao_hotel
    DEFAULT TABLESPACE users
    TEMPORARY TABLESPACE temp;
    
GRANT connect, resource TO usr_gestao_hotel;

ALTER USER usr_gestao_hotel QUOTA UNLIMITED ON USERS;

CREATE SEQUENCE seq_itens_pedido START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_pedidos START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_clientes START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_reservas START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_quartos START WITH 1 INCREMENT BY 1;

CREATE TABLE clientes (
    cliente_id NUMBER DEFAULT seq_clientes.NEXTVAL PRIMARY KEY,
    nome VARCHAR2(100) NOT NULL,
    email VARCHAR2(100),
    telefone VARCHAR2(15)
);

CREATE TABLE quartos (
    quarto_id NUMBER DEFAULT seq_quartos.NEXTVAL PRIMARY KEY,
    numero VARCHAR2(10) NOT NULL,
    tipo VARCHAR2(50),
    preco_diaria NUMBER(10, 2)
);

CREATE TABLE reservas (
    reserva_id NUMBER DEFAULT seq_reservas.NEXTVAL PRIMARY KEY,
    cliente_id NUMBER NOT NULL,
    quarto_id NUMBER,
    data_checkin DATE,
    data_checkout DATE,
    status VARCHAR2(50), 
    CONSTRAINT fk_cliente_reservas FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id) ON DELETE CASCADE,
    CONSTRAINT fk_quarto FOREIGN KEY (quarto_id) REFERENCES quartos(quarto_id) ON DELETE CASCADE
);

CREATE TABLE pedidos (
    pedido_id NUMBER DEFAULT seq_pedidos.NEXTVAL PRIMARY KEY,
    cliente_id NUMBER NOT NULL,
    data_pedido TIMESTAMP, 
    total NUMBER(10, 2), 
    status VARCHAR2(50), 
    CONSTRAINT fk_cliente_pedidos FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id) ON DELETE CASCADE
);

CREATE TABLE itens_pedido (
    item_pedido_id NUMBER DEFAULT seq_itens_pedido.NEXTVAL PRIMARY KEY,
    pedido_id NUMBER NOT NULL,
    nome_item VARCHAR2(100) NOT NULL,
    quantidade NUMBER NOT NULL, 
    preco_unitario NUMBER(10, 2), 
    CONSTRAINT fk_pedido FOREIGN KEY (pedido_id) REFERENCES pedidos(pedido_id) ON DELETE CASCADE
);

COMMIT;