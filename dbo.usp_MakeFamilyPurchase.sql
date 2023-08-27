CREATE PROCEDURE usp_MakeFamilyPurchase
    @FamilySurName varchar(255)
AS
    BEGIN
        DECLARE @name INT;
        SET @name =   (SELECT ID FROM dbo.Family  WHERE SurName = @FamilySurName)
        DECLARE @suma INT;
        SET @suma =     (SELECT  SUM(Value) FROM dbo.Basket 
        WHERE ID_Family = @name
       )
	   end

	   if
	   @name > 0 
	   begin

    UPDATE dbo.Family
    SET BudgetValue = dbo.Family.BudgetValue - @suma
    WHERE Surname = @FamilySurName
	select * from family
	    END
	else print '“¿ Œ… —≈Ã‹» Õ≈“'
	
