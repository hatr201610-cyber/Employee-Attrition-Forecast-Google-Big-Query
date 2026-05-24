-- Predict Employee Attrition

SELECT *
FROM ML.PREDICT(
    MODEL `project-tranha-302-demo.DA04_ML.attrition_booostedtree_model`,
    (
        SELECT * EXCEPT(employee_id, attrition)
        FROM `project-tranha-302-demo.DA04_ML.attrition_test`
    )
);
