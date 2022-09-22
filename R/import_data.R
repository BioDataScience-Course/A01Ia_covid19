# Importation et remaniement des données de vaccination en Belgique

# Packages utiles ----
SciViews::R(lang = "fr")

# Importation des données ----
vaccines <- read$csv("https://epistat.sciensano.be/Data/COVID19BE_VACC.csv")
class(vaccines)
readr::spec(vaccines)
# Conversion en data.table
vaccines <- as_dtx(vaccines)
class(vaccines)

# Remaniement des données ----
skimr::skim(vaccines)

## On utilise de préférence des noms de colonnes
## en minuscule, sans espace et sans accent
vaccines %>.%
  rename_all(., tolower) %>.%
  filter(., brand != "Other") %>.%
  mutate(.,
    region = fct_recode(region, Wallonia = "Ostbelgien")) %->%
  vaccines

## Ajout de labels aux variables du tableau
vaccines <- labelise(vaccines, label = list(
    date = "Date", region = "Région", agegroup = "Groupe d'age",
    sex = "Sexe", brand = "Vaccin", dose = "Type de dose",
    count = "Nombre de doses administrées"))

## Ajout de metadonnée relative à la date de la sauvegarde en local du fichier.
attr(vaccines, "local_save") <- lubridate::today()

# Sauvegarde locale des données ----
## Copie en local des données au format `rds` et compressée
write(vaccines, here::here("data", "be_vaccines_covid.rds"), type = "rds", compress = "xz")


