# Required libraries
library(palmerpenguins)
library(tidyverse)

##############################################################################
# Look at your data
data(penguins) # one off
penguins
View(penguins)

##############################################################################
# Univariate flippers

## Attempt 1
flipper_hist <- ggplot(data = penguins, aes(x = flipper_length_mm)) +
  geom_histogram(aes(fill = species), alpha = 0.5, colour = "black", position = "identity") +
  labs(x = "Flipper length (mm)", y = "Frequency")
flipper_hist

## Attempt 2
flipper_density <- ggplot(data = penguins, aes(x = flipper_length_mm)) +
  geom_density(aes(fill = species), alpha = 0.5) +
  theme_minimal() +
  labs(x = "Flipper length (mm)", y = "Frequency")
flipper_density

##############################################################################
# Penguin mass vs. flipper length

# This time we are going to plot the flipper length (on the x axis) against the body mass (on the y axis):

## Attempt 1
ggplot(data = penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point()
# very basic - can we see the different penguins in the mix?

## Attempt 2
ggplot(data = penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(aes(color = species))
# note the bad axis labels

## Attempt 3
ggplot(data = penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(aes(color = species, shape = species), alpha = 0.8, size = 3)

## Attempt 4
ggplot(data = penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(aes(color = species, shape = species), alpha = 0.8, size = 3) +
  labs(x = "Flipper length (mm)", y = ?,
     color = "Penguin species", shape = ?)

## Attempt 5
ggplot(data = penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(aes(color = species, shape = species), alpha = 0.8, size = 3) +
  labs(?) +
  theme(legend.position = c(0.9, 0.2),
        legend.background = element_rect(fill = "white", color = NA))

## Attempt 6
ggplot(?) +
  geom_point(?) +
  labs(?) +
  theme_classic() +
  theme(?)

# save your graph
ggsave("flipper.pdf")

##############################################################################
# Bill length vs. depth
# Using the penguin data, plot bill length (on the x axis) against bill depth (on the y axis)

## Attempt 1
bill_anatomy <- ggplot(data = ?, aes(x = ?, y = ?, group = species)) +
  geom_point(aes(color = species, shape = species), size = 3, alpha = 0.8)

bill_anatomy

## Attempt 2
# We are going to add  regression lines (one per species)
bill_anatomy <- bill_anatomy + geom_smooth(aes(color = ?), method = "lm")
bill_anatomy

## Attempt 3
bill_anatomy <- bill_anatomy + theme_classic() +
  labs(?) +
  theme(legend.position = c(0.85, 0.15),
        legend.background = element_rect(fill = "white", color = NA))
bill_anatomy

## Simple ANOVA
# Let's examine the effect of bill length, penguin species and their interaction
# on bill depth using a statistical method called as ANOVA
# the A * B notation means that the ANOVA looks at A, B and the A:B interaction
# the scope argument removes each (represented by .) term from the model to explore
# its influence on the R^2. The test argument carries out an F test on this.

model <- aov(bill_depth_mm ~ bill_length_mm * species, data = penguins)
drop1(model, scope = ~., test = "F")

##############################################################################
# Flipper length by species
# Here we want species organised along the x axis and flipper length represented by the y axis:
flipper_box <- ggplot(data = ?, aes(x = ?, y = ?)) +
  geom_boxplot(aes(color = species), width = 0.3, show.legend = FALSE) +
  geom_jitter(aes(color = species), alpha = 0.5, show.legend = FALSE, position = position_jitter(width = 0.2, seed = 0)) +
  theme_classic() +
  labs(?)

flipper_box

##############################################################################
# FINAL TASK
# Your task here is to prepare a scatter plot of body mass (x axis) against bill length (y axis).
# Use the colour of points to differentiate penguin species.
# Add a regression line to your plot.
# When you've done this add the following code:
+ facet_wrap(~island)

# Hey let's save your pretty graph as a PNG
ggsave("island_plots.png", width = 12, height = 6)


# secret code for final task
ggplot(penguins, aes(x = body_mass_g, y = bill_length_mm)) +
  geom_point(aes(color = species)) +
  geom_smooth(colour="black", method="lm") + 
  labs(x = "Body mass (g)", y = "Bill length (mm)", color = "Penguin species") +
  theme(legend.position = "bottom",
        legend.background = element_rect(fill = "white", color = NA)) +
  facet_wrap(~island)

## dead darling
scale_fill_manual(values = c("darkorange","purple","cyan4"))