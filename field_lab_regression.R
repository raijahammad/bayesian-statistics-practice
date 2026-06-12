library(tidyverse)
getwd()
list.files("tbl_2026-05-11-3")

# data set is morph, created object "morph"
morph <- read_csv(
  "tbl_2026-05-11-3/tbl_Morphology_2026-05-11.csv"
)

names(morph)
glimpse(morph)

# testing testing testing

# made a smaller data set from morph
field_lab <- morph %>%
  select(TotalLength_FIELD, TotalLength_LAB)

# visualize data
plot(morph$TotalLength_LAB, morph$TotalLength_FIELD,
     main = "Scatter Plot of Lab Length vs. Field Length",
     xlab = "TotalLength_LAB",
    ylab = "TotalLength_FIELD",
    xlim = c(70, 300),
    ylim = c(0, 520),
    pch = 16, col = blues9)

# fit the model
model <- lm(TotalLength_LAB ~ TotalLength_FIELD, data = field_lab)

# view model results
summary(model)

# NOTE: model is built on the subset of the 542 individuals where both metrics
# were available

# R^2 is 0.9027, meaning 90.3% of the variance in field measurements can be
# explained by the lab measurements

# p-value is <2.2e-16, which is effectively zero. The relationship between lab
# lengths and field lengths is very statistically significant

# residual SE is 13.46 on 540 degrees of freedom; very nice!
# tight margin of error.




