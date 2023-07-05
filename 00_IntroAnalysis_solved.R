# Import your data read in function
source(here::here("helper_functions", "readin_data_solved.R"))

# Assign a name to your variable in the Global environment
# (The environment of this script)
test <- readin_data()

# Create a histogram or bar chart of one of the variables
ggplot(test, aes(x = startdate_d)) +
  geom_histogram()
