<?php defined('SYSPATH') OR die('No direct access allowed.'); ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>samsoff.es - error</title>
<link rel="stylesheet" href="/css/error.css" type="text/css" />
</head>
<body>
<div id="container">
	<h3><?php echo html::specialchars($error) ?></h3>
	<p><?php echo $message ?></p>
</div>
</body>
</html>