
create view vw_SKUPrice
as
select sku.id, code,  name, dbo.getskuprice(1) as SKUprice from sku
join basket on sku.id = basket.id_sku

