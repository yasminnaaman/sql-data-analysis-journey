SELECT * 
FROM
nashville_housing_data_2013_2016
LIMIT 57000;
CREATE TABLE `housing_staging` (
  `MyUnknownColumn` int DEFAULT NULL,
  `Unnamed: 0` int DEFAULT NULL,
  `Parcel ID` text,
  `Land Use` text,
  `Property Address` text,
  `Suite/ Condo   #` text,
  `Property City` text,
  `Sale Date` text,
  `Sale Price` int DEFAULT NULL,
  `Legal Reference` text,
  `Sold As Vacant` text,
  `Multiple Parcels Involved in Sale` text,
  `Owner Name` text,
  `Address` text,
  `City` text,
  `State` text,
  `Acreage` text,
  `Tax District` text,
  `Neighborhood` text,
  `image` text,
  `Land Value` text,
  `Building Value` text,
  `Total Value` text,
  `Finished Area` text,
  `Foundation Type` text,
  `Year Built` text,
  `Exterior Wall` text,
  `Grade` text,
  `Bedrooms` text,
  `Full Bath` text,
  `Half Bath` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO housing_staging
select * 
FROM nashville_housing_data_2013_2016;

WITH duplicate_checker AS (
    SELECT *,
    ROW_NUMBER() OVER(
        PARTITION BY MyUnknownColumn, `Unnamed: 0`, `Parcel ID`, `Land Use`, `property address`, 
        `Suite/ Condo   #`, `property City`, `sale date`, `sale price`, `legal reference`, 
        `sold as vacant`, `Multiple parcels involved in sale`, `Owner name`, Address, city, state, 
        acreage, `tax district`, neighborhood, image, `land value`, `building value`, 
        `Total value`, `finished area`, `foundation type`, `year built`, `exterior wall`,
        grade, bedrooms, `full bath`, `half bath`
    ) AS row_num
    FROM housing_staging
)
SELECT * 
FROM duplicate_checker
WHERE row_num > 1;   

CREATE TABLE `housing_staging2` (
  `MyUnknownColumn` int DEFAULT NULL,
  `Unnamed: 0` int DEFAULT NULL,
  `Parcel ID` text,
  `Land Use` text,
  `Property Address` text,
  `Suite/ Condo   #` text,
  `Property City` text,
  `Sale Date` text,
  `Sale Price` int DEFAULT NULL,
  `Legal Reference` text,
  `Sold As Vacant` text,
  `Multiple Parcels Involved in Sale` text,
  `Owner Name` text,
  `Address` text,
  `City` text,
  `State` text,
  `Acreage` text,
  `Tax District` text,
  `Neighborhood` text,
  `image` text,
  `Land Value` text,
  `Building Value` text,
  `Total Value` text,
  `Finished Area` text,
  `Foundation Type` text,
  `Year Built` text,
  `Exterior Wall` text,
  `Grade` text,
  `Bedrooms` text,
  `Full Bath` text,
  `Half Bath` text,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO housing_staging2
    SELECT *,
    ROW_NUMBER() OVER(
        PARTITION BY MyUnknownColumn, `Unnamed: 0`, `Parcel ID`, `Land Use`, `property address`, 
        `Suite/ Condo   #`, `property City`, `sale date`, `sale price`, `legal reference`, 
        `sold as vacant`, `Multiple parcels involved in sale`, `Owner name`, Address, city, state, 
        acreage, `tax district`, neighborhood, image, `land value`, `building value`, 
        `Total value`, `finished area`, `foundation type`, `year built`, `exterior wall`,
        grade, bedrooms, `full bath`, `half bath`
    ) AS row_num
    FROM housing_staging;

DELETE 
FROM housing_staging2
WHERE row_num>1; 

   
SELECT *
FROM housing_staging2;

ALTER table housing_staging2
drop column MyUnknownColumn;

ALTER table housing_staging2
rename column `unnamed: 0` TO `Order`;

ALTER table housing_staging2
drop column row_num;

SELECT *
FROM housing_staging2
WHERE `sold as vacant` NOT IN ('YES' OR 'NO');

SELECT `sale date`,
str_to_date(`Sale Date`, '%Y-%m-%d') as `sale date`
FROM housing_staging2;

Update housing_staging2
SET `sale date` = str_to_date(`Sale Date`, '%Y-%m-%d');

ALTER TABLE housing_staging2
MODIFY COLUMN `Sale date` DATE;

SELECT *
FROM housing_staging2 tb1
JOIN housing_staging2 tb2
ON tb1.`Parcel ID`= tb2.`Parcel ID`
WHERE tb1.`Property Address` = tb2.`Property Address`;

SELECT `order`, `parcel id`, `land use`, `property address`
FROM housing_staging2
WHERE `property address` is NULL AND 
`property address` = ' ';










