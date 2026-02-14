SELECT*
FROM layoffs;

-- Data cleaning steps
-- remove duplicate values
-- Standardize data
-- Check the null and blank values
-- Remove any unnecesary columns/rows

CREATE TABLE layoff_staging
LIKE layoffs;

INSERT INTO layoff_staging
SELECT * 
FROM layoffs;


-- look for duplicates
SELECT *
FROM layoff_staging;


WITH duplicate_checker AS
(SELECT*,
ROW_NUMBER() 
	OVER(PARTITION BY company,location,industry,total_laid_off, percentage_laid_off, `date`,stage, country, funds_raised_millions)
    AS row_num
FROM layoff_staging)
SELECT *
FROM duplicate_checker
WHERE row_num>1;

CREATE TABLE layoff_staging2
LIKE layoff_staging;

INSERT INTO layoff_staging2
SELECT * 
FROM layoff_staging;
SELECT* 
FROM layoff_staging2;

-- STANDARDIZE THE DATA
SELECT company, trim(company)
FROM layoff_staging2;

UPDATE layoff_staging2
SET company = trim(company);

SELECT DISTINCT(industry)
FROM layoff_staging2
ORDER BY 1;

SELECT DISTINCT location
FROM layoff_staging2
ORDER BY 1;

-- TRIM( TARILING '.' LOCATION) - Advanced way of trimming things other than whitespaces
SELECT `date` ,
STR_TO_DATE(`date`, '%m/%d/%Y')
FROM layoff_staging2;

UPDATE layoff_staging2
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

ALTER TABLE layoff_staging2
MODIFY COLUMN `date` DATE;

SELECT industry
FROM layoff_staging2
WHERE industry IS NULL 
OR industry ='';




SELECT *
FROM layoff_staging2
WHERE total_laid_off IS NULL 
AND percentage_laid_off IS NULL;

SELECT *
FROM layoff_staging2
WHERE industry IS NULL or 
industry='';

SELECT *
FROM layoff_staging2;

SELECT company, industry
FROM layoff_staging2
where company ='airbnb';

DELETE
FROM layoff_staging2
WHERE total_laid_off IS NULL 
AND percentage_laid_off IS null;



