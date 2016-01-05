<?php
require_once('./includes/countries.php');
function PageMain() {
	global $TMPL, $LNG, $CONF, $db, $settings;
	
	if(isset($_POST['login'])) {
		$logInAdmin = new logInAdmin();
		$logInAdmin->db = $db;
		$logInAdmin->url = $CONF['url'];
		$logInAdmin->username = $_POST['username'];
		$logInAdmin->password = $_POST['password'];
		
		$TMPL['message'] = $logInAdmin->in();
	}
	if(isset($_SESSION['usernameAdmin']) && isset($_SESSION['passwordAdmin'])) {
		$loggedInAdmin = new loggedInAdmin();
		$loggedInAdmin->db = $db;
		$loggedInAdmin->url = $CONF['url'];
		$loggedInAdmin->username = $_SESSION['usernameAdmin'];
		$loggedInAdmin->password = $_SESSION['passwordAdmin'];
		$loggedIn = $loggedInAdmin->verify();

		if($loggedIn['username']) {
			// Set the content to true, change the $skin to content
			$content = true;
			
			$TMPL_old = $TMPL; $TMPL = array();
			$TMPL['url'] = $CONF['url']; 
			
			if($_GET['b'] == 'security') { // Security Admin Tab
				$skin = new skin('admin/security'); $page = '';

				if(!empty($_POST)) {
					$updateSettings = new updateSettings();
					$updateSettings->db = $db;
					$updated = $updateSettings->query_array('admin', $_POST);
					
					if($updated == 1) {
						header("Location: ".$CONF['url']."/index.php?a=admin&b=security&m=s");
					} else {
						header("Location: ".$CONF['url']."/index.php?a=admin&b=security&m=i");
					}
				}
				
				if($_GET['m'] == 's') {
					$TMPL['message'] = notificationBox('success', $LNG['password_changed']);
				} elseif($_GET['m'] == 'i') {
					$TMPL['message'] = notificationBox('info', $LNG['password_not_changed']);
				}
			} elseif($_GET['b'] == 'social') { // Security Admin Tab
				$skin = new skin('admin/social'); $page = '';
				
				if(!extension_loaded('openssl')) {
					$TMPL['message'] .= notificationBox('error', $LNG['openssl_error']);
				}
				if(!function_exists('curl_exec')) {
					$TMPL['message'] .= notificationBox('info', $LNG['curl_error']);
				}

				$TMPL['fbappid'] = $settings['fbappid']; $TMPL['fbappsecret'] = $settings['fbappsecret'];

				if(empty($settings['fbapp'])) {
					$TMPL['fbappoff'] = ' selected="selected"';
				} else {
					$TMPL['fbappon'] = ' selected="selected"';
				}
				
				if(!empty($_POST)) {
					$updateSettings = new updateSettings();
					$updateSettings->db = $db;
					$updated = $updateSettings->query_array('settings', $_POST);
					if($updated == 1) {
						header("Location: ".$CONF['url']."/index.php?a=admin&b=social&m=s");
					} else {
						header("Location: ".$CONF['url']."/index.php?a=admin&b=social&m=i");
					}
				}
				
				if($_GET['m'] == 's') {
					$TMPL['message'] .= notificationBox('success', $LNG['settings_saved']);
				} elseif($_GET['m'] == 'i') {
					$TMPL['message'] .= notificationBox('info', $LNG['nothing_changed']);
				}
			} elseif($_GET['b'] == 'payments') {
				$managePayments = new managePayments();
				$managePayments->db = $db;
				$managePayments->url = $CONF['url'];
				$managePayments->per_page = $settings['rperpage'];
				
				if(isset($_GET['id'])) {
					$skin = new skin('admin/payment'); $page = '';
					if(isset($_GET['type'])) {
						$managePayments->updatePayment($_GET['id'], $_GET['type']);
					}
					$TMPL['content'] = $managePayments->getPayment($_GET['id']);
					
					// If the payment doens't exist
					if(empty($TMPL['content'])) {
						header("Location: ".$CONF['url']."/index.php?a=admin&b=payments&m=i");
					}
				} else {
					$skin = new skin('admin/manage_payments'); $page = '';
					$TMPL['payments'] = $managePayments->getPayments(0);
				}
				if($_GET['m'] == 'i') {
					$TMPL['message'] = notificationBox('error', $LNG['payment_not_exist']);
				}
			} elseif($_GET['b'] == 'pro') { // Security Admin Tab
				$skin = new skin('admin/pro'); $page = '';
				
				if(!extension_loaded('openssl')) {
					$TMPL['message'] .= notificationBox('error', $LNG['openssl_error']);
				}
				if(!function_exists('curl_exec')) {
					$TMPL['message'] .= notificationBox('info', $LNG['curl_error']);
				}

				$TMPL['ppuser'] = $settings['paypaluser']; $TMPL['pppass'] = $settings['paypalpass']; $TMPL['ppsign'] = $settings['paypalsign']; $TMPL['currentProMonth'] = $settings['promonth']; $TMPL['currentProYear'] = $settings['proyear'];

				if(empty($settings['paypalapp'])) {
					$TMPL['ppappoff'] = ' selected="selected"';
				} else {
					$TMPL['ppappon'] = ' selected="selected"';
				}
				
				if(empty($settings['paypalsand'])) {
					$TMPL['ppsandoff'] = ' selected="selected"';
				} else {
					$TMPL['ppsandon'] = ' selected="selected"';
				}
				
				if($settings['protracksize'] == '5242880') {
					$TMPL['aprotrack'] = 'selected="selected"';
				} elseif($settings['protracksize'] == '10485760') {
					$TMPL['bprotrack'] = 'selected="selected"';
				} elseif($settings['protracksize'] == '26214400') {
					$TMPL['cprotrack'] = 'selected="selected"';
				} elseif($settings['protracksize'] == '52428800') {
					$TMPL['dprotrack'] = 'selected="selected"';
				} elseif($settings['protracksize'] == '104857600') {
					$TMPL['eprotrack'] = 'selected="selected"';
				} elseif($settings['protracksize'] == '262144000') {
					$TMPL['fprotrack'] = 'selected="selected"';
				} elseif($settings['protracksize'] == '524288000') {
					$TMPL['gprotrack'] = 'selected="selected"';
				} elseif($settings['protracksize'] == '1073741824') {
					$TMPL['hprotrack'] = 'selected="selected"';
				} else {
					$TMPL['iprotrack'] = 'selected="selected"';
				}
				
				if($settings['protracktotal'] == '104857600') {
					$TMPL['aprototal'] = 'selected="selected"';
				} elseif($settings['protracktotal'] == '209715200') {
					$TMPL['bprototal'] = 'selected="selected"';
				} elseif($settings['protracktotal'] == '314572800') {
					$TMPL['cprototal'] = 'selected="selected"';
				} elseif($settings['protracktotal'] == '524288000') {
					$TMPL['dprototal'] = 'selected="selected"';
				} elseif($settings['protracktotal'] == '1073741824') {
					$TMPL['eprototal'] = 'selected="selected"';
				} elseif($settings['protracktotal'] == '5368709120') {
					$TMPL['fprototal'] = 'selected="selected"';
				} elseif($settings['protracktotal'] == '10737418240') {
					$TMPL['gprototal'] = 'selected="selected"';
				} elseif($settings['protracktotal'] == '26843545600') {
					$TMPL['hprototal'] = 'selected="selected"';
				} else {
					$TMPL['iprototal'] = 'selected="selected"';
				}
				
				if($settings['tracksize'] == '5242880') {
					$TMPL['atrack'] = 'selected="selected"';
				} elseif($settings['tracksize'] == '10485760') {
					$TMPL['btrack'] = 'selected="selected"';
				} elseif($settings['tracksize'] == '26214400') {
					$TMPL['ctrack'] = 'selected="selected"';
				} elseif($settings['tracksize'] == '52428800') {
					$TMPL['dtrack'] = 'selected="selected"';
				} else {
					$TMPL['etrack'] = 'selected="selected"';
				}
				
				if($settings['currency'] == 'USD') {
					$TMPL['usd_currency'] = 'selected="selected"';
				} elseif($settings['currency'] == 'EUR') {
					$TMPL['eur_currency'] = 'selected="selected"';
				} else {
					$TMPL['gbp_currency'] = 'selected="selected"';
				}
				
				if($settings['tracksizetotal'] == '104857600') {
					$TMPL['atotal'] = 'selected="selected"';
				} elseif($settings['tracksizetotal'] == '209715200') {
					$TMPL['btotal'] = 'selected="selected"';
				} elseif($settings['tracksizetotal'] == '314572800') {
					$TMPL['ctotal'] = 'selected="selected"';
				} elseif($settings['tracksizetotal'] == '524288000') {
					$TMPL['dtotal'] = 'selected="selected"';
				} else {
					$TMPL['etotal'] = 'selected="selected"';
				}
				
				if(!empty($_POST)) {
					$updateSettings = new updateSettings();
					$updateSettings->db = $db;
					$updated = $updateSettings->query_array('settings', $_POST);
					if($updated == 1) {
						header("Location: ".$CONF['url']."/index.php?a=admin&b=pro&m=s");
					} else {
						header("Location: ".$CONF['url']."/index.php?a=admin&b=pro&m=i");
					}
				}
				
				if($_GET['m'] == 's') {
					$TMPL['message'] .= notificationBox('success', $LNG['settings_saved']);
				} elseif($_GET['m'] == 'i') {
					$TMPL['message'] .= notificationBox('info', $LNG['nothing_changed']);
				}
			} elseif($_GET['b'] == 'stats') { // Security Admin Tab
				$skin = new skin('admin/stats'); $page = '';
				
				list($TMPL['tracks_total'], $TMPL['tracks_public'], $TMPL['tracks_private'], $TMPL['comments_total'], $TMPL['users_today'], $TMPL['users_this_month'], $TMPL['users_last_30'], $TMPL['users_total'], $TMPL['total_reports'], $TMPL['pending_reports'], $TMPL['safe_reports'], $TMPL['deleted_reports'], $TMPL['total_tracks_reports'], $TMPL['pending_track_reports'], $TMPL['safe_track_reports'], $TMPL['deleted_track_reports'], $TMPL['total_comment_reports'], $TMPL['pending_comment_reports'], $TMPL['safe_comment_reports'], $TMPL['deleted_comment_reports'], $TMPL['total_likes'], $TMPL['likes_today'], $TMPL['likes_this_month'], $TMPL['likes_last_30'], $TMPL['total_plays'], $TMPL['plays_today'], $TMPL['plays_this_month'], $TMPL['plays_last_30'], $TMPL['total_downloads'], $TMPL['downloads_today'], $TMPL['downloads_this_month'], $TMPL['downloads_last_30'], $TMPL['total_playlists'], $TMPL['playlists_today'], $TMPL['playlists_this_month'], $TMPL['playlists_last_30'], $TMPL['total_payments'], $TMPL['payments_today'], $TMPL['payments_this_month'], $TMPL['payments_last_30'], $TMPL['total_earnings'], $TMPL['earnings_today'], $TMPL['earnings_this_month'], $TMPL['earnings_last_30']) = statistics($db, $settings['currency']);
				
				$TMPL['currency'] = $settings['currency'];
			} elseif($_GET['b'] == 'themes') {
				$skin = new skin('admin/themes'); $page = '';
				$updateSettings = new updateSettings();
				$updateSettings->db = $db;
				
				$themes = $updateSettings->getThemes();
				
				$TMPL['themes_list'] = $themes[0];
				
				if(isset($_GET['theme'])) {
					// If theme is in array
					if(in_array($_GET['theme'], $themes[1])) {
						$updated = $updateSettings->query_array('settings', array('theme' => $_GET['theme']));
						
						if($updated == 1) {
							header("Location: ".$CONF['url']."/index.php?a=admin&b=themes&m=s");
						} else {
							header("Location: ".$CONF['url']."/index.php?a=admin&b=themes&m=i");
						}
					}
				}
				
				if($_GET['m'] == 's') {
					$TMPL['message'] = notificationBox('success', $LNG['theme_changed']);
				} elseif($_GET['m'] == 'i') {
					$TMPL['message'] = notificationBox('error', $LNG['nothing_changed']);
				}
				
			} elseif($_GET['b'] == 'reports') {
				$manageReports = new manageReports();
				$manageReports->db = $db;
				$manageReports->url = $CONF['url'];
				$manageReports->title = $settings['title'];
				$manageReports->per_page = $settings['rperpage'];
					
				if(ctype_digit($_GET['id'])) {
					if(isset($_GET['type'])) {
						// Do the manage report action
						$manageReport = $manageReports->manageReport($_GET['id'], $_GET['type']);
					}
					$skin = new skin('admin/report'); $page = '';
					$TMPL['content'] = $manageReports->getReport($_GET['id']);
					
					// If the report doesn't exist
					if(empty($TMPL['content'])) {
						header("Location: ".$CONF['url']."/index.php?a=admin&b=reports&m=i");
					}
				} else {
					$skin = new skin('admin/manage_reports'); $page = '';
					
					$TMPL['reports'] = $manageReports->getReports(0);
				}
				if($_GET['m'] == 'i') {
					$TMPL['message'] = notificationBox('error', $LNG['report_not_exist']);
				}
			} elseif($_GET['b'] == 'users_settings') {
				$skin = new skin('admin/users_settings'); $page = '';

				if($settings['notificationl'] == '0') {
					$TMPL['loff'] = 'selected="selected"';
				} else {
					$TMPL['lon'] = 'selected="selected"';
				}
				
				if($settings['notificationc'] == '0') {
					$TMPL['coff'] = 'selected="selected"';
				} else {
					$TMPL['con'] = 'selected="selected"';
				}
				
				if($settings['email_comment'] == '0') {
					$TMPL['ecoff'] = 'selected="selected"';
				} else {
					$TMPL['econ'] = 'selected="selected"';
				}
				
				if($settings['email_like'] == '0') {
					$TMPL['eloff'] = 'selected="selected"';
				} else {
					$TMPL['elon'] = 'selected="selected"';
				}
				
				if($settings['email_new_friend'] == '0') {
					$TMPL['enfoff'] = 'selected="selected"';
				} else {
					$TMPL['enfon'] = 'selected="selected"';
				}
				
				if($settings['notificationd'] == '0') {
					$TMPL['doff'] = 'selected="selected"';
				} else {
					$TMPL['don'] = 'selected="selected"';
				}
				
				if($settings['notificationf'] == '0') {
					$TMPL['foff'] = 'selected="selected"';
				} else {
					$TMPL['fon'] = 'selected="selected"';
				}
				
				if($settings['ronline'] == '3') {
					$TMPL['uone'] = 'selected="selected"';
				} elseif($settings['ronline'] == '7') {
					$TMPL['utwo'] = 'selected="selected"';
				} else {
					$TMPL['uthree'] = 'selected="selected"';
				}
				
				if($settings['nperwidget'] == '5') {
					$TMPL['none'] = 'selected="selected"';
				} elseif($settings['nperwidget'] == '10') {
					$TMPL['ntwo'] = 'selected="selected"';
				} elseif($settings['nperwidget'] == '20') {
					$TMPL['nthree'] = 'selected="selected"';
				} else {
					$TMPL['nfour'] = 'selected="selected"';
				}
				
				if($settings['lperpost'] == '5') {
					$TMPL['likeson'] = 'selected="selected"';
				} else {
					$TMPL['likesoff'] = 'selected="selected"';
				}

				if(!empty($_POST)) {
					$updateSettings = new updateSettings();
					$updateSettings->db = $db;
					$updated = $updateSettings->query_array('settings', $_POST);
					if($updated == 1) {
						header("Location: ".$CONF['url']."/index.php?a=admin&b=users_settings&m=s");
					} else {
						header("Location: ".$CONF['url']."/index.php?a=admin&b=users_settings&m=i");
					}
				}
				
				if($_GET['m'] == 's') {
					$TMPL['message'] = notificationBox('success', $LNG['settings_saved']);
				} elseif($_GET['m'] == 'i') {
					$TMPL['message'] = notificationBox('info', $LNG['nothing_changed']);
				}
			} elseif($_GET['b'] == 'users') {
				$manageUsers = new manageUsers();
				$manageUsers->db = $db;
				$manageUsers->url = $CONF['url'];
				$manageUsers->title = $settings['title'];
				$manageUsers->per_page = $settings['rperpage'];
				
				if(!isset($_GET['id']) && !isset($_GET['idu'])) {
					$skin = new skin('admin/manage_users'); $page = '';

					// Save the array returned into a list
					$TMPL['users'] = $manageUsers->getUsers(0);
				} else {
					$skin = new skin('admin/user'); $page = '';
					$getUser = $manageUsers->getUser($_GET['id'], $_GET['idu']);
					if(!$getUser) {
						header("Location: ".$CONF['url']."/index.php?a=admin&b=users&m=un");
					}
					// Create the class instance
					$updateUserSettings = new updateUserSettings();
					$updateUserSettings->db = $db;
					$updateUserSettings->id = $getUser['idu'];
					
					if(!empty($_POST)) {
						$TMPL['message'] = $updateUserSettings->query_array('users', array_map("strip_tags_array", $_POST));
					}
					
					$userSettings = $updateUserSettings->getSettings();
					$TMPL['countries'] = countries(1, $userSettings['country']);
					
					$TMPL['username'] = $userSettings['username']; $TMPL['idu'] = $userSettings['idu']; $TMPL['currentFirstName'] = $userSettings['first_name']; $TMPL['currentLastName'] = $userSettings['last_name']; $TMPL['currentEmail'] = $userSettings['email']; $TMPL['currentCity'] = $userSettings['city']; $TMPL['currentWebsite'] = $userSettings['website']; $TMPL['currentDescription'] = $userSettings['description']; $TMPL['currentFacebook'] = $userSettings['facebook']; $TMPL['currentTwitter'] = $userSettings['twitter'];  $TMPL['currentGplus'] = $userSettings['gplus']; $TMPL['currentYouTube'] = $userSettings['youtube']; $TMPL['currentSoundCloud'] = $userSettings['soundcloud']; $TMPL['currentLastfm'] = $userSettings['lastfm']; $TMPL['currentMySpace'] = $userSettings['myspace']; $TMPL['currentVimeo'] = $userSettings['vimeo']; $TMPL['currentTumblr'] = $userSettings['tumblr']; $TMPL['join_date'] = $userSettings['date'];

					$feed = new feed();
					$feed->db = $db;
					$feed->id = $updateUserSettings->id;
					
					$manageReports = new manageReports();
					$manageReports->db = $db;
					$manageReports->url = $CONF['url'];
					$manageReports->per_page = $settings['rperpage'];

					if(isset($_GET['suspend'])) {
						$manageUsers->suspendUser($feed->id, $_GET['suspend']);
					}
					
					$user = $manageUsers->getUser($getUser['idu']);
					
					$TMPL['username'] = '<div class="manage-users-image"><a href="'.$CONF['url'].'/index.php?a=profile&u='.$user['username'].'" target="_blank"><img src="'.$CONF['url'].'/thumb.php?src='.$user['image'].'&t=a&w=112&h=112"></a></div><div class="manage-users-content"><a href="'.$CONF['url'].'/index.php?a=profile&u='.$user['username'].'" target="_blank">'.$user['username'].'</a><br>'.$user['email'].'</div>';
					
					$TMPL['reports'] = $manageReports->getReports(0, ($feed->getTrackList($feed->id) ? $feed->getTrackList($feed->id) : 1));
					if(empty($TMPL['reports'])) {
						$TMPL['hide_r'] = ' style="display: none;"';
					}
					
					// If the user has payments history
					$managePayments = new managePayments();
					$managePayments->db = $db;
					$managePayments->url = $CONF['url'];
					$managePayments->per_page = $settings['rperpage'];
			
					$TMPL['history'] = $managePayments->getPayments(0, $updateUserSettings->id);

					if(empty($TMPL['history'])) {
						$TMPL['hide_p'] = ' style="display: none;"';
					}
					
					// Suspend variable for the suspend url
					$TMPL['suspend'] = ($user['suspended'] ? '0' : '1');

					$TMPL['status_desc'] = ($user['suspended'] ? $LNG['restore_account'] : $LNG['suspend_account']);
					
					$TMPL['status'] = ($user['suspended'] ? notificationBox('error', $LNG['account_suspended']) : '');
					
					if($user['suspended']) {
						$TMPL['suspended'] = $LNG['restore'];
					} else {
						$TMPL['suspended'] = $LNG['suspend'];
					}
				}
				// If GET delete is set, delete the user
				if($_GET['delete']) {
					$manageUsers->deleteUser($_GET['delete']);
					header("Location: ".$CONF['url']."/index.php?a=admin&b=users&m=".$_GET['delete']);
				}
				
				if($_GET['m'] == 'un') {
					$TMPL['message'] = notificationBox('error', $LNG['user_not_exist']);
				} elseif(!empty($_GET['m'])) {
					$TMPL['message'] = notificationBox('success', sprintf($LNG['user_has_been_deleted'], $_GET['m']));
				}
			} elseif($_GET['b'] == 'categories') {
				$manageCategories = new manageCategories();
				$manageCategories->db = $db;
				$manageCategories->url = $CONF['url'];
				
				$skin = new skin('admin/manage_categories'); $page = '';
				
				$TMPL['categories'] = $manageCategories->getCategories();

			} elseif($_GET['b'] == 'ads') {
				$skin = new skin('admin/manage_ads'); $page = '';
				
				$TMPL['ad1'] = $settings['ad1']; $TMPL['ad2'] = $settings['ad2']; $TMPL['ad3'] = $settings['ad3']; $TMPL['ad4'] = $settings['ad4']; $TMPL['ad5'] = $settings['ad5']; $TMPL['ad6'] = $settings['ad6']; $TMPL['ad7'] = $settings['ad7'];
				if(!empty($_POST)) {
					// Unset the submit array element
					$updateSettings = new updateSettings();
					$updateSettings->db = $db;
					$updated = $updateSettings->query_array('settings', $_POST);
					if($updated == 1) {
						header("Location: ".$CONF['url']."/index.php?a=admin&b=ads&m=s");
					} else {
						header("Location: ".$CONF['url']."/index.php?a=admin&b=ads&m=i");
					}
				}
				if($_GET['m'] == 's') {
					$TMPL['message'] = notificationBox('success', $LNG['settings_saved']);
				} elseif($_GET['m'] == 'i') {
					$TMPL['message'] = notificationBox('info', $LNG['nothing_changed']);
				}
			} else {
				$skin = new skin('admin/general'); $page = '';
				
				$TMPL['currentTitle'] = $settings['title']; $TMPL['currentFormat'] = $settings['format']; $TMPL['currentArtFormat'] = $settings['artformat']; $TMPL['currentTrackFormat'] = $settings['trackformat'];
						
				if($settings['captcha'] == '1') {
					$TMPL['on'] = 'selected="selected"';
				} else {
					$TMPL['off'] = 'selected="selected"';
				}
				
				if($settings['time'] == '0') {
					$TMPL['one'] = 'selected="selected"';
				} elseif($settings['time'] == '1') {
					$TMPL['two'] = 'selected="selected"';
				} elseif($settings['time'] == '2') {
					$TMPL['three'] = 'selected="selected"';
				} else {
					$TMPL['four'] = 'selected="selected"';
				}
				
				if($settings['volume'] == '0.20') {
					$TMPL['vtwenty'] = 'selected="selected"';
				} elseif($settings['volume'] == '0.40') {
					$TMPL['vfourty'] = 'selected="selected"';
				} elseif($settings['volume'] == '0.60') {
					$TMPL['vsixty'] = 'selected="selected"';
				} elseif($settings['volume'] == '0.80') {
					$TMPL['veighty'] = 'selected="selected"';
				} elseif($settings['volume'] == '1') {
					$TMPL['vhundred'] = 'selected="selected"';
				}
				
				if($settings['conline'] == '60') {
					$TMPL['conone'] = 'selected="selected"';
				} elseif($settings['conline'] == '300') {
					$TMPL['contwo'] = 'selected="selected"';
				} else {
					$TMPL['conthree'] = 'selected="selected"';
				}
				
				if($settings['perpage'] == '10') {
					$TMPL['ten'] = 'selected="selected"';
				} elseif($settings['perpage'] == '20') {
					$TMPL['twenty'] = 'selected="selected"';
				} elseif($settings['perpage'] == '35') {
					$TMPL['thirtyfive'] = 'selected="selected"';
				} else {
					$TMPL['fifty'] = 'selected="selected"';
				}
				
				if($settings['nperpage'] == '10') {
					$TMPL['nten'] = 'selected="selected"';
				} elseif($settings['nperpage'] == '25') {
					$TMPL['ntwentyfive'] = 'selected="selected"';
				} elseif($settings['nperpage'] == '50') {
					$TMPL['nfifty'] = 'selected="selected"';
				} else {
					$TMPL['nonehundred'] = 'selected="selected"';
				}
				
				if($settings['mperpage'] == '5') {
					$TMPL['mone'] = 'selected="selected"';
				} elseif($settings['mperpage'] == '10') {
					$TMPL['mtwo'] = 'selected="selected"';
				} elseif($settings['mperpage'] == '25') {
					$TMPL['mthree'] = 'selected="selected"';
				} else {
					$TMPL['mfour'] = 'selected="selected"';
				}
				
				if($settings['mlimit'] == '500') {
					$TMPL['cone'] = 'selected="selected"';
				} elseif($settings['mlimit'] == '1000') {
					$TMPL['ctwo'] = 'selected="selected"';
				} elseif($settings['mlimit'] == '2500') {
					$TMPL['cthree'] = 'selected="selected"';
				} else {
					$TMPL['cfour'] = 'selected="selected"';
				}
				
				if($settings['chatr'] == '1') {
					$TMPL['crone'] = 'selected="selected"';
				} elseif($settings['chatr'] == '2') {
					$TMPL['crtwo'] = 'selected="selected"';
				} elseif($settings['chatr'] == '3') {
					$TMPL['crthree'] = 'selected="selected"';
				} elseif($settings['chatr'] == '5') {
					$TMPL['crfive'] = 'selected="selected"';
				} elseif($settings['chatr'] == '10') {
					$TMPL['crten'] = 'selected="selected"';
				} elseif($settings['chatr'] == '30') {
					$TMPL['crthirty'] = 'selected="selected"';
				} else {
					$TMPL['croff'] = 'selected="selected"';
				}
				
				if($settings['qperpage'] == '10') {
					$TMPL['qten'] = 'selected="selected"';
				} elseif($settings['qperpage'] == '20') {
					$TMPL['qtwenty'] = 'selected="selected"';
				} elseif($settings['qperpage'] == '35') {
					$TMPL['qthirtyfive'] = 'selected="selected"';
				} else {
					$TMPL['qfifty'] = 'selected="selected"';
				}
				
				if($settings['cperpage'] == '5') {
					$TMPL['cfive'] = 'selected="selected"';
				} elseif($settings['cperpage'] == '10') {
					$TMPL['cten'] = 'selected="selected"';
				} elseif($settings['cperpage'] == '25') {
					$TMPL['ctwentyfive'] = 'selected="selected"';
				} else {
					$TMPL['cfifty'] = 'selected="selected"';
				}
				
				if($settings['size'] == '1048576') {
					$TMPL['onemb'] = 'selected="selected"';
				} elseif($settings['size'] == '2097152') {
					$TMPL['twomb'] = 'selected="selected"';
				} elseif($settings['size'] == '3145728') {
					$TMPL['threemb'] = 'selected="selected"';
				} else {
					$TMPL['tenmb'] = 'selected="selected"';
				}
				
				if($settings['mail'] == '1') {
					$TMPL['mailon'] = 'selected="selected"';
				} else {
					$TMPL['mailoff'] = 'selected="selected"';
				}
				
				if($settings['intervaln'] == '10000') {
					$TMPL['intonen'] = 'selected="selected"';
				} elseif($settings['intervaln'] == '30000') {
					$TMPL['inttwon'] = 'selected="selected"';
				} elseif($settings['intervaln'] == '60000') {
					$TMPL['intthreen'] = 'selected="selected"';
				}  elseif($settings['intervaln'] == '120000') {
					$TMPL['intfourn'] = 'selected="selected"';
				} elseif($settings['intervaln'] == '300000') {
					$TMPL['intfiven'] = 'selected="selected"';
				} elseif($settings['intervaln'] == '600000') {
					$TMPL['intsixn'] = 'selected="selected"';
				} else {
					$TMPL['intsevenn'] = 'selected="selected"';
				}
				
				if($settings['artsize'] == '1048576') {
					$TMPL['aart'] = 'selected="selected"';
				} elseif($settings['artsize'] == '2097152') {
					$TMPL['bart'] = 'selected="selected"';
				} elseif($settings['artsize'] == '3145728') {
					$TMPL['cart'] = 'selected="selected"';
				} else {
					$TMPL['dart'] = 'selected="selected"';
				}
				
				if($settings['rperpage'] == '10') {
					$TMPL['rpone'] = 'selected="selected"';
				} elseif($settings['rperpage'] == '20') {
					$TMPL['rptwo'] = 'selected="selected"';
				} elseif($settings['rperpage'] == '50') {
					$TMPL['rpthree'] = 'selected="selected"';
				} else {
					$TMPL['rpfour'] = 'selected="selected"';
				}
				
				if($settings['sperpage'] == '10') {
					$TMPL['sone'] = 'selected="selected"';
				} elseif($settings['sperpage'] == '20') {
					$TMPL['stwo'] = 'selected="selected"';
				} elseif($settings['sperpage'] == '35') {
					$TMPL['sthree'] = 'selected="selected"';
				} else {
					$TMPL['sfour'] = 'selected="selected"';
				}
				
				if($settings['aperip'] == '1') {
					$TMPL['ipone'] = 'selected="selected"';
				} elseif($settings['aperip'] == '3') {
					$TMPL['iptwo'] = 'selected="selected"';
				} elseif($settings['aperip'] == '5') {
					$TMPL['ipthree'] = 'selected="selected"';
				} elseif($settings['aperip'] == '10') {
					$TMPL['ipfour'] = 'selected="selected"';
				} else {
					$TMPL['ipoff'] = 'selected="selected"';
				}
				
				if(isset($_POST['submit'])) {
					// Unset the submit array element
					unset($_POST['submit']);
					$updateSettings = new updateSettings();
					$updateSettings->db = $db;
					$updated = $updateSettings->query_array('settings', $_POST);
					if($updated == 1) {
						header("Location: ".$CONF['url']."/index.php?a=admin&m=s");
					} else {
						header("Location: ".$CONF['url']."/index.php?a=admin&m=i");
					}
				}
				
				if($_GET['m'] == 's') {
					$TMPL['message'] = notificationBox('success', $LNG['settings_saved']);
				} elseif($_GET['m'] == 'i') {
					$TMPL['message'] = notificationBox('info', $LNG['nothing_changed']);
				}
			}
			
			$page .= $skin->make();
			$TMPL = $TMPL_old; unset($TMPL_old);
			$TMPL['settings'] = $page;
			
			if(isset($_GET['logout']) == 1) {
				$loggedInAdmin->logOut();
				header("Location: ".$CONF['url']."/index.php?a=admin");
			}
			
		} else {
			// Set the content to false, change the $skin to log-in.
			$content = false;
		}
	}
	
	// Bold the current link
	if(isset($_GET['b'])) {
		$LNG["admin_menu_{$_GET['b']}"] = $LNG["admin_menu_{$_GET['b']}"];
		$TMPL['welcome'] = $LNG["admin_ttl_{$_GET['b']}"];
	} else {
		$LNG["admin_menu_general"] = $LNG["admin_menu_general"];
		$TMPL['welcome'] = $LNG["admin_ttl_general"];
	}
	
	function adminMenuCounts($db, $type) {
		// Type 0: Return the reports number
		
		if($type == 0) {
			$query = $db->query('SELECT COUNT(`id`) as `count` FROM `reports` WHERE `state` = 0');
		}
		$result = $query->fetch_assoc();
		
		return $result['count'];
	}
	
	$adminMenu = array(	'' 					=> array('admin_menu_general', ''),
						'&b=users_settings' => array('admin_menu_users_settings', ''),
						'&b=pro'			=> array('admin_menu_pro', ''),
						'&b=social'			=> array('admin_menu_social', ''),
						'&b=themes' 		=> array('admin_menu_themes', ''),
						'&b=stats'			=> array('admin_menu_stats', ''),
						'&b=security'		=> array('admin_menu_security', ''),
						'&b=users'			=> array('admin_menu_manage_users', ''),
						'&b=payments'		=> array('admin_menu_manage_payments', ''),
						'&b=reports'		=> array('admin_menu_manage_reports', adminMenuCounts($db, 0)),
						'&b=categories'		=> array('admin_menu_manage_categories', ''),
						'&b=ads'			=> array('admin_menu_manage_ads', ''),
						'&logout=1'			=> array('admin_menu_logout', ''));
	
	foreach($adminMenu as $link => $title) {
		if($link == '&b='.$_GET['b'] || $link == $_GET['b']) {
			$TMPL['admin_menu'] .= '<strong>';
			$ttl = $LNG[$title[0]];
		}
		$TMPL['admin_menu'] .= '<a href="'.$CONF['url'].'/index.php?a=admin'.$link.'" '.(($title[0] == 'admin_menu_logout') ? '' : 'rel="loadpage"').'>'.$LNG[$title[0]].' '.($title[1] ? '<span class="admin-notifications-number">'.$title[1].'</span>' : '').'</a>';
		if($link == '&b='.$_GET['b'] || $link == $_GET['b']) {
			$TMPL['admin_menu'] .= '</strong>';
		}
	}
	
	$TMPL['url'] = $CONF['url'];
	$TMPL['title'] = $LNG['title_admin'].' - '.($loggedIn['username'] ? $ttl : $LNG['login']).' - '.$settings['title'];
	if($content) {
		$skin = new skin('admin/content');
	} else {
		$skin = new skin('admin/login');
	}
	return $skin->make();
}
?>