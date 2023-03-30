# stouffers-method-statistical-analysis

The "stouffers_method.R" code is designed to perform statistical analysis on tab-separated input data and calculate the combined p-value for a group of entities, such as organisms or genes. The code reads the input data, removes any missing values, applies Stouffer's method to combine the p-values, and writes the results to a new tab-separated output file. The output file includes the entity names, combined p-values, and ranks.

Test Data:
The sample input data is a tab-separated table with 5 columns and 5 rows, representing the p-values for different organisms across 5 genes. Each value in the table represents the p-value of a statistical test for a gene in a specific organism. The value "None" in the table represents a missing value or NA.

Acknowledgements: This code is based on Stouffer's method, a statistical method proposed by Stouffer et al. in 1949.

If you are using this code, please cite it as follows: Sharma, V. (2023). stouffers-method-statistical-analysis [R script]. Retrieved from https://github.com/vsmicrogenomics/stouffers-method-statistical-analysis.

