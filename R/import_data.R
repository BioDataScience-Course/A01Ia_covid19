# Importation et remaniement des données de vaccination en Belgique
# Auteur : Engels Guyliann
# Date : 2022-09-21
# Licence : MIT
# Info :
## Ce script permet d'importer, de remanier et de sauvegarder une copie en local
## des données sur la vaccination en Belgique via <https://epistat.sciensano.be/covid/>

# Setup -------------------------------------------------------------------
# Importation des principaux outils et paramétrisation
SciViews::R(lang = "fr")

# Importation -------------------------------------------------------------
# Lecture des données depuis une URL.
vaccine <- read$csv("https://epistat.sciensano.be/Data/COVID19BE_VACC.csv")

# Conversion en data frame par défaut
vaccine <- as_dtx(vaccine)
class(vaccine) # notre tableau est un data.table par défaut.
skimr::skim(vaccine)

# Remaniement du tableau --------------------------------------------------
vaccine %>.%
  rename_all(., tolower) %>.%
  ## On renomme les colonnes par des noms en miniscule
  ## de préférence les noms de colonnes sont en minuscule, sans espace et sans accent
  filter(., brand != "Other") %>.%
  ## On filtre les individus vaccinés par un vaccin inconnu
  mutate(.,
    region = fct_recode(region, Wallonia = "Ostbelgien")) %->%
  ## On renome la région Ostbelgien en Wallonia
  ## car il n'existe pas région Osbelgien en Belgique mais bien une communauté.
  vaccine


# Ajout des labels au tableau --------------------------------------------
vaccine <- labelise(vaccine, label = list(
    date = "Date", region = "Région", agegroup = "Groupe d'age",
    sex = "Sexe", brand = "Vaccin", dose = "Type de dose",
    count = "Nombre de doses administrées"))


# Ajout de metadonnée relative à la date de téléchargement des donnés ----
attr(vaccine, "downloaded") <- lubridate::today()

# Sauvegarde locale du tableau --------------------------------------------
write$rds(vaccine, "data/be_vaccine_covid.rds", compress = "xz")
## Copie en local des données au format `rds` et compressée


