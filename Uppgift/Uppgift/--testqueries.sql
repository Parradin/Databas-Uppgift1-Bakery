-- SQLite
SELECT
    Products.ProductName,
    Ingredients.IngredientName,
    RecipeIngredients.Quantity
FROM Products
JOIN Recipes
    ON Products.Id = Recipes.Product_id
JOIN RecipeIngredients
    ON Recipes.Id = RecipeIngredients.Recipe_id
JOIN Ingredients
    ON RecipeIngredients.Ingredient_id = Ingredients.Id
ORDER BY Products.ProductName;


SELECT
    Suppliers.SupplierName,
    Ingredients.IngredientName,
    Ingredients.PricePerKg
FROM Suppliers
JOIN Ingredients
    ON Suppliers.Id = Ingredients.Supplier_id
ORDER BY Suppliers.SupplierName;

SELECT
    Recipes.Id AS RecipeID,
    Recipes.Product_id,
    RecipeIngredients.Ingredient_id,
    RecipeIngredients.Quantity
FROM Recipes
LEFT JOIN RecipeIngredients
    ON Recipes.Id = RecipeIngredients.Recipe_id;

SELECT
    Ingredients.IngredientName,
    SUM(StockMovement.Quantity) AS StockBalance
FROM Ingredients
JOIN StockMovement
    ON Ingredients.Id = StockMovement.Ingredient_id
GROUP BY Ingredients.Id, Ingredients.IngredientName
ORDER BY Ingredients.IngredientName;