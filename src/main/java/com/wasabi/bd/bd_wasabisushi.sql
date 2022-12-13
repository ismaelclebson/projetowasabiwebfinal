CREATE TABLE `cliente` (
	`idCliente` INT(10) NOT NULL AUTO_INCREMENT,
	`email` varchar(100) NOT NULL,
	`nome` varchar(80) NOT NULL,
	`cpf` varchar(25) NOT NULL,
	`telefone` varchar(45) NOT NULL,
	`senha` varchar(50) NOT NULL,
	`endereco` varchar(200),
	PRIMARY KEY (`idCliente`)
);

CREATE TABLE `pagamento` (
	`idPagamento` INT(10) NOT NULL AUTO_INCREMENT,
	`nome` varchar(45) NOT NULL,
	`numeroDoCartao` varchar(45) NOT NULL,
	`cvv` INT(3) NOT NULL,
	`mesExp` INT(2) NOT NULL,
	`anoExp` INT(4) NOT NULL,
	`cpf` varchar(45) NOT NULL,
	PRIMARY KEY (`idPagamento`)
);

CREATE TABLE `pedido` (
	`idPedido` INT(10) NOT NULL AUTO_INCREMENT,
	`idProduto` INT(10) NOT NULL,
	`idCliente` INT(10) NOT NULL,
	`idPagamento` INT(10) NOT NULL,
	`quantidade` INT(10) NOT NULL,
	`total` FLOAT(30,2) NOT NULL,
	`data` varchar(45) NOT NULL,
	`endereco` varchar(400) NOT NULL,
	PRIMARY KEY (`idPedido`)
);

CREATE TABLE `produto` (
	`idProduto` INT(10) NOT NULL AUTO_INCREMENT,
	`nome` varchar(50) NOT NULL,
	`descricao` varchar(200) NOT NULL,
	`preco` FLOAT(30,2) NOT NULL,
	`categoria` varchar(50) NOT NULL,
	`url` varchar(100),
	PRIMARY KEY (`idProduto`)
);

ALTER TABLE `pedido` ADD CONSTRAINT `pedido_fk0` FOREIGN KEY (`idProduto`) REFERENCES `produto`(`idProduto`);

ALTER TABLE `pedido` ADD CONSTRAINT `pedido_fk1` FOREIGN KEY (`idCliente`) REFERENCES `cliente`(`idCliente`);

ALTER TABLE `pedido` ADD CONSTRAINT `pedido_fk2` FOREIGN KEY (`idPagamento`) REFERENCES `pagamento`(`idPagamento`);




