#Load Libraries
library(ggplot2)
library(ggstatsplot)
library(tidyverse)

df_2class <- read.csv("C:/Users/User/Downloads/df_2class.csv")

plt <- ggstatsplot::ggbetweenstats(
    data = df_2class,
    x = "bioactivity_class", #<---Replace with x axis Variable
    y = "NumHAcceptors",        #<---Replace with y axis Variable
    mean.color = "black",
    fill = "bioactivity_class"  # Assigning fill aesthetic to bioactivity_class
)

plt <- plt +
    labs(
        x = "Bioactivity Class",  #<---Replace with x axis label
        y = "NumHAcceptors",          #<---Replace with y axis label
        title = "Distribution of NumHAcceptors values"
    ) +
    ggplot2::scale_color_manual(values = c("#b5601b", "#2c5696"))+
    theme(
        text = element_text(family = "Helvetica", size = 8, color = "black"),
        plot.title = element_text(
            family = "Helvetica",
            size = 20,
            face = "bold",
            color = "#2a475e"
        ),
        plot.subtitle = element_text(
            family = "Helvetica",
            size = 15,
            face = "bold",
            color = "#1b2838"
        ),
        plot.title.position = "plot",
        axis.text = element_text(size = 10, color = "black"),
        axis.title = element_text(size = 12),
        legend.position = "none"  # Removing the legend
    )

plt <- plt +
    theme(
        axis.ticks = element_blank(),
        axis.line = element_line(colour = "grey50"),
        panel.grid = element_line(color = "#b4aea9"),
        panel.grid.minor = element_blank(),
        panel.grid.major.x = element_blank(),
        panel.grid.major.y = element_line(linetype = "dashed"),
        panel.background = element_rect(fill = "#fbf9f4", color = "#fbf9f4"),
        plot.background = element_rect(fill = "#fbf9f4", color = "#fbf9f4")
    )


# Show the plot
print(plt)

# Set the file path where the PDF file will be saved
file_path <- "C:/Users/User/Desktop/project/bioinformatics project/plots/Results R/Rplot_NumHAcceptors.pdf"

# Save the plot as a PDF file
ggsave(
    filename = file_path,
    plot = plt,
    width = 8,
    device = "pdf"
)
