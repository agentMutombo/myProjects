#load Library
library(ggplot2)

my_theme <- theme(
    text = element_text(family = "Helvetica"),
    plot.title = element_text(face = "bold", size = 16),
    axis.title = element_text(family = "Helvetica", size = 12, face = "bold"),
    axis.text = element_text(family = "Helvetica", size = 10)
)

plt <- ggplot(df_2class, aes(x=bioactivity_class, fill=as.factor(bioactivity_class) )) +  
    geom_bar( ) +
    scale_fill_manual(values = c("#b5601b", "#2c5696") ) +
    theme(legend.position="none") +
    my_theme +
    labs(x = "Bioactivity class", y = "Frequency") +
    ggtitle(bquote(bold("Bioactivity Class"))) +
    theme(plot.title = element_text(face = "bold", size = 16, hjust = 0.5))

# Save the plot as a PDF file
ggsave(
    filename = "C:/Users/User/Desktop/project/bioinformatics project/plots/Results R/plot_bioactivity_class.pdf",
    plot = plt,
    width = 5.5,
    height = 5.5
)