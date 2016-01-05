<?php
include("../includes/config.php");
include("../includes/classes.php");
require_once(getLanguage(null, (!empty($_GET['lang']) ? $_GET['lang'] : $_COOKIE['lang']), 2));
session_start();
$db = new mysqli($CONF['host'], $CONF['user'], $CONF['pass'], $CONF['name']);
if ($db->connect_errno) {
    echo "Failed to connect to MySQL: (" . $db->connect_errno . ") " . $db->connect_error;
}
$db->set_charset("utf8");

$resultSettings = $db->query(getSettings()); 
$settings = $resultSettings->fetch_assoc();

// The theme complete url
$CONF['theme_url'] = $CONF['theme_path'].'/'.$settings['theme'];

// If message is not empty
if(!empty($_POST)) {

	// If the user have session or cookie set
	if(isset($_SESSION['username']) && isset($_SESSION['password']) || isset($_COOKIE['username']) && isset($_COOKIE['password'])) {
		$loggedIn = new loggedIn();
		$loggedIn->db = $db;
		$loggedIn->url = $CONF['url'];
		$loggedIn->username = (isset($_SESSION['username'])) ? $_SESSION['username'] : $_COOKIE['username'];
		$loggedIn->password = (isset($_SESSION['password'])) ? $_SESSION['password'] : $_COOKIE['password'];
		
		$verify = $loggedIn->verify();
		
		// If user is authed successfully
		if($verify['username']) {
			$feed = new feed();
			$feed->db = $db;
			$feed->url = $CONF['url'];
			$feed->user = $verify;
			$feed->id = $verify['idu'];
			$feed->username = $verify['username'];
			$feed->per_page = $settings['perpage'];
			$feed->art_size = $settings['artsize'];
			$feed->art_format = $settings['artformat'];
			$feed->paypalapp = $settings['paypalapp'];
			$feed->track_size_total = ($feed->getProStatus($feed->id, 1) ? $settings['protracktotal'] : $settings['tracksizetotal']);
			$feed->track_size = ($feed->getProStatus($feed->id, 1) ? $settings['protracksize'] : $settings['tracksize']);
			$feed->track_format = $settings['trackformat'];
			$feed->time = $settings['time'];
			
			// Set the $x to output the value via JS
			$x = 1;
			$update = $feed->updateTrack($_POST, 1);
		}
	}
}

?>
<?php if($x == 1) { ?>
<script language="javascript" type="text/javascript">
window.top.window.stopUpload('<?php echo str_replace(array("\r", "\n"), "", $update[0]); ?>', '<?php echo $update[1]; ?>');
</script>
<?php } else { ?>
<script language="javascript" type="text/javascript">window.top.window.stopUpload(' ')</script>
<?php } ?>