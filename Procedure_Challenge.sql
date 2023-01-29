-- ##TASK: 

CREATE PROCEDURE oes.getQuantityOnHand
(
	@product_id INT,
	@warehouse_id INT
)
AS
BEGIN
SELECT 
	quantity_on_hand
FROM
	oes.inventories
WHERE
	product_id = @product_id
AND warehouse_id = @warehouse_id
END

EXEC oes.getQuantityOnHand @product_id = 4, @warehouse_id = 2;

-- ##TASK:

CREATE PROCEDURE oes.getCurrentProducts 
(
	@product_name VARCHAR(100),
	@max_list_price DECIMAL(19,4)
)
AS
BEGIN
	SELECT
		product_id,
		product_name,
		list_price
	FROM
		oes.products
	WHERE 
		discontinued = 0
	AND product_name like '%' + @product_name + '%'
	AND list_price <= @max_list_price
END

EXEC oes.getCurrentProducts @product_name = 'Drone', @max_list_price = 700;

-- ##TASK: 

CREATE PROCEDURE oes.transferFunds
(
	@withdraw_account_id INT,
	@deposit_accunt_id INT, 
	@transfer_amount DECIMAL(30,2)
)
AS 
SET NOCOUNT ON;
SET XACT_ABORT ON;
BEGIN
BEGIN TRANSACTION;
UPDATE oes.bank_accounts SET balance = (balance-@transfer_amount) WHERE account_id = @withdraw_account_id;
UPDATE oes.bank_accounts SET balance = (balance+@transfer_amount) WHERE account_id = @deposit_accunt_id;

INSERT INTO oes.bank_transactions 
		(
			from_account_id, 
			to_account_id, 
			amount
		)
VALUES
		(
			@withdraw_account_id,
			@deposit_accunt_id,
			@transfer_amount
		);

COMMIT TRANSACTION;
END; 

EXEC oes.transferFunds @withdraw_account_id = 1, @deposit_accunt_id = 2, @transfer_amount = 100; 