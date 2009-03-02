<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<?php echo $head ?>
</head>

<body>
<div id="wrapper">
<?php echo $content ?>
</div>
<div id="footer">
	<p>Copyright <?php echo html::anchor(FALSE, 'Sam Soffes') ?> 2005-2009. <a href="http://github.com/samsoffes/samsoff.es/">View source on GitHub</a>.</p>
</div>
</body>
<?php if (IN_PRODUCTION) : ?>
<script type="text/javascript">document.write(unescape("%3Cscript src='http://www.google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));</script>
<script type="text/javascript">try {var pageTracker = _gat._getTracker("UA-5609322-1");pageTracker._trackPageview();} catch(err) {}</script>
<?php endif ?>
</html>
