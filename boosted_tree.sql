-Build Booosted Tree Classifier
CREATE OR REPLACE MODEL `project-tranha-302-demo.DA04_ML.attrition_booostedtree_model`
OPTIONS
        (
          MODEL_TYPE = 'BOOSTED_TREE_CLASSIFIER',
          INPUT_LABEL_COLS = ['Attrition'],
          NUM_PARALLEL_TREE = 2
        )
AS
SELECT * EXCEPT (employee_id)
FROM `project-tranha-302-demo.DA04_ML.attrition_train`;

--Evaluate Model
SELECT * FROM ML.EVALUATE (MODEL `project-tranha-302-demo.DA04_ML.attrition_booostedtree_model`),
                          (
                            SELECT * EXCEPT (employee_id)
                            FROM `project-tranha-302-demo.DA04_ML.attrition_test`
                          );
-- Confusion Matrix
SELECT *  FROM ML.CONFUSION_MATRIX (MODEL `project-tranha-302-demo.DA04_ML.attrition_booostedtree_model`),
                          (
                            SELECT * EXCEPT (employee_id)
                            FROM `project-tranha-302-demo.DA04_ML.attrition_test`
                          );
