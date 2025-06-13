# Calcular total de pacientes por periodo
N_before <- sum(df_before$n)
N_after <- sum(df_after$n)

# Crear subtítulo con p-valor y tamaños de muestra
subtitle_text <- paste0(
        "Reducción significativa en tiempos largos de espera\n",
        "Chi-squared test p-value = ", p_value,
        " | N (antes) = ", N_before,
        " | N (después) = ", N_after
)

# Gráfico
ggplot(df_all, aes(x = Delay_Category, y = n, fill = Period)) +
        geom_bar(stat = "identity", position = position_dodge(width = 0.75), width = 0.6) +
        geom_text(aes(label = n),
                  position = position_dodge(width = 0.75),
                  vjust = -0.6, size = 5, fontface = "bold", color = "black") +
        scale_fill_manual(values = c("Before" = "#4CAF50", "After" = "#2196F3")) +
        labs(
                title = "Retrasos en Altas Médicas: Antes vs Después de la Intervención",
                subtitle = subtitle_text,
                x = "Rango de Demora desde la Orden de Alta",
                y = "Número de Pacientes",
                fill = "Periodo"
        ) +
        theme_minimal(base_size = 16) +
        theme(
                legend.position = "top",
                legend.title = element_blank(),
                panel.grid.major.x = element_blank(),
                panel.grid.minor = element_blank(),
                axis.text.x = element_text(face = "bold", size = 12),
                axis.text.y = element_text(size = 12),
                plot.title = element_text(face = "bold", size = 18, hjust = 0.5),
                plot.subtitle = element_text(size = 14, hjust = 0.5)
        )
