<?php
function PageMain() {
	global $TMPL, $LNG, $CONF, $db, $loggedIn, $settings;
	
	if(isset($_SESSION['username']) && isset($_SESSION['password']) || isset($_COOKIE['username']) && isset($_COOKIE['password'])) {
		
		$verify = $loggedIn->verify();

		if($verify['username']) {
			header("Location: ".$CONF['url']."/index.php?a=stream");
		}
	}
	
	// Start displaying the popular tracks
	$result = $db->query("SELECT `views`.`track`,`tracks`.`title`,`tracks`.`art`, COUNT(`track`) as `count` FROM `views`,`tracks` WHERE `views`.`track` = `tracks`.`id` AND DATE_SUB(CURDATE(),INTERVAL 1 DAY) <= date(`views`.`time`) AND `art` != 'default.png' GROUP BY `track` ORDER BY `count` DESC LIMIT 10");
	while($row = $result->fetch_assoc()) {
		$users[] = $row;
	}
	
	$TMPL['rows'] = welcomeTracks($users, $CONF['url']);
	
	$TMPL['url'] = $CONF['url'];
	
	if($settings['paypalapp']) {
		$skin = new skin('welcome/gopro'); $go_pro = '';
		$go_pro = $skin->make();
	}
	$TMPL['go_pro'] = $go_pro;
	
	$TMPL['title'] = $LNG['welcome'].' - '.$settings['title'];
	$TMPL['meta_description'] = $settings['title'].' '.$LNG['welcome_about'];
	$TMPL['ad'] = $settings['ad1'];
	
	$skin = new skin('welcome/content');
	return $skin->make();
}
?>