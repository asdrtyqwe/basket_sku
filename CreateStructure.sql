CREATE TABLE dbo.SKU
   (
      ID int PRIMARY KEY IDENTITY (1,1) NOT NULL
      , Code as 's'+ cast(ID  as varchar) , CONSTRAINT ak_code UNIQUE(Code)
      , Name varchar (50) 
    );

	CREATE TABLE dbo.Family
   (
      ID int PRIMARY KEY IDENTITY (1,1) NOT NULL
      , SurName varchar (50) 
      , BudgetValue int 
    );

		CREATE TABLE dbo.Basket
   (
      ID int PRIMARY KEY IDENTITY (1,1) NOT NULL
      ,ID_SKU int REFERENCES SKU (id)
	  ,ID_Family int REFERENCES Family (id)
	  ,Quantity decimal(18, 2) CHECK (Quantity !< 0)
	  ,Value decimal(18, 2) CHECK (Value !< 0)
	  ,PurchaseDate date  DEFAULT GETDATE() 
	  ,DiscountValue int
    );



