#-------------------- R ASSIGNMENTS By Clive Dominic Andrews-------------------#

#------------------------------------------------------------------------------#
# ASSIGNMENT 1.Try to write a code for printing sequence of numbers from 1 to 50 with the differences of 3, 5, 10
#------------------------------------------------------------------------------#
seq50_step_3 = seq(1,50,by=3) # This command will give the sequence from 1 to 50 with a difference of 3
seq50_step_3

seq50_step_5 = seq(1,50,by=5) # This command will give the sequence from 1 to 50 with a difference of 5
seq50_step_5

seq50_step_10 = seq(1,50,by=10) # This command will give the sequence from 1 to 50 with a difference of 10
seq50_step_10


#------------------------------------------------------------------------------#
# ASSIGNMENT 2. What are the different data objects in R? and write syntax and example for each and every object
#------------------------------------------------------------------------------#

# The different data objects in R include vector, list, matrix, data frame and factors.

#--------
# VECTOR
#--------

# Below is an example of the 6 outcomes of a die represented as a vector having the value as 'die'
# This below example is NUMERIC Data type
die <- c(1, 2, 3, 4, 5, 6)
# Printing the value for 'die'
die
# To check and ensure that it is vector, we use the following command
is.vector(die)

# The typeof and class will tell what is the data type
typeof(die) # This will give the result as "double", which is the default
class(die) # This will give the result as "numeric". Changing the dimensions will however change the class.

# INTEGER Data type example
integer_DT <- c(-1L, 2L, 4L) # here L denotes that it is an integer, we are forcing it to be integers
typeof(integer_DT) # This will give the result as "integer"
class(integer_DT) # This will also give the result as "integer". Changing the dimensions will however change the class.

# CHARACTER Data type example
character_DT <- c("Clive",  "Is", "Programming", "In", "R")
typeof(character_DT) # This will give the result as "character"
class(character_DT) # This will also give the result as "character". Changing the dimensions will however change the class.

# LOGICAL Data type example
logical_DT <- c(FALSE, FALSE, TRUE, TRUE, FALSE, TRUE)
typeof(logical_DT) # This will give the result as "logical"
class(logical_DT) # This will also give the result as "logical". Changing the dimensions will however change the class.

# COMPLEX Data type example
complex_DT <- c(2 + 3i, 3 + 5i, 3 + 2i) # There are 3 complex numbers with Real and imaginary terms
typeof(complex_DT) # This will give the result as "complex"
class(complex_DT) # This will also give the result as "complex". Changing the dimensions will however change the class.


#--------
# LIST
#--------
# Lists are like vectors because they group data into a one-dimensional set. However, lists do not group together individual values.
# Lists group together R objects, such as vectors, other lists or functions as shown below.
list_DT <- list(89, 91.3,c(3,2,1), "Clive says hello", sin)
typeof(list_DT) # This will give the result as "list"
class(list_DT) # This will also give the result as "list"

#--------
# MATRIX
#--------
# The Matrix store values in a two-dimensional array
# The data elements of the Matrix must be of the same type
# All columns in a matrix must have the same type of mode(numeric, character, etc.)

die <- c(1, 2, 3, 4, 5, 6)
matrix_DT_Rows <- matrix(die, nrow = 2, byrow = FALSE) # Aligning data by rows
matrix_DT_Cols <- matrix(die, nrow = 2, byrow = TRUE)  # Aligning data by columns
typeof(matrix_DT_Rows)    # This will give the result as "double", the default data type for numbers
class(matrix_DT_Rows)     # This will give the result as "matrix" "array" indicating a 2 dimensional array as matrix
matrix_DT_Rows            # Printing the output
View(matrix_DT_Rows)      # This displays the row-wise data assigned matrix as a view i.e., in proper format (looks good to see)
View(matrix_DT_Cols)      # This displays the row-wise data assigned matrix as a view i.e., in proper format (looks good to see)


#--------
# ARRAYS
#--------
# While Matrix are two-dimensional, arrays are n-dimensional(can be of any number)
# The data elements of the Matrix must be of the same type
# All columns in a matrix must have the same type of mode(numeric, character, etc.)

array_DT <- array(c("Clive", "Andrews", "Doing", "R", "Programming"), dim = c(3, 3, 5)) # Here it is 3 by 3 matrix in 5 layers back to back
class(array_DT)     # This will also give the result as "array" indicating a 2 dimensional array as matrix
array_DT[,,3]       # 3rd array/layer
View(array_DT[,,3]) # This displays the same data but in proper format (looks good to see)


#--------
# DATA FRAMES
#--------
# Data frames are the two-dimensional version of a list
# Each vector becomes a column in the table. 
# Each column of a data frame can contain a different type of data; but within a column, every cell must be the same type of data

data_frame_DT <- data.frame(
                            face = c("king", "queen", "ace", "two", "four", "six"),  
                            suit = c("Hearts", "Hearts", "Hearts", "clubs", "clubs", "clubs"), 
                            value = c(1, 2, 3, 1, 2, 3)
                            )
typeof(data_frame_DT)   # This will give the result as "list" as it is a combination of lists
class(data_frame_DT)    # This will give the result as "data.frame" based on the dimensions
str(data_frame_DT)      # This will give what types of objects are grouped together by a list or data frame 

View(data_frame_DT) # This displays the data frame in a view in proper format (looks good to see)



#------------------------------------------------------------------------------#
# ASSIGNMENT 3. Create Data frame with 3 columns and 5 rows and 
#     write a code to fetch and delete row and a column using index and 
#     add new column and row to the existed data frame
#------------------------------------------------------------------------------#

datafr=data.frame(id = c(14, 51, 43, 16, 56),
                  pages = c(323, 239, 342, 201, 673),
                  title =c("Advanced Excel", "PowerBI", "Tableau", "R","Python")
                  )

datafr;

# Accessing elements of a data frame new_df
datafr$pages      # Getting all the pages for the books
datafr$title      # Getting all the titles for the books 
datafr$title[4]   # Getting the 4 book title
datafr[,3]        # Similar to before getting all the titles for the books 
datafr[2]         # Getting the second column i.e., the pages for the books   
datafr[[2]]       # Similar to before getting all the pages for the books 
datafr[[2]][4]    # Getting the page count for the 4th book i.e., R which gives 201

# ASSIGNMENT 3(a) - DELETION BASED ON ROWS
#------------------------------------------
# To demonstrate the deletion we are assigning the data frame datafr to the new data frame new_datafr after performing the delete action
# NOTE: We want to retain the original data in data frame 'datafr', so it can be used repeatedly.


# The below command is to delete 2nd row by using the INDEX as asked in the assignment
new_datafr <- datafr[-2,]   # This will remove the second row completely
new_datafr        # This new data frame does not include PowerBI details, which is the second row


# --------------- THE BELOW BLOCK IS ADDITIONAL (SELF-LEARNING) ---------------#
# We can also delete multiple rows using the below command
new_datafr <- datafr[-c(1, 3, 5),] # Here we are deleting the 1st, 3rd and 5th records and then assigning to new_datafr
new_datafr        # new_datafr does not include the 1st, 3rd and 5th records and only includes the 2nd and 4th records

# We can also delete rows from a given range
new_datafr <- datafr[-(1:3),] # This will remove the 1st to 3rd rows only retaining the 4th and 5th rows.
new_datafr

# We can also delete rows based on the row name
new_datafr <- datafr[(!row.names(datafr) %in% c("1","3")),]   # This will delete the rows with the name 1 and 3
new_datafr

# We can also delete rows with column 'id' having value less than 50
new_datafr <- subset(datafr,id < 50)  # This will only show 1st, 3rd and 4th Records
new_datafr
# -----------------------------------------------------------------------------#


# ASSIGNMENT 3(a) - DELETION BASED ON COLUMNS
#---------------------------------------------
# To demonstrate the deletion we are assigning the data frame datafr to the new data frame new_datafr after performing the delete action
# NOTE: We want to retain the original data in data frame 'datafr', so it can be used repeatedly.

# The below command is to delete 2nd column by using the INDEX as asked in the assignment
new_datafr <- datafr[,-2]   # This will delete the second column completely and so pages will not be shown in new_datafr 
new_datafr

# --------------- THE BELOW BLOCK IS ADDITIONAL (SELF-LEARNING) ---------------#
# We can also delete multiple columns using the below command
new_datafr <- datafr[,-c(1, 2)] # Here we are deleting the 1st and 2nd columns and then assigning to new_datafr
new_datafr        # new_datafr does not include the 3rd column

# We can also delete rows from a given range
new_datafr <- datafr[,-(1:2)] # This will remove the 1st to 2nd columns only retaining the 3rd column.
new_datafr

# We can also delete columns based on the column name
new_datafr <- datafr[,(!names(datafr) %in% c("pages"))]   # This will delete the column name 'pages'
new_datafr

# We can also delete columns using subset
new_datafr <- subset(datafr,select = -c(pages))  # This will remove column name 'pages' and only show 1st, 3rd and 4th Records
new_datafr
# -----------------------------------------------------------------------------#



chapters = c(34, 36, 46, 56, 76)
price = c(144, 553, 250, 270, 530)


# ASSIGNMENT 3(b) - ADDING NEW ROWS TO EXISTING DATA FRAME
#---------------------------------------------------------
# NOTE: We want to retain the original data in data frame 'datafr', so it can be used repeatedly.


# Add a single row denoted by a new vector new_book using rbind()
new_book = c(id = 33, pages=150, name = "Business Statistics")
new_datafr = rbind(datafr,new_book)
new_datafr


# --------------- THE BELOW BLOCK IS ADDITIONAL (SELF-LEARNING) ---------------#

# Add Row to the newly created data frame new_datafr
# However, this converts all data types to string as a vector only holds one type of data
new_datafr <- datafr
new_datafr[nrow(new_datafr) + 1,] <- c(33, 150, "Business Statistics")    # Adding new column with details of "Business Statistics"
new_datafr

# Add Row to the newly created data frame new_datafr without changing the data type
new_datafr <- datafr
new_datafr[nrow(new_datafr) + 1,] <- list(33, 150, "Business Statistics") # Adding new column with details of "Business Statistics"
new_datafr

# -----------------------------------------------------------------------------#


# ASSIGNMENT 3(b) - ADDING NEW COLUMNS TO EXISTING DATA FRAME
#-------------------------------------------------------------
# NOTE: We want to retain the original data in data frame 'datafr', so it can be used repeatedly.

# The below command is to add a new column chapter using cbind, as asked in the assignment
# Adding chapters to data frame 'datafr' Using cbind
new_datafr <- datafr
new_datafr <- cbind(new_datafr, chapters)
new_datafr




# --------------- THE BELOW BLOCK IS ADDITIONAL (SELF-LEARNING) ---------------#

# Adding new column chapters to the existing Data Frame and then assigning to new Data Frame
# To demonstrate it we will assigning the data frame datafr to the new data frame new_datafr after addition action
# We are avoiding changing the original data frame datafr to reuse and run of next commands without altering the original data frame

# Adding chapters to data frame 'datafr' Using $ notation
new_datafr <- datafr
new_datafr$chapters = chapters
new_datafr

# Adding chapters to the data frame 'datafr' Using bracket notation

new_datafr <- datafr
new_datafr['chapters'] <- chapters
new_datafr

# Add multiple columns to the data frame 'datafr'
new_datafr <- datafr
new_datafr <- cbind(new_datafr, chapters, price)
new_datafr

# -----------------------------------------------------------------------------#


#------------------------------------------------------------------------------#
# 4. Write nested if else statements to print whether the given number is negative, positive or Zero
# Added 3 different values for x and the program below to show the working is fine
# Added extra comments to share my understanding and working of the code, in normal circumstances may not be needed
#------------------------------------------------------------------------------#

x <- 43

if(x == 0){ # If number is equal to zero, it will enter this block
  # Choosing to use the below statement rather than the simple - print('zero');
  paste("The given number provided", x, "is", "zero", sep = ' ')
} else { # If number is not equal to zero it will come to this block
  if(x > 0) { # checks if the number is greater than zero then it will indicate as 'positive'
    # Choosing to use the below statement rather than the simple - print('positive');
    paste("The given number provided", x, "is", "positive", sep = ' ')
  } else { # If number is lesser than zero, it will enter this block and indicate that it is 'negative'
    # Choosing to use the below statement rather than the simple - print('negative');
    paste("The given number provided", x, "is", "negative", sep = ' ');
  }
}

x <- 0

if(x == 0){ # If number is equal to zero, it will enter this block
  # Choosing to use the below statement rather than the simple - print('zero');
  paste("The given number provided", x, "is", "zero", sep = ' ')
} else { # If number is not equal to zero it will come to this block
  if(x > 0) { # checks if the number is greater than zero then it will indicate as 'positive'
    # Choosing to use the below statement rather than the simple - print('positive');
    paste("The given number provided", x, "is", "positive", sep = ' ')
  } else { # If number is lesser than zero, it will enter this block and indicate that it is 'negative'
    # Choosing to use the below statement rather than the simple - print('negative');
    paste("The given number provided", x, "is", "negative", sep = ' ');
  }
}

x <- -56

if(x == 0){ # If number is equal to zero, it will enter this block
  # Choosing to use the below statement rather than the simple - print('zero');
  paste("The given number provided", x, "is", "zero", sep = ' ')
} else { # If number is not equal to zero it will come to this block
  if(x > 0) { # checks if the number is greater than zero then it will indicate as 'positive'
    # Choosing to use the below statement rather than the simple - print('positive');
    paste("The given number provided", x, "is", "positive", sep = ' ')
  } else { # If number is lesser than zero, it will enter this block and indicate that it is 'negative'
    # Choosing to use the below statement rather than the simple - print('negative');
    paste("The given number provided", x, "is", "negative", sep = ' ');
  }
}


#------------------------------------------------------------------------------#
# 5.Write a program to input any value and check whether it is character, numeric or special character
#------------------------------------------------------------------------------#

clive_list = list("C", 4, "//", "[", "#", "*", "l", 7L, "(", "{", 3.4, "i", "^", "$", "V", "e", 9.98987987)

for (i in clive_list) {
  if (is.numeric(i)) {
    print("Numeric")
  } else if (grepl("[[:punct:]]", i)) {
    print("Special character")
  } else if(is.character(i)) {
    print("character")
  }
}



#------------------------------------------------------------------------------#
# 6.Write difference between break and next also write examples for both 
#------------------------------------------------------------------------------#

#---------------#
# NEXT STATEMENT
#---------------#

# The next statement skips the current iteration of the loop, if a particular condition matches. However, the next iteration will continue as usual and the loop is not terminated.

# Example illustrating 'NEXT': 
nums <- seq(1:10)
for (i in nums) {
  if ((i == 2) || (i == 6)) { # Here we are skipping the iteration if the number is found to be 2 or 6
    next
  }
  print(i)  # This will only print the values - 1, 3, 4, 5, 7, 8, 9, 10. Note: 2 and 6 are skipped.
}

#---------------#
# BREAK STATEMENT
#---------------#

# The break statement on the contrary terminates the loop all together and no subsequent iterations are performed.

# Example illustrating 'NEXT': 
nums <- seq(1:10)
for (i in nums) {
  # Here in the below condition, we are attempting to break if the number is found to be 2 or 6
  # However, it will exit to loop at the occurrence of 2 itself and subsequent steps (involving other numbers) are not executed
  # In other words the check for i being 6 will not be reached as the loop is broken after 2 itself
  if ((i == 2) || (i == 6)) {
    break
  }
  print(i)  # This will only print one value i.e., 1
}

#------------------------------------------------------------------------------#
# 7.write a program to print a given vector in reverse format
#   x= c(1,5.6,3,10,3.5,5)
#------------------------------------------------------------------------------#

# Using for loop
x= c(1,5.6,3,10,3.5,5)
len_x = length(x);
for (val in len_x:1){ # Checking and printing form last element (indicative by length) up-to first element
  print(x[val])
}

# Using while loop
x= c(1,5.6,3,10,3.5,5)
len_x = length(x);
while (len_x >= 1) {  # Checking if the condition of length of x meets in order to continue with the below steps
  print(x[len_x]);    # Printing from last element first i.e., x[len_x] being 6 until it becomes 1
  len_x = len_x - 1;  # Decremented the counter to ensure printing in reverse order and also avoids going in infinite loop.
}

# Using repeat loop
x= c(1,5.6,3,10,3.5,5)
len_x = length(x);
repeat {              # This block will repeat as loop until it breaks(using "break") if a condition matches within the block
  print(x[len_x])
  len_x <- len_x - 1  # Decremented the counter to ensure printing in reverse order and also avoids going in infinite loop.
  
  if(len_x < 1) {
    break
  }
}

#------------------------------------------------------------------------------#
# 8.write a program to get the mode value of the given vector (‘a’,’b’,’c’,’t’,’a’,’c’,’r’,’a’,’c’,’t’,’z’,’r’,’v’,’t’,’u’,’e’,’t’)
#------------------------------------------------------------------------------#

library(modeest)
str_vec = c('a','b','c','t','a','c','r','a','c','t','z','r','v','t','u','e','t');
mlv(str_vec, method = "mfv") # This will give the result as 't'

#------------------------------------------------------------------------------#
# 9.Write a function to filter only data belongs to ‘setosa’ in species of Iris dataset.( using dplyr package) 
#------------------------------------------------------------------------------#

library(dplyr)
data("iris")
attach(iris)
fun_setosa = filter(iris , Species=="setosa") # Created a function 'fun_setosa' that will filter data belonging to 'setosa'
fun_setosa


#------------------------------------------------------------------------------#
# 10.Create a new column for iris dataset with the name of Means_of_obs, which contains mean value of each row.( using dplyr package)
#------------------------------------------------------------------------------#

library(dplyr)

data("iris")
attach(iris)
fun_Add_Means_Column <- iris %>%
  group_by(Species) %>% 
  mutate(Means_of_obs = (Sepal.Length + Sepal.Width + Petal.Length + Petal.Width)/4)
fun_Add_Means_Column




#------------------------------------------------------------------------------#
# 11.Filter data for the “versicolor” and get only ‘sepel_length’ and Sepel _width’ columns.( using dplyr package)
#------------------------------------------------------------------------------#


library(dplyr)
data("iris")
attach(iris)
fun_versicolor = filter(select(iris,Sepal.Length,Sepal.Width) , Species=="versicolor") # Created a function 'fun_versicolor' that will filter data belonging to 'versicolor'
fun_versicolor


#------------------------------------------------------------------------------#
# 12.create below plots for the mtcars also write your inferences for each 
#    and every plot (use ggplot package) Use Different ( Size , Colour )
#------------------------------------------------------------------------------#

#------------------------------------------------------------------------------#
# scatter plot
#------------------------------------------------------------------------------#

library(ggplot2)  # Choosing the library

data(mtcars)      # Selecting the mtcars library

attach(mtcars)    # Now we can call the columns directly

# Basic Scatter Plot
BasicScatterPlot<-ggplot(mtcars, aes(x=wt, y=mpg, color=cyl)) + geom_point()
BasicScatterPlot


# Scatter Plot by changing the color and the scatter points based on the cylinders i.e., 4, 6 and 8, colors selected automatically
ScatterPlot <- BasicScatterPlot + geom_point(aes(color = cyl, shape = cyl)) 
ScatterPlot

# Here in the below code we are selecting the 3 color codes for the cylinders i.e., 4, 6 and 8 manually as Red, Green and blue respectively based on the RGB hex codes
ScatterPlot <- BasicScatterPlot + geom_point(aes(color = cyl, shape = cyl)) +
  scale_color_manual(values = c("#FF0000", "#00FF00", "#0000FF"))+
  theme_minimal()
ScatterPlot

# In order to get the regression line only 
ScatterPlot <- ggplot(mtcars, aes(x=wt, y=mpg, color=cyl)) + geom_smooth(method = lm)
ScatterPlot

# Getting regression line as well as points
ScatterPlot <- ggplot(mtcars, aes(x=wt, y=mpg, color=cyl)) + geom_point() +  geom_smooth(method = lm, se = FALSE)
ScatterPlot

# Using loess method: local regression fitting
ScatterPlot <- ggplot(mtcars, aes(x=wt, y=mpg, color=cyl)) + geom_point() + geom_smooth(method="loess", color="black", se=FALSE)
ScatterPlot

# Command to get the factors for the 'cyl' column in mtcars
CylFactors <- factor(mtcars$cyl)
CylFactors

# Some minor changes to change the points and shapes by grouping based on cylinder
ScatterPlot <- ggplot(mtcars, aes(x=wt, y=mpg)) +
  geom_point(size=3, aes(color=factor(cyl), shape=factor(cyl))) +
  geom_smooth(method="lm", aes(color=factor(cyl), fill=factor(cyl)))
ScatterPlot 

# SCATTER PLOT BETWEEN WEIGHT(wt) AND MILES PER GALLON(mpg)
# Finally adding the local regression along with the changes done earlier to show the final result
# INFERENCE: Based on the graph we can see that there is a negative correlation between weight(wt) and miles per gallon (mpg) i.e. as the wt increases the miles per gallon (mpg) decreases.

ScatterPlot <- ggplot(mtcars, aes(x=wt, y=mpg)) + 
  geom_point(size=3, aes(color=factor(cyl), shape=factor(cyl))) + 
  geom_smooth(method="loess", color="black", se=FALSE) +
  geom_smooth(method="lm", aes(color=factor(cyl), fill=factor(cyl))) +
  ggtitle("Miles per Gallon(mpg) by Weight(wt)")

ScatterPlot

# SCATTER PLOT BETWEEN DISPLACEMNET(disp) AND MILES PER GALLON(mpg)
# INFERENCE: Based on the graph we can see that there is a negative correlation between displacement(disp) and miles per gallon (mpg) i.e. as the displacement increases the miles per gallon (mpg) decreases.
ScatterPlot <- ggplot(mtcars, aes(x=disp, y=mpg)) + 
  geom_point(size=3, aes(color=factor(cyl), shape=factor(cyl))) + 
  geom_smooth(method="loess", color="black", se=FALSE) +
  geom_smooth(method="lm", aes(color=factor(cyl), fill=factor(cyl))) +
  ggtitle("Miles per Gallon(mpg) by Displacement(disp)")

ScatterPlot

# SCATTER PLOT BETWEEN HORSEPOWER(hp) AND MILES PER GALLON(mpg)
# INFERENCE: Based on the graph we can see that there is a negative correlation between horsepower(hp) and miles per gallon (mpg) i.e. as the horsepower increases the miles per gallon (mpg) decreases.

ScatterPlot <- ggplot(mtcars, aes(x=hp, y=mpg)) + 
  geom_point(size=3, aes(color=factor(cyl), shape=factor(cyl))) + 
  geom_smooth(method="loess", color="black", se=FALSE) +
  geom_smooth(method="lm", aes(color=factor(cyl), fill=factor(cyl))) +
  ggtitle("Miles per Gallon(mpg) by Horsepower(hp)")

ScatterPlot



#------------------------------------------------------------------------------#
# boxplot
#------------------------------------------------------------------------------#

library(ggplot2)  # Choosing the library

data(mtcars)      # Selecting the mtcars library

attach(mtcars)    # Now we can call the columns directly

# Basic Boxplot for mtcars miles per gallon(mpg) and cylinders(cyl)
Boxplot <- ggplot(mtcars, aes(x=cyl, y=mpg)) + geom_boxplot()
Boxplot

# Grouping based on factors of cylinder(cyl)
Boxplot <- ggplot(mtcars, aes(x=factor(cyl), y=mpg)) + geom_boxplot()
Boxplot

# Boxplot for mtcars with colors (Getting unique colors using factor)
Boxplot <- ggplot(mtcars, aes(x=factor(cyl), y=mpg, color=factor(cyl))) + geom_boxplot()
Boxplot

# Boxplot for mtcars with colors (Getting unique colors using factor)
Boxplot <- ggplot(mtcars, aes(x=factor(cyl), y=mpg)) + geom_boxplot(color="red", fill="green")
Boxplot

# Boxplot of mpg and factors of cylinders - Consolidating the above changes with automated colors
Boxplot <- ggplot(mtcars, aes(x=factor(cyl), y=mpg, fill=factor(cyl))) + geom_boxplot() + ggtitle("MPG by Cylinder Type")
Boxplot


# Boxplot of mpg by factors of transmission - Consolidating the above changes with automated colors
# Inference - The distribution of mpg is almost normal
#           - The Outliers are not skewing the data
Boxplot <- ggplot(mtcars, aes(x=factor(am), y=mpg, fill=factor(am))) + geom_boxplot() + ggtitle("MPG by Transmission Type")
Boxplot

# Boxplot of mpg by factors of transmission and cylinders(cyl)
# Inference - For higher cylinders i.e., 8, the miles per gallon(mpg) is low but for lower cylinders the miles per gallon is much higher
# This is the same for both Automatic as well as Manual transmission types
Boxplot <- ggplot(mtcars, aes(x=factor(am), y=mpg, fill=factor(am))) + geom_boxplot() + facet_grid(~cyl) + ggtitle("MPG by Transmission Type")
Boxplot

# Boxplot of mpg by factors of transmission and V or Straight line type engine(vs)
# Inference - The miles per gallon(mpg) is higher when vs value is 1 for both Automatic as well as Manual transmission types
Boxplot <- ggplot(mtcars, aes(x=factor(am), y=mpg, fill=factor(am))) + geom_boxplot() + facet_grid(~vs) + ggtitle("MPG by Transmission Type")
Boxplot


# Boxplot of mpg by factors of transmission and Carburetors(carb)
# Inference -  The miles per gallon(mpg) is the best when Carburetors are either 1 or 2  for both Automatic as well as Manual transmission types
Boxplot <- ggplot(mtcars, aes(x=factor(am), y=mpg, fill=factor(am))) + geom_boxplot() + facet_grid(~carb) + ggtitle("MPG by Transmission Type")
Boxplot


# Box plot of mpg and factors of gear - Consolidating the above changes with automated colors
# Inference - The miles per gallon is best when gears are 4
Boxplot <- ggplot(mtcars, aes(x=factor(gear), y=mpg, fill=factor(gear))) + geom_boxplot() + ggtitle("MPG by gear Type")
Boxplot


#------------------------------------------------------------------------------#
# histogram
#------------------------------------------------------------------------------#

library(ggplot2)  # Choosing the library

data(mtcars)      # Selecting the mtcars library

# Basic histogram
# Based on miles per gallon(mpg)
HistogramPlot <- ggplot(mtcars, aes(x = mpg)) + geom_histogram()
HistogramPlot
# Based on cylinders(cyl)
HistogramPlot <- ggplot(mtcars, aes(x = cyl)) + geom_histogram()
HistogramPlot
# Based on transmission(am)
HistogramPlot <- ggplot(mtcars, aes(x = am)) + geom_histogram()
HistogramPlot

# Histogram on miles per gallon(mpg) - Adding color to the histogram
HistogramPlot <- ggplot(mtcars, aes(x = mpg)) + geom_histogram(binwidth=1, aes(fill="#377EB8"))
HistogramPlot

# Histogram on miles per gallon(mpg) - Adding color to the histogram and changing the y-axis name to density
HistogramPlot <- ggplot(mtcars, aes(x = mpg)) + geom_histogram(binwidth=1, aes(y=..density..,fill="#377EB8"))
HistogramPlot

# Histogram on cylinders(cyl) - Adding color to the histogram and changing the y-axis name to density
# Inference - 8 cylinders have the highest density or volume, followed by 4 cylinder vehicles
HistogramPlot <- ggplot(mtcars, aes(x = cyl)) + geom_histogram(binwidth=1, aes(y=..density..,fill="#377EB8")) 
HistogramPlot


#------------------------------------------------------------------------------#
# line graph
#------------------------------------------------------------------------------#

library(ggplot2)  # Choosing the library

data(mtcars)      # Selecting the mtcars library

# Basic Line Plot
BasicLinePlot<-ggplot(mtcars, aes(x=wt, y=mpg)) + geom_line()
BasicLinePlot

# Basic Line Plot with line color red
BasicLinePlot<-ggplot(mtcars, aes(x=wt, y=mpg, colour = "red")) + geom_line()
BasicLinePlot

# Dotted and dash line
LinePlot <- ggplot(mtcars, aes(x=wt, y=mpg)) + geom_line(linetype = 2) + geom_line(linetype = "dotdash")
LinePlot

LinePlot <- ggplot(mtcars, aes(x=wt, y=mpg)) + geom_line(linetype = 2) + geom_line(linetype = "3313")
LinePlot

# Line Plot on miles per gallon(mpg) by weight(wt) based on color variation on weight
LinePlot<-ggplot(mtcars, aes(x=wt, y=mpg, color=cyl)) + geom_line()
LinePlot

# Line Plot on miles per gallon(mpg) by displacement(disp) based on color variation on weight
LinePlot<-ggplot(mtcars, aes(x=disp, y=mpg, color=am)) + geom_line()
LinePlot


#------------------------------------------------------------------------------#
# bar graph
#------------------------------------------------------------------------------#

library(ggplot2)  # Choosing the library

data(mtcars)      # Selecting the mtcars library

# Basic Bar Plot
BarPlot <- ggplot(mtcars, aes(x = cyl)) + geom_bar()
BarPlot

# Bar Plot factoring based on the number of cylinders (cyl)
BarPlot <- ggplot(mtcars, aes(factor(cyl))) + geom_bar()
BarPlot

# Bar Plot factoring based on the number of cylinders (cyl)
# Adding fill color as red
BarPlot <- ggplot(mtcars, aes(factor(cyl))) + geom_bar(fill = "darkgreen")
BarPlot

# Adding color to the bars borders as blue and fill as light blue
BarPlot <- ggplot(mtcars, aes(factor(cyl))) + geom_bar(fill = "lightblue", color = "blue")
BarPlot

# If we do not mention the color both the border colour and fill will take the same RGB hexadecimal value.
BarPlot <- ggplot(mtcars, aes(factor(cyl))) + geom_bar(fill = "#00ccff")
BarPlot

# Giving tansparent fill but borders having color of blue based on RGB hexadecimal value
BarPlot <- ggplot(mtcars, aes(factor(cyl))) + geom_bar(fill = NA, colour = "#00abff")
BarPlot

# Here we are factoring the v line or straight line engine type based the number of cylinders
BarPlot <- ggplot(mtcars, aes(factor(cyl), fill = factor(vs))) + geom_bar()
BarPlot

# Here we are factoring the transmission type (manual or automated transmission) based the number of cylinders
# Inference - We can see that 8 cylinders vehicles are the most and within them automated transmission vehicles are the most (80-90%) of total vehicles in that category
#             Similarly, for 4 cylinders vehicles, the maximum are for manual transmission ~70% of the total and the remaining are automated transmission
BarPlot <- ggplot(mtcars, aes(factor(cyl), fill = factor(am))) + geom_bar()
BarPlot
