<?php
$ini = parse_ini_file("lib/config.ini", true);
$library = $ini['ENVIRON']['LIBRARY'];
$webgl = $ini['ENVIRON']['WEBGL'] ? 1 : 0;
$gametitle = $ini['ENVIRON']['TITLE'];
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><?php echo $gametitle;?></title>
    <meta http-equiv="x-ua-compatible" content="IE=Edge">
    <meta property='og:image' content='lib/enforce_icon.png'>
<?php
    if ($gametitle != "") {
        echo "<meta property='og:title' content='$gametitle'>\n";
    } else {
        echo "<meta property='og:title' content='enforce games'>\n";
    }
    if ($library == "enchant") {
?>
        <script type="text/javascript" src="extlib/enchant.0.8.1-enforce.min.js"></script>
        <script type="text/javascript" src="extlib/extendMap.enchant.js"></script>
<?php
    }
?>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale:1, minimum-scale=1, max-scale=1">
    <meta name="apple-mobile-web-app-capable" content="yes">
<?php
    if ($library == "enchant") {
?>
        <script type="text/javascript" src="extlib/Box2dWeb-2.1.a.3.min.js"></script>
        <script type="text/javascript" src="extlib/box2d.enchant.js"></script>
        <script type="text/javascript" src="extlib/socket.io-1.3.0.js"></script>
<?php
        if ($webgl == true) {
?>
            <script type="text/javascript" src="extlib/gl-matrix-min.js"></script>
            <script type="text/javascript" src="extlib/gl.enchant.js"></script>
            <script type="text/javascript" src="extlib/primitive.gl.enchant.js"></script>
            <script type="text/javascript" src="extlib/collada.gl.enchant.js"></script>
            <script type="text/javascript" src="extlib/mmd.gl.enchant.js"></script>
<?php
        }
    } else if ($library == "tmlib") {
?>
        <script type="text/javascript" src="extlib/tmlib.min.js"></script>
        <script type="text/javascript" src="extlib/Box2dWeb-2.1.a.3.min.js"></script>
<?php
    }
?>
    <script type="text/javascript" src="sysobject/library.js"></script>
    <script type="text/javascript">
        WEBGL = <?= $webgl?>;
        _POSTPARAM = separateGETquery();
    </script>
	<script type="text/javascript" src="usrobject/environ.js"></script>
    <script type="text/javascript" src="sysobject/enforce.core.js"></script>
<?php
    // #################################################################################
    // プラグインスクリプト読み込み
    // #################################################################################
	$srcdir = "./plugins";
	$dir = opendir($srcdir);
	while ($fname = readdir($dir)) {
		if (is_dir($srcdir."/".$fname) || preg_match("/environ.js/", $fname) || preg_match("/^\..*/", $fname)) {
			continue;
		}
		echo "<script type='text/javascript' src='$srcdir/$fname'></script>\n";
    }
    // #################################################################################
    // アプリケーションスクリプト読み込み
    // #################################################################################
	$srcdir = "./usrobject";
	$dir = opendir($srcdir);
	while ($fname = readdir($dir)) {
		if (is_dir($srcdir."/".$fname) || preg_match("/environ.js/", $fname) || preg_match("/^\..*/", $fname)) {
			continue;
		}
		echo "<script type='text/javascript' src='$srcdir/$fname'></script>\n";
	}
?>
    <style type="text/css">
        body {
            margin: 0;
            padding: 0;
        }
    </style>
</head>
<body bgcolor="#303030">
<?php
    if ($library == "tmlib") {
        echo "<canvas id='stage'></canvas>";
    }
?>
</body>
</html>
