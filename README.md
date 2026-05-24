<h1>Employee Attrition Prediction | BigQuery ML</h1>

<h2>Description</h2>
This project focuses on predicting employee attrition using machine learning models built directly in BigQuery ML.  
The objective is to identify employees at risk of leaving the organization and support HR teams with data-driven retention strategies.  
The project compares multiple classification models and evaluates their predictive performance using confusion matrices and evaluation metrics.
<br />

<h2>Tools and Technologies Used</h2>

- <b>Google BigQuery ML</b>
- <b>SQL</b>
- <b>Machine Learning Classification Models</b>

<h2>Project Workflow</h2>

<h3>1. Data Preparation</h3>

- Training dataset: <b>attrition_train</b>
- Testing dataset: <b>attrition_test</b>
- Removed <b>employee_id</b> from training features
- Target variable:
  - <b>Attrition</b>

<h2>Machine Learning Models</h2>

<h3>1. Logistic Regression Model</h3>

- Model Type:
  - <b>LOGISTIC_REG</b>
- Enabled:
  - <b>AUTO_CLASS_WEIGHTS = TRUE</b>

<p align="center">

Build Model: <br/>

<pre>
CREATE OR REPLACE MODEL
attrition_logistics_model
OPTIONS(
MODEL_TYPE='LOGISTIC_REG',
INPUT_LABEL_COLS=['Attrition']
)
</pre>

</p>

<h3>2. Boosted Tree Classifier</h3>

- Model Type:
  - <b>BOOSTED_TREE_CLASSIFIER</b>
- Parallel Trees:
  - <b>2</b>

<h3>3. Random Forest Classifier</h3>

- Model Type:
  - <b>RANDOM_FOREST_CLASSIFIER</b>
- Parallel Trees:
  - <b>2</b>

<h2>Model Evaluation</h2>

Each model was evaluated using:

- <b>ML.EVALUATE</b>
- <b>ML.CONFUSION_MATRIX</b>

Evaluation focused on:

- Accuracy
- Precision
- Recall
- Classification performance comparison

<h2>Prediction Process</h2>

The final prediction step used the Boosted Tree model to predict attrition probabilities on the testing dataset.

<p align="center">

Prediction Query: <br/>

<pre>
SELECT *
FROM ML.PREDICT(
MODEL attrition_booostedtree_model,
(
SELECT * EXCEPT(employee_id, attrition)
FROM attrition_test
))
</pre>

</p>

<h2>Business Value</h2>

- Identify employees with high attrition risk
- Support HR retention strategies
- Improve workforce planning
- Reduce turnover-related costs
- Enable proactive talent management

<h2>Key Learning Outcomes</h2>

- Building ML models directly in SQL
- Comparing classification algorithms
- Using BigQuery ML for predictive analytics
- Evaluating model performance with confusion matrices
- Applying machine learning in HR analytics

<!--
 ```diff
- Reactive employee retention approach
+ Predictive attrition analysis
! Faster HR decision-making
# Improved workforce stability
@@ Data-driven talent retention @@
