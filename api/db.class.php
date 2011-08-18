<?php
class db
{
    private static $config = array(
        "host" => "127.0.0.1",
        "user" => "cgsc",
        "pass" => "batmaniswearingpanties",
        "db" => "cgsc");

    /**
     * @static
     * @return mysqli
     */
    public static function getMySqli()
    {
        return new mysqli(self::$config["host"] . "1", self::$config["user"], self::$config["pass"], self::$config["db"]);
    }

    /**
     * @static
     * @return void
     */
    public static function CreateDB()
    {
        $db = self::getMySqli();
        $sql = file_get_contents("db.sql");
        $db->multi_query($sql);
        $db->close();
    }

    public static function __callStatic($name, $arguments)
    {
        $single = substr($name,-1) != "s";
        $table_name = strtolower(substr($name,3)).($single?"s":"");
        $var = isset($arguments[0])?$arguments[0]*($single?1:10):0;
        $db = db::getMySqli();
        $sql = "SELECT * FROM ".$table_name.($single?" WHERE id=?;":" LIMIT ?,10;");
        $stmt = $db->prepare($sql);
        $stmt->bind_param("i", $var);
        $stmt->execute();
        $meta = $stmt->result_metadata();
        $fields = $meta->fetch_fields();
        $result = array();
        $results = array();
        $field_list = array();
        foreach ($fields as $field) {
            $result[$field->name] = null;
            $field_list[$field->name] = &$result[$field->name];
        }
        call_user_func_array(array($stmt, 'bind_result'), $field_list);
        if(substr($name,-1) != "s"){
            if(!$stmt->fetch()) $result = null;
            $stmt->close();
            $db->close();
            return $result;
        }
        while ($stmt->fetch()) {
            $results[] = $result;
        }
        $stmt->close();
        $db->close();
        return $results;
    }

}