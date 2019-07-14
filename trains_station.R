#functions which get information from specific station. 
#Station must give using station codes

library(rjson)

#all trains
trains <- function(station){
  firstpart <- "https://rata.digitraffic.fi/api/v1/live-trains/station/"
  url <- paste0(firstpart,station)
  stationdata <- fromJSON(readLines(url))
  trainNumbers <- c(1:length(stationdata))
  for(i in 1:length(stationdata)){
    trainNumbers[i] <- stationdata[[i]]$trainNumber
  }
  return(trainNumbers)
}

#Trains with time limit
trains_time_limit <- function(station,min_bef_dep,min_aft_dep,min_bef_arr,min_aft_arr){
  firstpart <- "https://rata.digitraffic.fi/api/v1/live-trains/station/"
  url <- paste0(firstpart,station)
  url <- paste0(url,"?minutes_before_departure=",min_bef_dep,"&minutes_after_departure=",
              min_aft_dep,"&minutes_after_arrival=",min_bef_arr,
              "&minutes_after_arrival=",min_aft_arr)
  stationdata <- fromJSON(readLines(url))
  trainNumbers <- c(1:length(stationdata))
  for(i in 1:length(stationdata)){
    trainNumbers[i] <- stationdata[[i]]$trainNumber
  }
  return(trainNumbers)
}

trains_n <- function(station,saapuneet,saapuvat,lahteneet,lahtevat,ohittavat = F){
  firstpart <- "https://rata.digitraffic.fi/api/v1/live-trains/station/"
  arrived <- "?arrived_trains="
  arriving <- "&arriving_trains="
  departed <- "&departed_trains="
  departing <- "&departing_trains="
  nonstop <- "&include_nonstopping="
  url<-paste0(firstpart,station,arrived,saapuneet,arriving,saapuvat,departed,lahteneet,
              departing,lahtevat,nonstop,ohittavat)
  stationdata <- fromJSON(readLines(url))
  trainNumbers <- c(1:length(stationdata))
  for(i in 1:length(stationdata)){
    trainNumbers[i] <- stationdata[[i]]$trainNumber
  }
  return(trainNumbers)
}

