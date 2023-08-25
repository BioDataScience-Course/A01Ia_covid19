# Vérifications de doc/vaccination_notebook.qmd

test_that("Le bloc-notes à été correctement compilé en un fichier final HTML", {
  expect_true(file.exists("../../doc/vaccination_notebook.html"))

  # Ce test vérifie la présence du fichier HTML final. Vous devez compiler le
  # document doc/vaccination_notebook.qmd, et cette compilation doit s'être
  # réalisée sans erreur pour que ce test réussisse (vous devez voir le fichier
  # HTML résultant dans l'onglet Visualisateur à la fin de la compilation).
  # En cas d'erreur, lisez le message qui s'affiche dans l'onglet Rendre et
  # corrigez ce qui ne va pas dans votre document avant de le compiler à
  # nouveau.
  # IL EST TRES IMPORTANT QUE VOTRE DOCUMENT COMPILE ! C'est tout de même le but
  # de votre analyse que d'obtenir le document final HTML.
})

vacc_ast <- parse_rmd("../../doc/vaccination_notebook.qmd",
  allow_incomplete = TRUE, parse_yaml = TRUE)

test_that("Le nom d'auteur a été modifié", {
  expect_false(vacc_ast[[1]]$author == "___")
  expect_true(grepl("[A-Za-z]+", vacc_ast[[1]]$author))

  # Vous devez indiquer votre nom dans l'entête YAML de
  # doc/vaccination_notebook.R. Apparemment, cela n'a pas encore été fait...
})

test_that("Les chunks attendus sont présents dans le document", {
  expect_true(all(c("setup", "week", "brand", "brand_dose", "brand_sex", "age")
    %in% rmd_node_label(vacc_ast)))

  # Ce test échoue si vous avez modifié la structure du document, un ou
  # plusieurs chunks indispensable par rapport aux exercices. Vérifiez la
  # structure du document par rapport à la version d'origine dans le dépôt
  # template du document (lien au début du fichier README.md).
})

test_that("Les commentaires sont complétés pour le tableau Vaccins par type", {
  expect_false(rmd_select(vacc_ast, by_section("Types de vaccins *")) |>
      as_document() |> grepl("-   ...", x = _) |> any())

  # Vous devez compléter la liste d'observations sous le tableau
  # "Vaccins par type" dans doc/vaccination_notebook.qmd. Si le test échoue, ce
  # n'est pas encore fait.
})

test_that("Les commentaires sont complétés pour le tableau Vaccins par genre", {
  expect_false(rmd_select(vacc_ast, by_section("Différences homme-femme")) |>
      as_document() |> grepl("-   ...", x = _) |> any())

  # Vous devez compléter la liste d'observations sous le tableau
  # "Vaccins par genre" dans doc/vaccination_notebook.qmd. Si le test échoue,
  # ce n'est pas encore fait.
})

test_that("Les commentaires sont complétés pour le graphique Rappels en fonction de l'âge", {
  expect_false(rmd_select(vacc_ast, by_section("Doses de rappel")) |>
      as_document() |> grepl("-   ...", x = _) |> any())

  # Vous devez compléter la liste d'observations sous le graphique "Rappels 2 et
  # 3 en fonction de l'âge" dans doc/vaccination_notebook.qmd. Si le test
  # échoue, ce n'est pas encore fait.
})

