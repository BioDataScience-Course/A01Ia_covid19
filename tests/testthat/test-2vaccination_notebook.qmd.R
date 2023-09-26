# Vérifications de doc/vaccination_notebook.qmd

vacc_ast <- parse_rmd("../../vaccination_notebook.qmd",
  allow_incomplete = TRUE, parse_yaml = TRUE)

test_that("Le bloc-notes est-il compilé en un fichier final HTML ?", {
  expect_true(is_rendered("vaccination_notebook.qmd"))
  # La version compilée HTML du rapport est introuvable
  # Vous devez créer un rendu de votre bloc-notes Quarto (bouton 'Rendu')
  # Vérifiez aussi que ce rendu se réalise sans erreur, sinon, lisez le message
  # qui s'affiche dans l'onglet 'Travaux' et corrigez ce qui ne va pas dans
  # votre document avant de réaliser à nouveau un rendu HTML.
  # IL EST TRES IMPORTANT QUE VOTRE DOCUMENT COMPILE ! C'est tout de même le but
  # de votre analyse que d'obtenir le document final HTML.

  expect_true(is_rendered_current("vaccination_notebook.qmd"))
  # La version compilée HTML du document Quarto existe, mais elle est ancienne
  # Vous avez modifié le document Quarto après avoir réalisé le rendu.
  # La version finale HTML n'est sans doute pas à jour. Recompilez la dernière
  # version de votre bloc-notes en cliquant sur le bouton 'Rendu' et vérifiez
  # que la conversion se fait sans erreur. Sinon, corrigez et regénérez le HTML.
})

test_that("La structure du document est-elle conservée ?", {
  expect_true(all(c("Introduction et but", "Analyses",
    "Types de vaccins utilisés", "Différences homme-femme", "Doses de rappel")
    %in% (rmd_node_sections(vacc_ast) |> unlist() |> unique())))
  # Les sections (titres) attendues du document ne sont pas toutes présentes
  # Ce test échoue si vous avez modifié la structure du document, un ou
  # plusieurs titres indispensables par rapport aux exercices ont disparu ou ont
  # été modifié. Vérifiez la structure du document par rapport à la version
  # d'origine dans le dépôt "template" du document (lien au début du fichier
  # README.md).

  expect_true(all(c("setup", "week", "brand", "brand_dose", "brand_sex", "age")
    %in% rmd_node_label(vacc_ast)))
  # Un ou plusieurs labels de chunks nécessaires à l'évaluation manquent
  # Ce test échoue si vous avez modifié la structure du document, un ou
  # plusieurs chunks indispensables par rapport aux exercices sont introuvables.
  # Vérifiez la structure du document par rapport à la version d'origine dans
  # le dépôt "template" du document (lien au début du fichier README.md).

  expect_true(any(duplicated(rmd_node_label(vacc_ast))))
  # Un ou plusieurs labels de chunks sont dupliqués
  # Les labels de chunks doivent absolument être uniques. Vous ne pouvez pas
  # avoir deux chunks qui portent le même label. Vérifiez et modifiez le label
  # dupliqué pour respecter cette règle. Comme les chunks et leurs labels sont
  # imposés dans ce document cadré, cette situation ne devrait pas se produire.
  # Vous avez peut-être involontairement dupliqué une partie du document ?
})

test_that("L'entête YAML a-t-il été complété ?", {
  expect_true(vacc_ast[[1]]$author != "___")
  expect_true(!grepl("__", vacc_ast[[1]]$author))
  expect_true(grepl("^[^_]....+", vacc_ast[[1]]$author))
  # Le nom d'auteur n'est pas complété ou de manière incorrecte dans l'entête
  # Vous devez indiquer votre nom dans l'entête YAML à la place de "___" et
  # éliminer les caractères '_' par la même occasion.

  expect_true(grepl("[a-z]", vacc_ast[[1]]$author))
  # Aucune lettre minuscule n'est trouvée dans le nom d'auteur
  # Avez-vous bien complété le champ 'author' dans l'entête YAML ?
  # Vous ne pouvez pas écrire votre nom tout en majuscules. Utilisez une
  # majuscule en début de nom et de prénom, et des minuscules ensuite.

  expect_true(grepl("[A-Z]", vacc_ast[[1]]$author))
  # Aucune lettre majuscule n'est trouvée dans le nom d'auteur
  # Avez-vous bien complété le champ 'author' dans l'entête YAML ?
  # Vous ne pouvez pas écrire votre nom tout en minuscules. Utilisez une
  # majuscule en début de nom et de prénom, et des minuscules ensuite.
})

test_that("Les commentaires sont-ils corrects pour le tableau Vaccins par type ?", {
  expect_true(is_identical_to_ref("brand_comment"))
  # Vous devez compléter la liste d'observations sous le tableau
  # "Vaccins par type" dans vaccination_notebook.qmd. Si le test échoue, ce
  # n'est pas encore fait.
})

test_that("Les commentaires sont-ils complétés pour le tableau Vaccins par genre ?", {
  expect_true(!(rmd_select(vacc_ast, by_section("Différences homme-femme")) |>
    as_document() |> grepl("^- +\\.+ *$", x = _) |> any()))
  # Vous devez compléter la liste d'observations sous le tableau
  # "Vaccins par genre" dans vaccination_notebook.qmd. Si le test échoue,
  # ce n'est pas encore fait.
})

test_that("Les commentaires sont-ils complétés pour le graphique des rappels en fonction de l'âge ?", {
  expect_true(!(rmd_select(vacc_ast, by_section("Doses de rappel")) |>
    as_document() |> grepl("^- +\\.+ *$", x = _) |> any()))
  # Vous devez compléter la liste d'observations sous le graphique "Rappels 2 et
  # 3 en fonction de l'âge" dans vaccination_notebook.qmd. Si le test
  # échoue, ce n'est pas encore fait.
})

