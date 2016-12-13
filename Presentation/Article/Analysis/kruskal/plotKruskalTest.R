install.packages("ggplot2")
library(ggplot2)

#Read random sampled files
randomROAASample <- read.csv("C:/MastersThesisProject/Data/randomSample_ROAA_percentWOBGroup.csv")
randomROAESample <- read.csv("C:/MastersThesisProject/Data/randomSample_ROAE_percentWOBGroup.csv")

#ROAA
group0 <- subset(randomROAASample, randomROAASample$percentWOBGroup == 0)
group1 <- subset(randomROAASample, randomROAASample$percentWOBGroup == 1)
mean0 <- mean(group0$ROAA)
mean1 <- mean(group1$ROAA)
Average.ROAA <- c(mean0, mean1)
percentWOBGroup.Levels <- c("Group 0", "Group 1")
Legend.Label <- c("Group 0: Less than the average of percentWOB from sample", "Group 1: Greater than the average of percentWOB from sample")

avgROAADF <- data.frame(Legend.Label, percentWOBGroup.Levels, Average.ROAA)


ggplot(data=avgROAADF, aes(x=percentWOBGroup.Levels, y=Average.ROAA, fill=Legend.Label, group=1)) +
  geom_bar(stat="identity", colour="black", width=.2) +
  scale_fill_hue(name="percentWOBGroup ") +  # Set legend title
  geom_line(colour="red", linetype="dashed", size=1.5) +
  geom_point(colour="red", size=4, shape=21, fill="white") +
  scale_y_continuous(limits = c(0, 10)) +
  xlab("percentWOBGroup Levels") + ylab("Average ROAA (in percent)") + # Set axis labels
  ggtitle("Average ROAA of 30 randomly selected firms from sample in \nGroup 0 and Group 1 percentWOBGroup levels") +     # Set title
  theme_bw()



#ROAE
group0 <- subset(randomROAESample, randomROAESample$percentWOBGroup == 0)
group1 <- subset(randomROAESample, randomROAESample$percentWOBGroup == 1)
mean0 <- mean(group0$ROAE)
mean1 <- mean(group1$ROAE)
Average.ROAE <- c(mean0, mean1)
percentWOBGroup.Levels <- c("Group 0", "Group 1")
Legend.Label <- c("Group 0: Less than the average of percentWOB from sample", "Group 1: Greater than the average of percentWOB from sample")

avgROAEDF <- data.frame(Legend.Label, percentWOBGroup.Levels, Average.ROAE)


ggplot(data=avgROAEDF, aes(x=percentWOBGroup.Levels, y=Average.ROAE, fill=Legend.Label, group=1)) +
  geom_bar(stat="identity", colour="black", width=.2) +
  scale_fill_hue(name="percentWOBGroup") +  # Set legend title
  geom_line(colour="red", linetype="dashed", size=1.5) +
  geom_point(colour="red", size=4, shape=21, fill="white") +
  scale_y_continuous(limits = c(0, 20)) +
  xlab("percentWOBGroup Levels") + ylab("Average ROAE (in percent)") + # Set axis labels
  ggtitle("Average ROAE of 30 randomly selected firms from sample in \nGroup 0 and Group 1 percentWOBGroup levels") +     # Set title
  theme_bw()