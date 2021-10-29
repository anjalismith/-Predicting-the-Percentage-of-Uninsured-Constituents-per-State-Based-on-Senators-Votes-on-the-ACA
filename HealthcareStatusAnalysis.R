#Analyzing the correlation between Senators that support the ACA with their constituents' health insurance coverage status

if (!require("pacman")) install.packages("pacman")
pacman::p_load(pacman, rio) 


#Import the data
df <- import("~/Desktop/BRFSS_Prevalence_And_Trends_Data__Health_Care_Access_Coverage_for_2011.csv")
votes <- import("~/Desktop/congress_votes_111-2009_s396.csv")
head(votes)

#Iterating through the data to find states with percentage values that do not total 100
which((df$Yes + df$No) > 100)
df$TheSum = df$Yes + df$No
df$TheSum


#Limit analysis to one question
df1 = df[df$Condition == "Do you have any kind of health care coverage?", ]


#Add a column in the Votes Data Frame that indicates the vote status of each state's senators as a numeric value with -1 equal to a "nay" vote and +1 equal to a "Yea" vote.  
colnames(votes) = c("Person", "State", "V3", "Vote", "Senator", "Party")
votes$VoteNum = 0
votes$VoteNum[votes$Vote == "Yea"] = 1
votes$VoteNum[votes$Vote == "Nay"] = -1
voteSum = tapply(votes$VoteNum, votes$State, sum)
voteSumDf = data.frame(voteSum)
voteSumDf$State = rownames(voteSumDf)
rownames(voteSumDf) = (1:nrow(voteSumDf)) 

#Merge votes and df1 data 
df2 = merge(df1, voteSumDf, by = "State", all = FALSE)
df2$status = "A Senator Obstained"
df2$status[df2$voteSum == -2] = "Both Senators Against ACA"
df2$status[df2$voteSum == 2] = "Both Senators in Favor of ACA"
df2$status[df2$voteSum == 0] = "Both Senators Have Opposing Views of ACA"


#Bar plot
barplot(df2$No, main = "Percentage of Consituents without Healthcare by State in 2011", names.arg=df2$State, ylab = "Percentage of Constituents without Healthcare", las=2,
        legend = unique(df2$status), col=df2$colBar, xlim = c(0, 45))

#ggplot version
library(ggplot2)
df2 <- transform(df2, State = reorder(State, -No))
graph = ggplot(data=df2, aes(x=State, y=No, fill=status)) +
  geom_bar(stat="identity") +  xlab("State") + ylab("Percentage of Constituents Without Healthcare") +
  ggtitle("Percentage of Constituents Without Healthcare by State in 2011") 
graph + theme(axis.text.x = element_text(angle = 90)) + 
  labs(fill = "Senators' Vote on the Affordable Care Act by State")

#Regression Coefficient - Analyzing the correlation between df2$voteSum and df2$No - specifically, the correlation between the voting decisions of senators and the percentage of their constituents that are uninsured
f = lm(No ~ voteSum,data=df2)
summary(f)
#This graph shows the relationship that the votes each state's senators has with the fitted values of the percentage of constituents that are uninsured
plot(f[['fitted.values']],df2$No, xlab = "Fitted Values", ylab = "Actual Values", main = "The Relationship Between Fitted Percentages of Constituents Without Healthcare With the Votes of Their Respective Senators", cex.main=0.95)
abline(lm(df2$No ~f[['fitted.values']] , data = df2), col = "blue")

#Check the two questions that were asked
unique(df$Condition)

#Calculated a slope of -1.4210 & constant of 17.9968; there is a significant statistical difference between the percentage of uninsured constituents in states whose senators both support the ACA and states in which both senators opposed its passage.

