USE ecommerce;
SHOW TABLES;

INSERT INTO cliente (Pnome, NomeMeio, Sobrenome, CPF, DataNascimento, Endereco) VALUES
				('Rafael', 'Melo', 'Santos', 36960339790, '1952-01-03', 'Rua Jadeildo Pereira da Silva, 441 - Casa Grande, Diadema - SP'),
                ('Stella', null, 'Rocha', 44004692202, '1989-04-05', 'Rua Maria Luiza, 695 - Cidade Industrial, Teresina - PI'),
                ('Issac', 'Nicolas', 'Santos', 46636652926, '1957-05-14', 'Rua Espírito Santo, 641 - Califórnia, Itabuna - BA'),
                ('Luciana', null, 'Menezes', 17144964739, '1971-05-22', 'Conjunto Solar dos Lusíadas, 646 - Turu, São Luís - MA');
				
SELECT * FROM cliente;

INSERT INTO produto (nome, categoria_crianca, categoria, descricao, valor, avaliacao) VALUES
							  ('BicIcleta Infantil Aro 12 Spider Man', true, 'Brinquedo', 'Quadro, garfo e guidão em aço carbono; Limitador de giro do guidão; Freio a tambor; Regulagem de ângulo do guidão e da altura do selim; Pneus em E.V.A.; Selim em PU.', 266.99, 4.5),
                              ('Samsung Galaxy S22 Ultra', false, 'Eletrônico', 'SmartphoNe Samsung Galaxy S22 Ultra 5G (256GB), 256GB, 12GB, Processador Octa-Core, Selfie de 40MP, Tela Infinita de 6.8" 1-120Hz, Dual Chip, Android 12.', 4123, 5),
                              ('Xiaomi ReDmi Note 12', false, 'Eletrônico', 'O Redmi NOte 12 é um smartphone Android avançado e abrangente em todos os pontos de vista com algumas características excelentes.', 1139, null),
                              ('Kindle 11', false, 'Eletrônico', 'O Kindle mais leve e compacto, agora com tela de 300 ppi de alta resolução para textos e imagens nítidos.', 474, 3.5),
                              ('Achocolatado PiraKids 200ml', true, 'Alimento', 'Rico em vitaminas e minerais que auxiliam na boa nutrição, crescimento saudável e desenvolvimento físico; tudo isso em uma fórmula isenta de gorduras trans e glúten.', 1.99, 4);
                              
SELECT * FROM produto; 

INSERT INTO pedido (idCliente, StatusPedido, Descricao, Frete) VALUES 
							 (1, defauLT, 'Compra via aplicativo', null),
                             (1, 'Entregue', 'Compra via web Site', 50),
                             (2, 'Entregue', 'Compra via aplicativo', 8.5),
                             (3, 'Enviado', 'Compra via Web site', 15);
SELECT * FROM pedido;    
          

INSERT INTO relacao_produto_pedido (idProduto, idPedido, Quantidade, StatusProdutoPedido) VALUES
			 (1, 1, 0, 'Indisponível'),
			 (2, 2, 8, 'Disponível'),
             (3, 3, 5, 'Disponível'),
             (2, 4, 8, 'Disponível');
                    
 SELECT * FROM relacao_produto_pedido;               
                    
INSERT INTO estoque (LocalEstoque, Quantidade) VALUES
			    ('Belo HorizontE', 120),
				('São Paulo', 3000),
				('Rio Branco', 0);
                
SELECT * FROM estoque; 

INSERT INTO fornecedor (RazaoSocial, Cnpj, Contato, Endereco) VALUES 
							('Faria Coimbra ME', 96403228000100, '4835981032', 'Rua Inácio Zaleski, 40 - Vila São José, Mogi Mirim - SP'),
                            ('VAlente Ferragens', 31319527000107,'21985484', 'Rua João XXIII, 14 - Centro, Teófilo Otoni - MG');
SELECT * FROM fornecedor;

INSERT INTO produto_fornecedor (idFornecedor, idProduto, Quantidade) VALUES
						 (1, 1, 80),
                         (2, 5, 1000),
                         (1, 4, 400);
SELECT * FROM produto_fornecedor;

SELECT Pnome, NomeMeio, Sobrenome, StatusPedido FROM cliente c, pedido p WHERE c.idCliente = p.idCliente;
SELECT Nome, Categoria, Categoria_crianca FROM produto WHERE categoria_crianca = false;
SELECT Nome, Valor, Avaliacao FROM produto ORDER BY valor DESC;
SELECT * FROM cliente c INNER JOIN pedido p ON c.idCliente = p.idCliente INNER JOIN relacao_produto_pedido pp ON pp.idPedido = p.idPedido GROUP BY p.idCliente; 
SELECT Pnome, NomeMeio, Sobrenome, YEAR(FROM_DAYS(TO_DAYS(NOW())-TO_DAYS(c.DataNascimento))) AS IdadeCliente FROM cliente c;
SELECT Categoria, AVG(Avaliacao) FROM produto GROUP BY categoria HAVING AVG(Avaliacao) >= 3;