
library(ggplot2)
install.packages("rnaturalearth")
library(rnaturalearth)
library(sf)

aus <- ne_countries(scale = "medium", country = "Australia", returnclass = "sf")

sites <- data.frame(
  Site = c("Woodman Point (WA)", "Cliff Head (WA)", "Frenchman Bay (WA)",
           "St Kilda (SA)", "Port Gawler (SA)", "Tooradin (VIC)",
           "Rhyll (VIC)", "French Island (VIC)", "Cloudy Bay (TAS)",
           "Bagot Point (TAS)"),
  lon = c(115.74, 114.99, 117.95, 138.52, 138.49, 145.38, 145.30, 145.37, 147.22, 148.23),
  lat = c(-32.14, -29.53, -35.09, -34.72, -34.63, -38.21, -38.47, -38.35, -43.47, -42.11)
)

ggplot() +
  geom_sf(data = aus, fill = "grey90", colour = "black") +
  geom_point(data = sites, aes(lon, lat), size = 2) +
  geom_text(data = sites, aes(lon, lat, label = Site),
            nudge_x = 0.4, nudge_y = 0.2, size = 3) +
  coord_sf(xlim = c(110, 155), ylim = c(-45.5, -24)) +
  theme_bw() +
  labs(x = "Longitude", y = "Latitude")
