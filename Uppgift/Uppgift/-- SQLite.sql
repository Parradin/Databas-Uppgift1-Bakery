-- SQLite
DROP TABLE Suppliers;
DROP TABLE Ingredients;
DROP TABLE Purchases;
DROP TABLE PurchaseItem;
DROP TABLE StockMovement;

PRAGMA foreign_keys = ON;

PRAGMA foreign_key_list(StockMovement);

CREATE TABLE Suppliers(
    Id INTEGER PRIMARY key AUTOINCREMENT,
    SupplierName VARCHAR(40) NOT NULL,
    ContactFirstName VARCHAR(20) NOT NULL,
    ContactLastName VARCHAR(40) NOT NULL,
    Address VARCHAR(60) NOT NULL,
    Email VARCHAR(128) UNIQUE NOT NULL,
    Phone VARCHAR(15)
);

CREATE TABLE Ingredients(
    Id INTEGER PRIMARY key AUTOINCREMENT,
    ArticleNumber VARCHAR(15) UNIQUE NOT NULL,
    IngredientName VARCHAR(20) NOT NULL,
    PricePerKg FLOAT NOT NULL,
    Supplier_id INTEGER NOT NULL,
    CONSTRAINT fk_suppliers FOREIGN KEY(Supplier_id) REFERENCES Suppliers(Id)
);

CREATE TABLE Purchases(
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    Supplier_id INTEGER NOT NULL,
    PurchaseDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT fk_suppliers FOREIGN KEY(Supplier_id) REFERENCES Suppliers(Id)
);

CREATE TABLE PurchaseItem(
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    Purchase_id INTEGER NOT NULL, 
    Ingredient_id INTEGER NOT NULL, 
    Quantity FLOAT NOT NULL,
    PricePerKg FLOAT NOT NULL,
    CONSTRAINT fk_purchasesitem_purchases FOREIGN KEY(Purchase_id) REFERENCES Purchases(Id),
    CONSTRAINT fk_purchaseitem_ingredient FOREIGN KEY(Ingredient_id) REFERENCES Ingredients(Id)
);

CREATE TABLE StockMovement(
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    Ingredient_id INTEGER NOT NULL, 
    Quantity FLOAT NOT NULL,
    MovementDate DATE DEFAULT CURRENT_DATE NOT NULL,
    MovementType VARCHAR(80) NOT NULL,
    CONSTRAINT fk_stockmovement_ingredients FOREIGN KEY(Ingredient_id) REFERENCES Ingredients(Id)
);

CREATE TABLE Products(
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    ProductName VARCHAR(40) NOT NULL UNIQUE,
    Price DECIMAL(10,2) NOT NULL
);

CREATE TABLE Recipes(
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    Product_id INTEGER NOT NULL UNIQUE,
    CONSTRAINT fk_recipes_products FOREIGN KEY(Product_id) REFERENCES Products(Id)
);

CREATE TABLE RecipeIngredients(
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    Recipe_id INTEGER NOT NULL,
    Ingredient_id INTEGER NOT NULL,
    Quantity FLOAT NOT NULL,
    CONSTRAINT fk_recipeingredients_recipes FOREIGN KEY(Recipe_id) REFERENCES Recipes(Id),
    CONSTRAINT fk_recipeingredients_ingredients FOREIGN KEY(Ingredient_id) REFERENCES Ingredients(Id)
    UNIQUE(Recipe_id, Ingredient_id)
); 