<?php
    //$Id: resource.mysqli.php 105 2022-06-02 14:08:35Z tiefland $

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
    class Smarty_Resource_Mysqli extends Smarty_Resource_Custom
    {
        private $conn;
        // prepared fetch() statement
        protected $fetch;
        // prepared fetchTimestamp() statement
        protected $mtime;

        public function __construct()
        {
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
            if ( isset( $_SESSION["INI"] ) && $_SESSION["INI"] )
            {
                $dbase = $_SESSION["INI"]["dbConnect"]["order_db"];
            }
            else
            {
                $dbase = $GLOBALS["INI"]["dbConnect"]["order_db"];
            }
            if ( $dbase )
            {
                $dbase .= ".";
            }
            $settings_table = $dbase . "web_settings";
            $bestellarten = $this->getBestellarten();
            $sql = 'SELECT
                    letzte_aenderung_am,
                    inhalt
                FROM 
                    ' . $settings_table . '
                WHERE
                    id = ?
                AND
                    shops_ID=?
            ';
            if ( $bestellarten )
            {
                $sql .= "
                    AND
                        bestellart_id=1
                ";
            }
            $this->fetch = $this->conn->prepare( $sql );

            $sql = 'SELECT
                    letzte_aenderung_am
                FROM 
                    ' . $settings_table . '
                WHERE
                    id = ?
                AND
                    shops_ID=?
            ';
            if ( $bestellarten )
            {
                $sql .= "
                    AND
                        bestellart_id=1
                ";
            }
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
            list( $shops_ID, $id ) = explode( "_", $name );
            $this->fetch->bind_param( "ii", $id, $shops_ID );
            $this->fetch->execute();
            $res = $this->fetch->get_result();
            $row = $res->fetch_assoc();
            if ( $row )
            {
                $source = $row['inhalt'];
                $mtime = strtotime( $row['letzte_aenderung_am'] );
            }
            else
            {
                $source = null;
                $mtime = null;
            }

        }

        private function getBestellarten()
        {
            $sql = "SELECT * FROM bestellart";
            $result = $this->conn->query( $sql );

            if ( $result )
            {
                $sql = "SHOW FIELDS FROM web_settings LIKE 'bestellart_id'";
                $result = $this->conn->query( $sql );
                $test = ( $result->num_rows );
                return ( bool )$test;
            }
            else
            {
                echo $this->conn->error;
            }
            return false;
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
            list( $shops_ID, $id ) = explode( "_", $name );
            $this->mtime->bind_param( "ii", $id, $shops_ID );
            $this->mtime->execute();
            $res = $this->mtime->get_result();
            $row = $res->fetch_assoc();
            $mtime = $row["letzte_aenderung_am"];
            return strtotime( $mtime );
        }
    }

    // register the resource name "mysqli"
    $GLOBALS["ui"]->registerResource( 'mysqli', new Smarty_Resource_Mysqli() );