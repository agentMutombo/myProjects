# Load libraries
library(ggplot2)

# Read data
predictions_train <- read.csv("C:/Users/User/Desktop/project/bioinformatics project/predictions_train.csv")

# Plot
plt <- ggplot(predictions_train, aes(x = Model, y = Time.Taken)) +
    geom_segment(aes(xend = reorder(Model, Time.Taken), yend = 0), color = "#58508d") +
    geom_point(color = "#58508d", size = 4, alpha = 0.8) +
    theme_light() +
    coord_flip() +
    theme(
        panel.grid.major.y = element_blank(),
        panel.border = element_blank(),
        axis.ticks.y = element_blank(),
        text = element_text(family = "Helvetica", face = "bold"),
        plot.title = element_text(face = "bold", size = 16, hjust = 0.5)  # Set hjust = 0.5 for center alignment
    ) +
    scale_y_continuous(limits = c(0, 5)) +
    xlab("Models") +
    labs(title = "Model Performance", x = "Models", y = "Time.Taken")  # Set x and y axis labels

print(plt)

# Save as PDF
ggsave(
    "C:/Users/User/Desktop/project/bioinformatics project/plots/Results R/Bar_plot_of_calculation_time.pdf",
    plt,
    width = 8.27,
    height = 10,
    units = "in",
    device = "pdf"
)
