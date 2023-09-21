# Vérifications de R/import_data.R

vacc <- data.io::read("../../data/be_vaccine_covid.rds")

test_that("Le jeu de données est-il actualisé ?", {
  expect_gt(attr(vacc, "downloaded") |> as.Date(), as.Date("2022-09-22"))

  # Ce test détermine si le jeu de données data/bd_vaccine_covid.rds a été
  # actualisé, ou s'il contient toujours la version d'origine. Vous devez
  # exécuter l'ensemble du code de R/import_data.R pour actualiser ce fichier!
})

test_that("Le jeu de données est-il correct ?", {
  expect_equal(names(vacc),
    c( "date", "region", "agegroup", "sex", "brand", "dose", "count"))
  expect_is(vacc, "data.frame") # Le jeu de données est un data frame
  expect_gt(nrow(vacc), 190000) # Il contient plus de 190000 lignes

  # Ces tests vérifient que le nom des colonnes du jeu de données est correct.
  # S'ils échouent, il y a un problème dans le remaniement des données dans
  # R/import_data.R. Il vérifie aussi que l'objet est un "data.frame" et que le
  # tableau contient bien au moins 198000 lignes.
})
