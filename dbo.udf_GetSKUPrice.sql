
CREATE FUNCTION GetSKUPrice
(
	@ID_SKU int
)
RETURNS decimal(18, 2)
AS
BEGIN

declare @result decimal(18, 2)

 select @result = ((sum(value)) / (sum(quantity))) from basket
 where ID_SKU = @ID_SKU

	RETURN @result

END
GO

