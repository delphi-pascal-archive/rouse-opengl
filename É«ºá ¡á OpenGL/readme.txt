Petite panoplie du grand séducteur: projet rosier (ou la drague en opengl)--------------------------------------------------------------------------
Url     : http://codes-sources.commentcamarche.net/source/17055-petite-panoplie-du-grand-seducteur-projet-rosier-ou-la-drague-en-openglAuteur  : cs_FormanDate    : 02/08/2013
Licence :
=========

Ce document intitulé « Petite panoplie du grand séducteur: projet rosier (ou la drague en opengl) » issu de CommentCaMarche
(codes-sources.commentcamarche.net) est mis à disposition sous les termes de
la licence Creative Commons. Vous pouvez copier, modifier des copies de cette
source, dans les conditions fixées par la licence, tant que cette note
apparaît clairement.

Description :
=============

Alors, ceci est un petit programme en Delphi et OpenGl, avec un peu de maths. Il
 manque des commentaires, mais en gros, on va faire tracer &agrave; OpenGl une r
ose qui vieillit au cours du temps, &agrave; chaque clic de souris sur la fen&ec
irc;tre la rose renait et change de couleur. Il y a bien s&ucirc;r une infinit&e
acute; de mod&egrave;les de roses, choisis au hasard par rapport &agrave; un jeu
 de param&egrave;tres incluant la forme, la couleur, le nombre de p&eacute;tales
, la fonction de vieillisement etc...
<br />La fonction &agrave; repr&eacute;se
nter est un champ de surfaces d&eacute;finies en coordonn&eacute;es polaire qu'o
n va segmenter en p&eacute;tales. La tige est juste un cylindre de r&eacute;volu
tion le long d'une parabole.
<br />La partie programmation est &eacute;l&eacute
;mentaire, &agrave; part pour OpenGl.
<br />La partie math&eacute;matique est u
n peu plus compliqu&eacute;e.
<br /><a name='source-exemple'></a><h2> Source / 
Exemple : </h2>
<br /><pre class='code' data-mode='basic'>
Attention: ne pas 
enlever le fichier RES de l'archive, il est nécessaire à la compilation puisqu'i
l contient la texture des feuilles! Une fois compilé, pour une facilité d'utilis
ation plus grande  (voir plus bas), la texture est incluse dans l'exécutable.
<
/pre>
<br /><a name='conclusion'></a><h2> Conclusion : </h2>
<br />Timides: e
n plus de sa valeur d'exemple (apr&egrave;s tout on peut s'en servir pour voir c
omment utiliser opengl!), ce code est peut-&ecirc;tre la solution &agrave; vos p
robl&egrave;mes relationnels. Vous ne pensez plus qu'&agrave; elle depuis des mo
is, elle ne vous a jamais remarqu&eacute; et vous ne savez pas comment l'aborder
 parce que vous avez peur de ne pas &ecirc;tre la hauteur? 
<br />Heureusement 
Forman est l&agrave; et a pens&eacute; &agrave; tout, gr&acirc;ce &agrave; ce pe
tit programme que vous ferez tourner devant les yeux &eacute;bahis de la belle p
eu &agrave; peu s&eacute;duite, vous avez une probabilit&eacute; plus que non nu
lle de conclure l'affaire! Vous avez m&ecirc;me mon autorisation expresse de dir
e que c'est vous qui l'avez programm&eacute; (j'ai une version plus &eacute;volu
&eacute;e et plus jolie pour mon usage personnel, mais bon, je la garde pour moi
, n'est-ce-pas?). Le code est fait pour ne pas trop ramer m&ecirc;me sur une mac
hine relativement lente, comme &ccedil;a &ccedil;a pas de probl&egrave;me de rid
icule en cas d'utilisation sur une machine &eacute;trang&egrave;re plus lente (s
i le programme &eacute;tait trop lent, tout l'effet positif serait perdu!).
<br
 />
<br />Effet garanti, test&eacute; avec succ&egrave;s par d&eacute;j&agrave;
 3 personnes en plus de moi!
<br />;-D
<br />
<br />A essayer sur un chat (ja
mais test&eacute; encore dans ces conditions-l&agrave;, dites-moi si &ccedil;a m
arche si jamais vous l'essayez!)
