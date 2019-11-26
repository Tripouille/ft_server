<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wp' );

/** MySQL database username */
define( 'DB_USER', 'wordpress' );

/** MySQL database password */
define( 'DB_PASSWORD', '123' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         '#Fpq0aNIaixB7oAv;Us%OaWd7~ijEFk^nv/d*=>K}zw5:YN*=H(<<X|V$, YB/rm' );
define( 'SECURE_AUTH_KEY',  '2.~-xk8,oPU.JXzyB]@nQ1c?/S2*S2J7Zt6zVkc8jSq/ouqK<!n[_qYrN7Q6c=pM' );
define( 'LOGGED_IN_KEY',    '0b~h8_I+}_9ka+]=i]WW mjqr?2)/mS@llu;^$b46/!|+a!H],HT3)6HMj$AP,@<' );
define( 'NONCE_KEY',        '3a<sd/v^}mqlwQC6<eb)YVUJ A8Gd3N{<kA+edD@vA4,s1%5?~lT1U_@:!0)t+X~' );
define( 'AUTH_SALT',        '1e2|0H!~<~pNW9xqwt6n+TE_;qc|!czfq/8$Yq>Dl3}ne71veMGcwKSD1q%D?*gE' );
define( 'SECURE_AUTH_SALT', '}jxjx=fc|ULoF|h{_?P6qp|J>l!L8EVw1fK=/|f.$Qd>qC)eukBRNQmf2#l%Ts]Q' );
define( 'LOGGED_IN_SALT',   'N3hcvPy]YX3a+,ybg3wK=#d?7ADBw[c)y0YdvDhYAa}!:@`V3Vmd=+pC>Q$(*K.I' );
define( 'NONCE_SALT',       'wl^y483zB7U[<OQ$IE^z<Pv:`?kJHHyTDtM+2YejOs+Q.i0xCno+:WkK>YM.2I`e' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );
