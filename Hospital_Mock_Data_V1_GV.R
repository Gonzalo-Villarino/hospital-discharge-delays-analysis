library(ggplot2)
library(dplyr)

# Define delay categories (in English)
df <- df %>%
        mutate(Delay_Category = cut(Demora_Horas,
                                    breaks = c(0, 6, 12, 24, 36, 48, 72, Inf),
                                    labels = c("0–6h", "6–12h", "12–24h", "24–36h", "36–48h", "48–72h", "72h+"),
                                    right = FALSE
        ))

# Count patients per category
df_cat <- df %>%
        count(Delay_Category)

# Plot with English labels
ggplot(df_cat, aes(x = Delay_Category, y = n)) +
        geom_bar(stat = "identity", fill = "tomato", width = 0.7) +
        geom_text(aes(label = n), vjust = -0.5, size = 4) +
        geom_vline(xintercept = which(levels(df$Delay_Category) == "24–36h"), 
                   linetype = "dashed", color = "red") +
        labs(
                title = "Distribution of Patient Discharge Delays",
                subtitle = "Simulated hospital data – bottlenecks above 24h",
                x = "Delay Range",
                y = "Number of Patients"
        ) +
        theme_minimal()
