--Build Log Reg Model
CREATE OR REPLACE MODEL `project-tranha-302-demo.DA04_ML.attrition_logistics_model`
OPTIONS
        (
          MODEL_TYPE = 'LOGISTIC_REG',
          INPUT_LABEL_COLS = ['Attrition'],
          AUTO_CLASS_WEIGHTS = TRUE
        )
AS
SELECT * EXCEPT (employee_id)
FROM `project-tranha-302-demo.DA04_ML.attrition_train`;

--Evaluate Model
SELECT * FROM ML.EVALUATE (MODEL `project-tranha-302-demo.DA04_ML.attrition_logistics_model`),
                          (
                            SELECT * EXCEPT (employee_id)
                            FROM `project-tranha-302-demo.DA04_ML.attrition_test`
                          );
-- Confusion Matrix
SELECT *  FROM ML.CONFUSION_MATRIX (MODEL `project-tranha-302-demo.DA04_ML.attrition_logistics_model`),
                          (
                            SELECT * EXCEPT (employee_id)
                            FROM `project-tranha-302-demo.DA04_ML.attrition_test`
                          );
