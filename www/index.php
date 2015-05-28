
<!-- This is the project specific website template -->
<!-- It can be changed as liked or replaced by other content -->

<?php

$domain=ereg_replace('[^\.]*\.(.*)$','\1',$_SERVER['HTTP_HOST']);
$group_name=ereg_replace('([^\.]*)\..*$','\1',$_SERVER['HTTP_HOST']);
$themeroot='r-forge.r-project.org/themes/rforge/';

echo '<?xml version="1.0" encoding="UTF-8"?>';
?>
<!DOCTYPE html
	PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en   ">

  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title><?php echo $group_name; ?></title>
	<link href="http://<?php echo $themeroot; ?>styles/estilo1.css" rel="stylesheet" type="text/css" />
  </head>

<body>

<!-- R-Forge Logo -->
<table border="0" width="100%" cellspacing="0" cellpadding="0">
<tr><td>
<a href="http://r-forge.r-project.org/"><img src="http://<?php echo $themeroot; ?>/imagesrf/logo.png" border="0" alt="R-Forge Logo" /> </a> </td> </tr>
</table>


<!-- get project title  -->
<!-- own website starts here, the following may be changed as you like -->

<h2>Welcome to Statistical Complexity Measures!</h2>
<em><p><strong>An R package to quantify statistical complexity and information of time series to distinguish chaos from noise.</strong> </p></em>


<p> <h4>Introduction</h4>
Statistical complexity and information measures are statistical tools to quantify entropy and complexity in time series and hence to distinguish deterministic chaos from randomness (see e.g. Bandt and Pompe 2002). The measures are based on the "ordinal pattern distribution" of the time series (an alternative to a histogram-like representation with some advantages). We specifically provide a range of different permutation coding schemes for calculating the Fisher Information (see e.g. Olivares et al 2012). In addition, measures to quantify the statistical distance between ordinal pattern distributions are provided (e.g. Hellinger Distance). </p>

<h4><p> Related papers: </h4>
Bandt, C., & Pompe, B. (2002). Permutation entropy: a natural complexity measure for time series. Physical review letters, 88(17), 174102.
<br> Rosso, O. A., Larrondo, H. A., Martin, M. T., Plastino, A., & Fuentes, M. A. (2007). Distinguishing noise from chaos. Physical review letters, 99(15), 154102.
<br> Olivares, F., Plastino, A., & Rosso, O. A. (2012). Contrasting chaos with noise via local versus global information quantifiers. Physics Letters A, 376(19), 1577-1583. </p>

<p> <h4> Installation and Usage </h4>
To install <em>statcomp</em>, please type from your preferred R-console:
<br> <code>install.packages("statcomp", repos="http://R-Forge.R-project.org")</code> </p>

<p>
If you use <em>statcomp</em> in scientific publications, please cite:
<br>
Sippel, S and Lange, H (2015) - statcomp: An R package to quantify statistical complexity and information. Version 0.0.0.9000.
</p>


<p> The project summary page you can find <a href="http://r-forge.r-project.org/projects/statcomp/">here</a>. </p>


<br>
<tr>
<td>
<embed src="images/complexity_illustration.png" height="500px" id="fig-1"/>
</td>
</tr>
<tr>
<td>
<p align="center" style="font-family:arial;font-size:16px;">Figure 1. Exemplary illustration of different time series in the entropy-complexity plane.</p>
</td>
<td>
<br>

<p> <h4>Author details and further information:</h4>
 Sebastian Sippel (<a href="mailto:ssippel@bgc-jena.mpg.de">ssippel@bgc-jena.mpg.de</a>)
<br> For news and further information check my personal page: <a href="https://www.bgc-jena.mpg.de/bgi/index.php/People/SebastianSippel/">here</a>. </p> 

</body>
</html>
