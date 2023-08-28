# Importation et remaniement des données de vaccination COVID-19 en Belgique
# Auteur : Engels Guyliann
# Date : 2022-09-21
# Licence : MIT
# Ce script permet d'importer, de remanier et de sauvegarder une copie locale
# des données de vaccination COVID-19 en Belgique. Ces données sont issues de
# <https://epistat.sciensano.be/covid/>

# Setup -------------------------------------------------------------------
# Importation des principaux outils et paramétrisation de l'environnement
SciViews::R(lang = "fr")

# Importation -------------------------------------------------------------
# Lecture des données depuis une URL
vaccine <- read$csv("https://epistat.sciensano.be/Data/COVID19BE_VACC.csv")

# Conversion en data table par défaut
vaccine <- as_dtx(vaccine)
class(vaccine) # notre tableau est un data.table.
skimr::skim(vaccine)

# Remaniement du tableau --------------------------------------------------
vaccine %>.%
  # On renomme les colonnes par des noms en minuscule (de préférence les noms
  # de colonnes sont en lettres minuscules, sans espaces et sans accents)
  rename_all(., tolower) %>.%
  # On élimine les lignes du tableau correspondant à un vaccin inconnu (Other)
  filter(., brand != "Other") %>.%
  # On renome la région Ostbelgien en Wallonia car il n'existe pas de région
  # Osbelgien en Belgique mais bien une communauté.
  mutate(., region = fct_recode(region,
    `Bruxelles-capitale` = "Brussels",
    Flamande = "Flanders",
    Wallonne = "Wallonia",
    Wallonne = "Ostbelgien")) %->%
  vaccine


# Ajout des labels au tableau --------------------------------------------
vaccine <- labelise(vaccine, label = list(
  date = "Date", region = "Région", agegroup = "Groupe d'âge",
  sex = "Sexe", brand = "Vaccin", dose = "Type de dose",
  count = "Nombre de doses administrées"))


# Ajout de métadonnée relative à la date de téléchargement des données ----
attr(vaccine, "downloaded") <- lubridate::today()

# Sauvegarde locale du tableau --------------------------------------------
# Copie en local des données au format `rds` et compressée
write$rds(vaccine, "data/be_vaccine_covid.rds", compress = "xz")
# Libération de la mémoire
rm(vaccine)
