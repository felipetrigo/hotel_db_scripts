-- Inserir clientes
INSERT INTO clientes (nome, email, telefone) VALUES ('João Silva', 'joao.silva@gmail.com', '123456789');
INSERT INTO clientes (nome, email, telefone) VALUES ('Maria Oliveira', 'maria.oliveira@hotmail.com', '987654321');
INSERT INTO clientes (nome, email, telefone) VALUES ('Carlos Souza', 'carlos.souza@yahoo.com', '456123789');

-- Inserir quartos
INSERT INTO quartos (numero, tipo, preco_diaria) VALUES ('101', 'Standard', 200.00);
INSERT INTO quartos (numero, tipo, preco_diaria) VALUES ('102', 'Deluxe', 350.00);
INSERT INTO quartos (numero, tipo, preco_diaria) VALUES ('103', 'Suite', 500.00);

-- Inserir reservas
INSERT INTO reservas (cliente_id, quarto_id, data_checkin, data_checkout, status) 
VALUES (1, 1, TO_DATE('2024-12-10', 'YYYY-MM-DD'), TO_DATE('2024-12-15', 'YYYY-MM-DD'), 'Confirmada');

INSERT INTO reservas (cliente_id, quarto_id, data_checkin, data_checkout, status) 
VALUES (2, 2, TO_DATE('2024-12-12', 'YYYY-MM-DD'), TO_DATE('2024-12-14', 'YYYY-MM-DD'), 'Pendente');

INSERT INTO reservas (cliente_id, quarto_id, data_checkin, data_checkout, status) 
VALUES (3, 3, TO_DATE('2024-12-11', 'YYYY-MM-DD'), TO_DATE('2024-12-18', 'YYYY-MM-DD'), 'Confirmada');

-- Inserir pedidos
INSERT INTO pedidos (cliente_id, data_pedido, total, status) 
VALUES (1, TO_TIMESTAMP('2024-12-11 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), 150.00, 'Pago');

INSERT INTO pedidos (cliente_id, data_pedido, total, status) 
VALUES (2, TO_TIMESTAMP('2024-12-12 18:30:00', 'YYYY-MM-DD HH24:MI:SS'), 200.00, 'Pendente');

INSERT INTO pedidos (cliente_id, data_pedido, total, status) 
VALUES (3, TO_TIMESTAMP('2024-12-13 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 300.00, 'Pago');

-- Inserir itens de pedidos
INSERT INTO itens_pedido (pedido_id, nome_item, quantidade, preco_unitario) 
VALUES (1, 'Jantar', 2, 50.00);

INSERT INTO itens_pedido (pedido_id, nome_item, quantidade, preco_unitario) 
VALUES (1, 'Bebida', 2, 25.00);

INSERT INTO itens_pedido (pedido_id, nome_item, quantidade, preco_unitario) 
VALUES (2, 'Café da manhã', 1, 50.00);

INSERT INTO itens_pedido (pedido_id, nome_item, quantidade, preco_unitario) 
VALUES (3, 'Almoço', 2, 150.00);

INSERT INTO itens_pedido (pedido_id, nome_item, quantidade, preco_unitario) 
VALUES (3, 'Sobremesa', 2, 75.00);

COMMIT;
