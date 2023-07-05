# Import the necessary library (or libraries)

readin_data <- function(){
  
  # MT- I used `require()` instead of `library()` so the code
  # would only load tidyverse if it hasn't already been loaded 
  # when the function is run.
  require(tidyverse)
  
  # Read in and assign a name to the dataset
  dtfm <- read_csv(here::here("Data", "FY22 Historical Reservations Full_camp0626_0806.csv"))
  
  # Place some data clean up functions here
  # Create a factor variable
  dtfm %>% count(agency)
  
  dtfm <- dtfm %>% 
    mutate(agency_f = factor(agency, 
                             levels = c("USFS", "NPS", "USACE", 
                                        "BLM", "BOR", "FWS", "Presidio Trust",
                                        "BAH")))
  
  # Create a date variable
  ## MT- technically read_csv got the startdate variable 
  ## read in as a datetime but I wanted it to just be a 
  ## date so I used lubridate's `ymd` ("year month day") to 
  ## read in the dates.
  dtfm <- dtfm %>% 
    mutate(startdate_d = lubridate::ymd(startdate))
  
  return(dtfm)
  
}
