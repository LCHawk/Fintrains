trains_n_all_stations <- function(station,saapuneet,saapuvat,lahteneet,lahtevat,
                              ohittavat = F){
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
  j <- 2
  l <- stationdata[[1]]$timeTableRows
  while(j<length(stationdata)){
    b <- stationdata[[j]]$timeTableRows
    l <- c(l,b)
    j=j+1
  }
   
  k <- 2
  stations <- l[[1]]$stationShortCode
  while(k<length(l)){
    q <- l[[k]]$stationShortCode
    stations <-c(stations,q)
    k = k + 1
  }
  
  stations <- unique(stations)
  return(c(trainNumbers,stations))
}




trains_n_stations("HKI",5,5,5,5)

i<-c(1:lengths(stations))