# Load libraries
library(ggplot2)
library(ggExtra)

df_2class <- read.csv("C:/Users/User/Downloads/df_2class.csv")

# Set Helvetica as the global font family
theme_set(theme_bw(base_family = "Helvetica"))

# classic plot:
p <- ggplot(df_2class, aes(x = MW, y = LogP, color = bioactivity_class, size = pIC50)) +
    geom_point(alpha = 0.7, pch = 16) +
    ggtitle(bquote(bold("Comparison of Chemical Spaces"))) +
    scale_color_manual(values = c("#b5601b", "#2c5696")) +
    theme(legend.position = "left",
          legend.text = element_text(size = 12, family = "Helvetica"),
          legend.title = element_text(size = 12, family = "Helvetica"),
          panel.border = element_rect(color = "black", fill = NA, size = 1),  # Add black axis
          panel.background = element_blank(),  # Remove panel background
          plot.background = element_rect(fill = "white"),  # Add plot background with white fill
          plot.margin = margin(50, 20, 20, 20))  # Add margin to the top of the plot
p <- p + theme(plot.title = element_text(face = "bold", size = 16, margin = margin(20, 0, 0, 0)))  # Add margin to the top of the plot title

# with marginal histogram
p1 <- ggMarginal(p, type = "histogram", fill = "#9eab79")

# With marginal density
p2 <- ggMarginal(p, type = "density")

# With marginal boxplot
p3 <- ggMarginal(p, type = "boxplot")

print(p1)
#print(p2)
#print(p3)

# Set the file path where the PDF file will be saved
file_path <- "C:/Users/User/Desktop/project/bioinformatics project/plots/Results R/Chemical space/Rplot2_MW_vs_LogP.pdf"

# Save the plot as a PDF file with Helvetica font
ggsave(
    filename = file_path,
    plot = p1,
    width = 8,
    height = 6,
    device = "pdf",
    family = "Helvetica"
)
