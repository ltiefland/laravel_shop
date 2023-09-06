<?php
    //$Id: resource.vportale.php 99 2022-06-02 08:25:37Z tiefland $

    /**
     * MySQL Resource
     *
     * Resource Implementation based on the Custom API to use
     * MySQLi as the storage resource for Smarty's templates and configs.
     *
     * @package Resource-examples
     * @author  Rodney Rehm
     * @author  Lars Tiefland
     */
    class Smarty_Resource_Mysqli_vportale extends Smarty_Resource_Custom
    {
        private $conn;
        // prepared fetch() statement
        protected $fetch;
        // prepared fetchTimestamp() statement
        protected $mtime;

        public function __construct()
        {
            $sql = 'SELECT
                    letzte_aenderung_am,
                    inhalt
                FROM 
                    vportale_template
                WHERE
                    id = ?
            ';
            if ( isset( $GLOBALS["remoteDB"] ) && $GLOBALS["remoteDB"] )
            {
                $this->conn = $GLOBALS["remoteDB"];
            }
            elseif ( isset( $GLOBALS["orderDB"] ) && $GLOBALS["orderDB"] )
            {
                $this->conn = $GLOBALS["orderDB"];
            }
            else
            {
                $this->conn = $GLOBALS["shopDB"];
            }
            $this->fetch = $this->conn->prepare( $sql );
            $sql = 'SELECT
                    letzte_aenderung_am
                FROM 
                    vportale_template
                WHERE
                    id = ?
            ';
            $this->mtime = $this->conn->prepare( $sql );
        }

        /**
         * Fetch a template and its modification time from database
         *
         * @param string  $name   template name
         * @param string  $source template source
         * @param integer $mtime  template modification timestamp (epoch)
         *
         * @return void
         */
        protected function fetch( $name, &$source, &$mtime )
        {
            $this->fetch->bind_param( "s", $name );
            $this->fetch->execute();
            trigger_error( $this->conn->error );
            $res = $this->fetch->get_result();
            $row = $res->fetch_assoc();
            if ( $row )
            {
                $source = stripslashes( $row['inhalt'] );
                $mtime = strtotime( $row['letzte_aenderung_am'] );
            }
            else
            {
                $source = null;
                $mtime = null;
            }
        }

        /**
         * Fetch a template's modification time from database
         *
         * @note implementing this method is optional. Only implement it if modification times can be accessed faster than loading the compiled template source.
         *
         * @param string $name template name
         *
         * @return integer timestamp (epoch) the template was modified
         */
        protected function fetchTimestamp( $name )
        {
            $this->mtime->bind_param( "s", $name );
            $this->mtime->execute();
            trigger_error( $this->conn->error );
            $res = $this->mtime->get_result();
            $row = $res->fetch_assoc();
            $mtime = $row["letzte_aenderung_am"];
            return strtotime( $mtime );
        }
    }


    // register the resource name "mysqli"
    $GLOBALS["ui"]->registerResource( 'mysqli', new Smarty_Resource_Mysqli_vportale() );