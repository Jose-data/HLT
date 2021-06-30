# Compulsory Task

# Data set 1

data(package = "ggplot2") # To call the data set in ggplot2 data bank,
                          # we use the data(package="package name")

ggplot2::mpg              # Call the 'mpg' data set in ggplot2 library

?mpg                      # To learn more about the mpg data set

# Hypothesis 
# Do cars with big engines use more fuel than cars with small engines?
# What does the relationship between engine size and fuel efficiency look like?

# Plot a graph of Car's Highway efficiency against Engine size
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, colour = class)) 

# Adding the line type aesthetics gives a more detail explanation of the plot
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype  = drv))

# Adding the colour aesthetics gives more beauty to the plot & helps to easily differentiation

ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, colour  = drv), se = FALSE)

# Adding multiple geoms in the same plot
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(colour = class)) +
  geom_smooth(se = FALSE)

# Changing axes names and legend name
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(colour = class)) +
  geom_smooth(se = FALSE) +
  labs(title = "Fuel efficiency generally decreases with engine size",
       subtitle = "Two seaters (sport cars) are an exception because of their light weight",
       caption = "Data from fueleconomy.gov",
       x = "Engine displacement (L)",
       y = "Highway fuel economy",
       colour = "Car type")


# Facets
# Using facet_wrap() to study the car class in details
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, colour = class)) + 
  facet_wrap(~ class, nrow = 2) +
  labs( x = "Engine displacement (L)",
        y = "Highway fuel economy",
        colour = "Car type")

# Using facet_grid()
# It is used when we are plotting graphs with multiple variable points

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, colour = class)) + 
  facet_grid(drv ~ cyl) + 
  labs( x = "Engine displacement (L)",
        y = "Highway fuel economy",
        colour = "Car type")

# Annotations are often useful to label individual observation or groups of observations

best_in_class <- mpg %>%
  group_by(class) %>%
  filter(row_number(desc(hwy)) == 1)

# geom_text() produces labels that may be hard to read because labels overlap with each other

ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(colour = class)) +
  geom_text(aes(label = model), data = best_in_class)

# We can improve  things by switching to geom_label() 
# which draws rectangle around the annotated value

ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(colour = class)) +
  geom_label(aes(label = model), data = best_in_class, nudge_y = 2, alpha = 0.5)

# ggrepel() function is used to correct overlaps 

# Installation of ggrepel

install.packages("ggrepel")

library(ggrepel)

?ggrepel

ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(colour = class)) +
  geom_point(size = 3, shape = 1, data = best_in_class) +
  geom_label_repel(aes(label = model), data = best_in_class)


# Data set 2

# Call the diamonds data set from ggplot2 in a data.frame format
ggplot2::diamonds

# To learn more about the diamond data set in ggplot2
?diamonds 

# Adding colours to the outer border of the bars
ggplot(data = diamonds) + geom_bar(mapping = aes(x = cut, colour = cut))

# Using the fill parameter
ggplot(data = diamonds) + geom_bar(mapping = aes(x = cut, fill = cut)) +
  labs( title = "Bar chart Showing the Quality of Diamond",
      x = "Quality of cut",
      y = "Count")

# Using the position = "dodge" makes it easier to compare individual values
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "dodge") +
  labs( title = "Bar chart Showing the Quality of Diamond per clarity",
        x = "Quality of cut",
        y = "Count")  

# Additional Learning Tasks

# 1. 

a <- seq(1,5)
b <- seq(6,10)
c <- seq(11,15)

data <- c(a,b,c)
myMatrix <- matrix(data, nrow = 5, ncol = 3)
myMatrix

plot(myMatrix, type = "b", xlab = "Variable 1", ylab = "Variable 2", 
     main = "Graph of Variable 1 against Variable 2")

# 2.

Names <- c("Joseph", "Dami", "Henry", "Samuel", "Angel")

Age <- c(32, 19, 27, 31, 25)

Role <- c("CTO", "Personal Assistant", "CEO", "CSO", "HR Manager")

length_of_service <- c("10 years", "2 years", "12 years", "5 years", "7 years")

df <- data.frame(Names, Age, Role, length_of_service)

df

# 3 (i)

library(ggplot2)

ggplot2::mpg

?qplot

qplot(displ, hwy, data = mpg, xlab = "Engine Displacement (L)",
      ylab = "Highway Fuel Economy",
      geom = "point", colour = class,
      main = "Fuel efficiency generally decreases with engine size")

# 3 (ii)
x <- seq(1,20)
y <- x**2

qplot(x, y, xlab = "Sequence", ylab = "Exponent", main = "Graph of Sequence against Exponent",
      geom = "smooth")

# 4.

score <- c(90, 70, 60, 78, 50)

subject <- c("Mathematics", "English", "Geography", "Computing", "French")

data1 <- data.frame(score, subject)

# We need to override the data to be able to show individual values in the y axis 
# using the tribble() function from tidyverse

demo <- tribble(
  ~subject,        ~score,
  "Mathematics",   90,
  "English",       70,
  "Geography",     60,
  "Computing",     78,
  "French",        50
)

ggplot(data = data1) + 
  geom_bar(aes(x = subject, y = score), fill = "red", stat = "identity") + 
  labs(title = "Graph showing Mean scores obtained in individual subjects",
       x = "Subjects", y = "Mean Scores")

View(data1)

# 5.

input_name <- readline("Enter your name: ")
input_age <- readline("Enter your age: ")

print(paste("Your name is:", input_name, "and your age is:", input_age))

# 6. 

numbers <- seq(20,50)
numbers

# To find the Mean of numbers, we need to call the mean() function
mean(numbers)

# To find the Sum of individual numbers, we call the sum() function
sum(numbers)

# 7. 
# Get a vector of 10 integer numbers between -50 and +50
# To generate random numbers in R, we call the runif() function

floor(runif(10, min = -50, max = 50))

