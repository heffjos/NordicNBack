library(dplyr)

data <- read.csv("./Design.csv", as.is=T)

# assign rest trials to ZeroBack or TwoBack
RestLoc <- which(data$Trial == "Rest")
PrevLoc <- RestLoc - 1
data$Trial[RestLoc] <- data$Trial[PrevLoc]
data$Block[RestLoc] <- data$Block[PrevLoc]

# replace Proc
data$Proc[grepl("twoback|zeroback", data$Proc)] <- "TrialProc"
data$Proc[grepl("rest", data$Proc)] <- "Rest"

# add Introduction for each block
AddIntro <- function(df) {
  df <- rbind(df[1, ], df)
  df$Proc[1] <- "Introduction"
  df$Letter[1] <- NA
  df
}
  
data <- data %>%
  group_by(Block) %>%
  do(AddIntro(.)) %>%
  ungroup()

# let's correct trial numbers
data$TrialNum <- NA
for (i in 1:2) {
    TrialLoc <- data$Proc == "TrialProc" & data$Run == i
    NumTrials <- sum(TrialLoc)
    data$TrialNum[TrialLoc] = 1:NumTrials
}

# let's add intruduction image
data <- data %>%
  mutate(IntroSlide=ifelse(Trial == "ZeroBack", 
    "Images/Instructions0Back.bmp", "Images/Instructions2Back.bmp"))

data <- data %>%
  select(-Duration) %>%
  mutate(Respond=ifelse(Respond == 1, "6", "")) 

write.csv(data, file="EprimeDesign.csv", row.names=F, quote=F)
