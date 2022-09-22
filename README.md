# Suivi de la vaccination contre le COVID19 en Belgique

## Avant-propos

Les consignes reprises dans ce document, ainsi que dans les différents fichiers sont susceptibles d'évoluer. N'hésitez pas à vérifier le lien suivant afin de voir si des modifications n'y ont pas été apportées : <https://github.com/BioDataScience-Course/A01Ia_covid19> .

Ce projet nécessite d'avoir assimilé l'ensemble des notions du premier module du cours de science des données biologiques I. Dans le module 1, vous avez été renvoyé vers des appendices comme l'[appendice B](https://wp.sciviews.org/sdd-umons/?iframe=wp.sciviews.org/sdd-umons-2022/prise.html). Ce projet nécessite également d'avoir pris connaissance de ces appendices.

## Objectifs

Ce projet est *individuel*, *cadré* et à durée limitée (2h). Ce projet vous permet de :

-   cloner un projet hébergé sur GitHub
-   découvrir l'organisation des dossiers d'un projet scientifique
-   découvrir le R Markdown
-   réaliser des modifications, des commits, des pull et des push.

## Consignes

La structuration d'un projet en science des données respecte quelques conventions que vous devez appliquer. Des explications sur 'organisation d'un projet est disponibles dans l'appendice [B.1.1.2 Organisation d'un projet](https://wp.sciviews.org/sdd-umons/?iframe=wp.sciviews.org/sdd-umons-2022/rs.html). On y retrouve généralement :

-   un fichier `README.md` qui présente le projet
-   un dossier `data/` qui comprend les données comme des fichiers au format `csv`
-   un dossier `docs/` qui comprend les rapports ou les présentations liés au projet
-   un dossier `R/` qui comprend des fichiers composés d'une suite d'instructions qui peuvent être interprétés pour effectuer des analyses, dont l'extension est `.R`. Ces scripts contiennent des instructions en code R que vous allez découvrir tout au long de cours. Des explications complémentaires se trouvent dans l'appendice [B.1.2 Scripts R dans RStudio](https://wp.sciviews.org/sdd-umons/?iframe=wp.sciviews.org/sdd-umons-2022/rs.html).

Explorez chaque dossier et ouvrez les fichiers se trouvant dans le dossier `R/` et dans le dossier `docs/`. Lisez les nombreux commentaires et le code qui s'y trouve.

Ouvrez le fichier `vaccination_notebook.Rmd`, il s'agit d'un carnet de notes concernant l'évolution de la vaccination en Belgique. En connaissant la structure classique d'un projet, vous savez où ce fichier se trouve.

Cliquez sur le bouton `Knit` qui se trouve dans la barre d'outils au-dessus du document que vous venez d'ouvrir. Ce fichier est un au format Rmd qui signifie qu'il s'agit d'un document R Markdown. Pour cette première activité, retenez qu'il s'agit d'un format qui permet de combiner le Markdown (que vous avez découvert dans ce premier module) et le langage R (que vous allez découvrir lors du second module). Le langage R permet entre autres la manipulation, la visualisation et l'application de calculs statistiques sur des données.

![](figures/knit_document.png)

Vous venez de réaliser votre première compilation d'un document au format Rmd vers un document au format HTML. Il est possible en appuyant sur le menu déroulant à côté du bouton Knit, de définir si vous voulez un document compilé au format HTML, PDF ou Word. Retrouvez toutes les informations sur le R Markdown dans l'annexe [B.1.3 R Markdown/R Notebook](https://wp.sciviews.org/sdd-umons/?iframe=wp.sciviews.org/sdd-umons-2022/rs.html).

Repérez les trois zones spécifiques d'un document R Markdown

-   un préambule, encore appelé entête YAML (du nom du langage utilisé pour y encoder des informations)
-   les zones d'édition éditées avec le langage Markdown
-   des zones de code R appelées des chunks

Le préambule débute **toujours** par --- et se termine **toujours** par ---. Il n'y a pas de ligne vide dans un préambule. On y indique des if `nom: valeur`. Il ne faut pas d'espace entre le nom et les deux points, par contre il faut un espace entre les deux points et la valeur.

Les zones d'édition en markdown respectent les conventions markdown. Laissez toujours une ligne vide entre un paragraphe et un chunk ainsi qu'après les --- de la fin du préambule.

Les zones dédiées au code sont balisées par ```` ```{r} ```` pour des chunks faisant appel au logiciel **R**, et sont terminés par trois apostrophes inverses (```` ``` ````).

Des commentaires sont mis à votre disposition dans les zones d'édition en Markdown. Vous avez appris la syntaxe afin de rédiger un commentaire dans un document. Nous utilisons les commentaires afin de vous transmettre les consignes des travaux cadrés. Ces consignes sont des compléments au README.

Ouvrez le fichier `R/import_data.R`. Placez votre curseur en première ligne de ce fichier dans la fenêtre d'édition et exécutez chaque ligne. Cliquez sur Run dans la barre d'outils de la fenêtre d'édition, ou utilisez le raccourci clavier Ctrl+Enter ou Cmd+Enter sur MacOS pour exécuter les instructions les unes après les autres. Les lignes précédées d'un dièse ne sont pas interprétées par R. Vous pouvez à présent enregistrer (cliquez sur la disquette dans la barre d'outils) et fermer le fichier `R/import_data.R`. Vous venez de faire une mise à jour du fichier `data/be_vaccine_covid.rds`

Retournez dans le fichier `vaccination_notebook.Rmd` Cliquez sur le bouton `Run` barre d'outils de la fenêtre d'édition. Il s'agit d'un menu déroulant. Cliquez ensuite sur `Run All`. Cette instruction va exécuter chaque ligne de code présent dans chaque chunk.

À plusieurs endroits, il vous est demandé de compléter le document. Cherchez les balises dédiées aux consignes dans le document. Ensuite, compilez à nouveau votre document en cliquant sur le bouton `Knit`. Analysez votre document compilé afin d'observer les différences obtenues.

Vous avez bien travaillé ! Il est temps de réaliser une sauvegarde de votre projet et de l'envoyer sur GitHub. Vous allez réaliser un `commit`, un `pull` et un `push`.

![](figures/git.png)

Dans la barre d'outils, cliquez sur `Git`. Il se trouve à côté de `Environment`, `History` ou encore `Connections`. Cliquez ensuite sur `Commit`. Une fenêtre s'ouvre en vous montrant vos modifications réalisées dans chaque fichier du projet. Sélectionnez les fichiers que vous souhaitez sauvegarder via ce commit. Vous devez ajouter un message **informatif** à ce commit. Le message doit présenter de manière claire et concise ce que vous avez réalisé. Cliquez sur `Commit`. Vous venez de réaliser un Commit. Cliquez maintenant sur la flèche bleue afin de faire un pull puis cliquez sur la flèche verte afin de faire un push.

Rendez-vous sur GitHub afin de vérifier que vous avez réalisé correctement votre commit et votre push. Pour y accéder, retrouvez votre projet dans l'organisation GitHub <https://github.com/BioDataScience-Course>
