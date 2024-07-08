#loading lobraby
library(ggplot2)

# Q1.

#loading dataset iris
data("iris")

#scatterplot of Sepal Length and Petal Length
ggplot(iris, aes(x = Sepal.Length, y = Petal.Length, shape = Species, color = Species)) +
  geom_point() +
  labs(x = "Sepal Length", y = "Petal Length", title = "Scatterplot of Sepal Length and Petal Length") +
  theme_minimal()

#conclusion
#By observing the plot, you can make conclusions about the relationship between Sepal.Length and Petal.Length for each species, such as whether there are any patterns or clusters present.

#---------------------------------------------------------------------------------------------------------------------
# Q2.

# Loading the txhousing dataset
data(txhousing)

# structure of datadet
str(txhousing)

# stats of dataset
summary(txhousing)

# missing values in dataset
missing_values <- sum(!complete.cases(txhousing))
cat("Number of missing values:", missing_values, "\n")

#removing all the rows having missing values
txhousing_clean <- txhousing[complete.cases(txhousing), ]

#scatterplot of median housing prices over time
ggplot(txhousing_clean, aes(x = date, y = median)) +
  geom_point() +
  labs(x = "Date", y = "Median Housing Price", title = "Median Housing Prices Over Time") +
  theme_minimal()

#boxplot of housing prices by city
ggplot(txhousing_clean, aes(x = city, y = median)) +
  geom_boxplot() +
  labs(x = "City", y = "Median Housing Price", title = "Housing Prices by City") +
  theme_minimal()

#histogram of housing prices
ggplot(txhousing_clean, aes(x = median)) +
  geom_histogram(binwidth = 5000, fill = "lightblue", color = "black") +
  labs(x = "Median Housing Price", y = "Frequency", title = "Distribution of Housing Prices") +
  theme_minimal()

#---------------------------------------------------------------------------------------------------------------------
# Q3.

# Load the Titanic dataset
titanic <- read.csv("titanic.csv")

# Map Survived as a factor with appropriate labels
titanic$Survived <- factor(titanic$Survived, levels = c(0, 1), labels = c("Dead", "Survived"))

# Create the plot
final_P <- ggplot(titanic, aes(x = Survived, y = Fare, fill = Sex)) +
  geom_boxplot() +
  labs(x = "Survived", y = "Fare", title = "Fare Vs Survived \ninrespective of Sex, richer people survived", size=6) +
  scale_fill_manual(values = c("red", "lightblue"), labels = c("Female", "Male")) +
  theme_bw() +
  coord_flip() +
  guides(fill = guide_legend(title.position = "top", nrow = 2, bycolumn = TRUE))

# Save the plot to a file
ggsave("final_plot.png", plot = final_P, width = 10, height = 6, dpi = 300)
final_P

