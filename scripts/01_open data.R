install.packages("janitor")
install.packages("knitr")
install.packages("lubridate")
install.packages("opendatatoronto")
install.packages("tidyverse")
library("opendatatoronto")
library("janitor")
library("knitr")
library("lubridate")
library("tidyverse")
 

Active_Permits <- list_package_resources("108c2bd1-6945-46f6-af92-02f5658ee7f7")
Active_Permits

traffic <- list_package_resources("traffic-volumes-at-intersections-for-all-modes")
traffic

#### Acquire ####
toronto_traffic <-
  list_package_resources("traffic-volumes-at-intersections-for-all-modes") |>
  filter(name == "raw-data-2020-2029") |>
  get_resource()

write_csv(
  x = toronto_traffic,
  file = "toronto_traffic.csv"
)

head(toronto_traffic)

toronto_traffic_10 <-
  list_package_resources("traffic-volumes-at-intersections-for-all-modes") |>
  filter(name == "raw-data-2010-2019.csv") |>
  get_resource()

write_csv(
  x = toronto_traffic_10,
  file = "toronto_traffic_10.csv"
)

head(toronto_traffic_10)