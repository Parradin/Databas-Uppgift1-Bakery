-- SQLite
INSERT INTO Suppliers(
    SupplierName,
    ContactFirstName,
    ContactLastName,
    Address,
    Email,
    Phone
)VALUES(
    'Kvarn AB',
    'Anna',
    'Andersson',
    'Berggatan 54',
    'anna@gmail.com',
    '0765225496'
),(
    'Mejeri AB',
    'Erik',
    'Erikson',
    'planetgatan 44',
    'Erik@gmail.com',
    NULL
),(
    'Bagerigrossisten',
    'Lisa',
    'Larsson',
    'Vita vägen 33',
    'lisa@gmail.com',
    NULL
);

INSERT INTO Ingredients(
    ArticleNumber,
    IngredientName,
    PricePerKg,
    Supplier_id
)VALUES
('MJ001', 'Vetemjöl', 15.50, 1),
('MJ002', 'Strösocker', 18.90, 1),
('MJ003', 'Kanel', 120.00, 1),
('ME001', 'Smör', 85.00, 2),
('ME002', 'Mjölk', 12.50, 2),
('BA001', 'Jäst', 25.00, 3);

SELECT * FROM Ingredients;

INSERT INTO Purchases(
    Supplier_id,
    PurchaseDate
)
VALUES
(1, '2026-11-20'),
(2, '2026-11-21'),
(3, '2026-11-22');

SELECT * FROM Purchases;

INSERT INTO PurchaseItem(
    Purchase_id,
    Ingredient_id,
    Quantity,
    PricePerKg
)
VALUES
(1, 100, 50, 15.50),
(1, 101, 20, 18.90),
(2, 103, 15, 85.00),
(2, 104, 30, 12.50),
(3, 105, 10, 25.00);

SELECT Id, IngredientName FROM Ingredients;

INSERT INTO StockMovement(
    Ingredient_id,
    Quantity,
    MovementType
)
VALUES
(100, 50, 'IN'),
(101, 20, 'IN'),
(103, 15, 'IN'),
(104, 30, 'IN'),
(105, 10, 'IN'),
(100, -5, 'OUT'),
(103, -2, 'OUT');

SELECT * FROM StockMovement;

INSERT INTO Products(
    ProductName,
    Price
)
VALUES
('Kanelbulle', 25.00),
('Vetelängd', 45.00),
('Surdegsbröd', 55.00),
('Vaniljbulle', 25.00),
('Kardemummabulle', 28.00);

SELECT * FROM Products;

INSERT INTO Recipes(
    Product_id
)
VALUES
(1),
(2),
(3),
(4),
(5);

SELECT * FROM Recipes;

INSERT INTO RecipeIngredients(
    Recipe_id,
    Ingredient_id,
    Quantity
)
VALUES
-- Kanelbulle (recept 1)
(1, 100, 500),
(1, 101, 100),
(1, 103, 150),
(1, 105, 25),

-- Vetelängd (recept 2)
(2, 100, 600),
(2, 101, 120),
(2, 104, 200),
(2, 105, 30),

-- Surdegsbröd (recept 3)
(3, 100, 1000),
(3, 104, 500),

-- Vaniljbulle (recept 4)
(4, 100, 500),
(4, 101, 100),
(4, 103, 100),
(4, 105, 25),

-- Kardemummabulle (recept 5)
(5, 100, 500),
(5, 101, 100),
(5, 103, 100),
(5, 105, 25);

SELECT * FROM RecipeIngredients;