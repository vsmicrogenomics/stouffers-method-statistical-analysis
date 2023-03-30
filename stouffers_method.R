### stouffers_method.R

### This R script performs statistical analysis on tab-separated input data and calculates the combined p-value for a group of entities using Stouffer's method. It reads the input data, removes any missing values, applies Stouffer's method to combine the p-values, and writes the results to a new tab-separated output file. The output file includes the entity names, combined p-values, and ranks.
### Written by Vikas Sharma, 2023

# Read input from tab-separated file
p_values <- read.table("test.tsv", header = TRUE, row.names = 1, sep = "\t", na.strings = "None")

# Coerce matrix to numeric
p_values <- as.matrix(p_values)

# Function to apply Stouffer's method
stouffer_method <- function(p_values) {
    # Remove NA values
    p_values <- p_values[!is.na(p_values)]
    
    # Check for any remaining NA values
    if (any(is.na(p_values))) {
        return(NA)
    }
    
    # Calculate Z-scores for each p-value
    z_scores <- qnorm(1 - p_values)
    
    # Calculate weights based on sample size
    weights <- sqrt(length(p_values))
    
    # Calculate combined Z-score using Stouffer's method
    combined_z_score <- sum(z_scores * weights) / sqrt(sum(weights^2))
    
    # Convert combined Z-score to p-value
    combined_p_value <- 1 - pnorm(combined_z_score)
    
    # Return combined p-value
    return(combined_p_value)
}

# Calculate the combined p-value for each organism using Stouffer's method
combined_p_values <- apply(p_values, 2, stouffer_method)

# Create data frame with organism names, combined p-values, and ranks
library(dplyr)
results <- data.frame(Organism = names(combined_p_values), 
                      Combined_p_value = combined_p_values,
                      Rank = rank(combined_p_values, ties.method = "min"))

# Sort results by rank
results <- results[order(results$Rank), ]

# Write results to tab-separated file
write.table(results[, c("Organism", "Combined_p_value", "Rank")], 
            file = "test-out.tsv", sep = "\t", col.names = TRUE, row.names = FALSE)
