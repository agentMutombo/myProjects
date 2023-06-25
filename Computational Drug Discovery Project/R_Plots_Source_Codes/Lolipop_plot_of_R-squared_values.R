# Load libraries
library(ggplot2)

# Read data
predictions_train <- read.csv("C:/Users/User/Desktop/project/bioinformatics project/predictions_train.csv")

# Plot
plt <- ggplot(predictions_train, aes(x = reorder(Model, R.Squared), y = R.Squared)) +
    geom_segment(aes(xend = reorder(Model, R.Squared), yend = 0), color = "skyblue") +
    geom_point(color = "blue", size = 4, alpha = 0.7) +
    theme_light() +
    coord_flip() +
    theme(
        panel.grid.major.y = element_blank(),
        panel.border = element_blank(),
        axis.ticks.y = element_blank(),
        text = element_text(family = "Helvetica", face = "bold"),
        plot.title = element_text(face = "bold", size = 16, hjust = 0.5)  # Set hjust = 0.5 for center alignment
    ) +
    scale_y_continuous(limits = c(0, 1)) +
    xlab("Models") +
    labs(title = "Model Performance", x = "Models", y = "R.Squared")  # Set x and y axis labels

print(plt)

# Save as PDF
ggsave(
    "C:/Users/User/Desktop/project/bioinformatics project/plots/Results R/Bar_plot_of_R-squared_values.pdf",
    plt,
    width = 8.27,
    height = 10,
    units = "in",
    device = "pdf"
)
