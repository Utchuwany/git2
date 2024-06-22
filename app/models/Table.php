<?php
class Table {
    private $db;

    public function __construct($dbConfig) {
        try {
            $this->db = new mysqli($dbConfig['host'], $dbConfig['username'], $dbConfig['password'], $dbConfig['db_name']);
        } catch(Exception $e) {
            die("Błędne połączenie z bazą danych: " . $e->getMessage());
        }
    }

    public function paint($tableName) {
        return $this->getFilteredRows($tableName, []);
    }

    public function getFilteredRows($tableName, $filters) {
        // Lista dozwolonych nazw tabel, aby uniknąć SQL injection
        $allowedTables = ['users', 'work'];
        
        if (!in_array($tableName, $allowedTables)) {
            throw new Exception("Skorzystano z innej tabeli");
        }
        
        // Dynamicznie zbudowane zapytanie SQL z filtrami
        $whereClauses = [];
        $bindParams = [];
        $types = ''; // Inicjalizacja łańcucha typów

        foreach ($filters as $column => $value) {
            if (!empty($value)) {
                $whereClauses[] = "$column LIKE ?";
                $bindParams[] = "%$value%"; //zawiera taki ciag znakow 
                $types .= 's'; 
            }
        }

        $whereSql = !empty($whereClauses) ? 'WHERE ' . implode(' AND ', $whereClauses) : '';
        $query = "SELECT * FROM $tableName $whereSql";
        
        $stmt = $this->db->prepare($query);
        if ($stmt === false) {
            throw new Exception("Błąd wyrażenia sql:" . $this->db->error);
        }

        if (!empty($bindParams)) {
            $stmt->bind_param($types, ...$bindParams);
        }

        $stmt->execute();
        $result = $stmt->get_result();
        $rows = [];
        while ($row = $result->fetch_assoc()) {
            $rows[] = $row;
        }
        $stmt->close();
        return $rows;
    }

    public function updateRow($tableName, $id, $data) {
        $allowedTables = ['users','work'];
        
        if (!in_array($tableName, $allowedTables)) {
            throw new Exception("Skorzystano z innej tabeli");
        }

        $setClause = [];
        $bindParams = [];
        $types = ''; 

        foreach ($data as $column => $value) {
            if ($column === 'password') {
                // Jeśli aktualizujemy hasło, to zastosuj password_hash
                $setClause[] = "password = ?";
                $hashedPassword = password_hash($value, PASSWORD_ARGON2ID);
                $bindParams[] = $hashedPassword;
            } else {
                // W przeciwnym razie, normalnie
                $setClause[] = "$column = ?";
                $bindParams[] = $value;
            }

            
            if (is_int($value)) {
                $types .= 'i'; 
            } elseif (is_double($value)) {
                $types .= 'd'; 
            } elseif (is_string($value)) {
                $types .= 's'; 
            } else {
                $types .= 'b'; //wszystkie inne typy
            }
        }

        $setClause = implode(", ", $setClause);
        $query = "UPDATE $tableName SET $setClause WHERE id = ?";

        // Dodanie ID jako ostatni parametr
        $bindParams[] = $id;

        // Dodanie typu dla ID (zakładając, że ID jest typu integer)
        $types .= 'i';

        // Tworzenie tablicy z typami i wartościami
        $bindParams = array_merge([$types], $bindParams);

        $stmt = $this->db->prepare($query);

        // Użycie call_user_func_array do dynamicznego bindowania parametrów
        call_user_func_array(array($stmt, 'bind_param'), $this->refValues($bindParams));

        $result = $stmt->execute();
        $stmt->close();
        return $result;
    }

    // Metoda pomocnicza do przekazywania referencji do bind_param
    private function refValues($arr){
       $refs = array();
        foreach($arr as $key => $value)
            $refs[$key] = &$arr[$key];
        return $refs;
    }

    public function deleteRow($tableName, $id) {
        $allowedTables = ['users', 'work'];
    
        if (!in_array($tableName, $allowedTables)) {
           throw new Exception("Skorzystano z innej tabeli");
      }

      $query = "DELETE FROM $tableName WHERE id = ?";
       $stmt = $this->db->prepare($query);
       $stmt->bind_param("i", $id);

       $result = $stmt->execute();
       $stmt->close();
       return $result;
    }

  




}
?>
