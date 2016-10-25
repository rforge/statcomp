
<!-- This is the project specific website template -->
<!-- It can be changed as liked or replaced by other content -->

<html>
<body>

<!-- R-Forge Logo -->


<table border="0" width="100%" cellspacing="0" cellpadding="0">
<tr>
<td>
<img src="logo.png" />
</td> 
</tr>
</table>

<!-- get project title  -->
<!-- own website starts here, the following may be changed as you like -->

<h1>Welcome to Statistical Complexity Measures!</h1>
<em><p><strong>statcomp: An R package to quantify statistical complexity and information of time series to distinguish chaos from noise.
</strong> </p></em>

<!-- menu -->
<hr>
<h2>Contents</h2>
<ul>
  <li><a href="index.html">statcomp: Introduction and Installation</a></li> 
  <li>statcomp - applications and examples:</li>
	<ul>
		<li><a href="statcomp_example1.html">Tutorial 1: Classification of Deterministic-chaotic and stochastic processes using the Entropy-Complexity (HxC) plane </a></li>
    <li><a href="statcomp_example2.html">Tutorial 2: Classification of Deterministic-chaotic and stochastic processes using the Entropy-Fisher (HxF) plane </a></li>
	</ul>
	<li><a href="http://r-forge.r-project.org/projects/statcomp/">Project summary page</a></li>
</ul>
<hr>
<!-- end of menu -->


<p> <h4>Introduction</h4>
Statistical complexity and information measures are statistical tools to quantify entropy and complexity in time series and hence to distinguish deterministic chaos from randomness (see e.g. Bandt and Pompe 2002). The measures are based on the "ordinal pattern distribution" of the time series (an alternative to a histogram-like representation with some advantages). We specifically provide a range of different permutation coding schemes for calculating the Fisher Information (see e.g. Olivares et al 2012). In addition, measures to quantify the statistical distance between ordinal pattern distributions are provided (e.g. Hellinger Distance).
</p>

<h4><p> Related papers: </h4>
Lopez-Ruiz, R., Mancini, H. L. & Calbet, X., 1995. A statistical measure of complexity. _Physics Letters A_, 209. doi:10.1016/0375-9601(95)00867-5. <br>
Bandt, C. and Pompe, B., 2002. Permutation entropy: a natural complexity measure for time series. _Physical Review Letters_, 88(17). doi:10.1103/PhysRevLett.88.174102. <br>
Rosso, O. A., Larrondo, H. A., Martin, M. T., Plastino, A., & Fuentes, M. A. (2007). Distinguishing noise from chaos. _Physical Review Letters_, 99(15). doi:10.1103/PhysRevLett.99.154102.  <br>
Olivares, F., Plastino, A. and Rosso, O.A., 2012. Ambiguities in Bandt-Pompe's methodology for local entropic quantifiers. _Physica A: Statistical Mechanics and its Applications_, 391(8). doi:10.1016/j.physa.2011.12.033. <br>
Sippel, S., Lange, H., Mahecha, M. D., Hauhs, M., Bodesheim, P., Kaminski, T., Gans, F. & Rosso, O. A. (2016) Diagnosing the Dynamics of Observed and Simulated Ecosystem Gross Primary Productivity with Time Causal Information Theory Quantifiers. _PLOS ONE_, accepted. doi:10.1371/journal.pone.0164960.</p>

![Figure 1. Exemplary illustration of different time series in the entropy-complexity plane.](Fig1-eps-converted-to.pdf)
<br> **Figure 1. Exemplary illustration of different time series in the entropy-complexity plane.**

<p> <h4> Installation and Usage </h4>
To install <em>statcomp</em>, please type from your preferred R-console:
<br> <code>install.packages("statcomp", repos="http://R-Forge.R-project.org")</code> </p>
... or retrieve from CRAN (https://cran.r-project.org/web/packages/statcomp/ ):
<br> <code>install.packages("statcomp")</code> 

<p>
If you use <em>statcomp</em> in scientific publications, please cite:
<br>
Sippel, S., Lange, H., Mahecha, M. D., Hauhs, M., Bodesheim, P., Kaminski, T., Gans, F. & Rosso, O. A. (2016) Diagnosing the Dynamics of Observed and Simulated Ecosystem Gross Primary Productivity with Time Causal Information Theory Quantifiers. <i>PLOS ONE</i>, accepted. doi:10.1371/journal.pone.0164960.</p>
The package has been developed at the Max Planck Institute for Biogeochemistry, Jena, Germany.

<p> <h4>Author details and further information:</h4>
 Sebastian Sippel (<a href="mailto:ssippel@bgc-jena.mpg.de">ssippel@bgc-jena.mpg.de</a>)
<br> For news and further information check my personal page: <a href="https://www.bgc-jena.mpg.de/bgi/index.php/People/SebastianSippel/">here</a>. </p> 
</body>
</html>

