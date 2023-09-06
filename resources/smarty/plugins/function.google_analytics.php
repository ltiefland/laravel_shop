<?php
    /**
     * Smarty plugin 
     * @package Smarty 
     * @subpackage plugins 
     */

    /**
     * Google Analytics plugin 
     * Generate XHTML 1.1 valid Google Analytics code 
     * Name:     google_analytics<br> 
     * Date:     2009.09.17.<br> 
     * 
     * Examples: 
     * <pre> 
     * {google_analytics code=UA-xxxxxx-x} 
     * </pre> 
     * 
     * @author   László Kovács <info@laszlokovacs.com> 
     * @license http://www.gnu.org/copyleft/gpl.html GPL 
     * @param array $params code parameter required 
     * @param Smarty $smarty 
     * @return string 
     */
    function smarty_function_google_analytics( $params, &$smarty )
    {

        if ( empty($params['code']) )
        {
            $smarty->trigger_error( "google_analytics: missing parameter" );
            return;
        }

        $return = ' 
      <script src="http://www.google-analytics.com/ga.js" type="text/javascript"></script> 
      <script type="text/javascript"> 
      // <![CDATA[ 
      try{ 
      var pageTracker = _gat._getTracker("' . $params['code'] . '"); 
      pageTracker._trackPageview(); 
      } catch(err) {} 
      // ]]> 
      </script>';

        return $return;
    }

?>