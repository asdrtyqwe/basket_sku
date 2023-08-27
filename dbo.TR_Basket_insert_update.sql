CREATE TRIGGER TR_Basket_insert_update
ON basket 
AFTER INSERT
AS 



IF (select count(id_sku) from inserted
where inserted.ID_SKU in 
(select ID_SKU from basket
group by ID_SKU
having count(ID_SKU) > 1
)) > 1

begin
UPDATE basket 
set DiscountValue = basket.value * 00.5
from Basket
join inserted on basket.ID = inserted.ID
where inserted.ID_SKU in 
(select ID_SKU from inserted
group by ID_SKU
having count(*)>1)


UPDATE basket 
set DiscountValue = basket.value * 0
from Basket
join inserted on basket.ID = inserted.ID
where inserted.ID_SKU in 
(select ID_SKU from inserted
group by ID_SKU
having count(*)=1)
end

else




	UPDATE Basket
	set DiscountValue = 0 
	from Basket
	join inserted on basket.ID = inserted.ID
	where basket.id= inserted.id



GO