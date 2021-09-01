'JOIN Types'

'Type'	            'Description'
INNER JOIN	        'Returns all rows when there is at least one match in BOTH tables'
LEFT [OUTER] JOIN	'Returns all rows from the left table, and the matched rows from the right table'
RIGHT JOIN*	        'Returns all rows from the right table, and the matched rows from the left table'
FULL JOIN*	        'Returns all rows when there is a match in ONE of the tables'
'(* not supported by SQLite)'

'INNER JOIN ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ '
    SELECT Cats.name, Cats.breed, Owners.name
    AS "owner_name"
    FROM Cats
    INNER JOIN Owners
    ON Cats.owner_id = Owners.id; 

    Returns =>
        name             breed            owner_name
        ---------------  ---------------  ----------
        Maru             Scottish Fold    mugumogu  
        Hana             Tabby            mugumogu  
        Nona             Tortoiseshell    Sophie 


'LEFT [OUTER] JOIN ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ '
    SELECT Cats.name, Cats.breed, Owners.name 
    FROM Cats 
    LEFT OUTER JOIN Owners 
    ON Cats.owner_id = Owners.id; 

    'Returns =>'
        name             breed            name      
        ---------------  ---------------  ----------
        Maru             Scottish Fold    mugumogu  
        Hana             Tabby            mugumogu  
        Nona             Tortoiseshell    Sophie 
        Lil Bub          perma-kitten          

'RIGHT OUTER JOIN ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ '
    SELECT Cats.name, Cats.breed, Owners.name 
    FROM Cats 
    RIGHT OUTER JOIN Owners 
    ON Cats.owner_id = Owners.id; 

    'Returns =>'
        name             breed            name      
        ---------------  ---------------  ----------
        Maru             Scottish Fold    mugumogu  
        Hana             Tabby            mugumogu  
        Nona             Tortoiseshell    Sophie    
                                          Penny

'FULL OUTER JOIN ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ '
    SELECT Cats.name, Cats.breed, Owners.name
    FROM Cats
    FULL OUTER JOIN Owners
    ON Cats.owner_id = Owners.id;

    'Returns =>'
    name             breed            name      
    ---------------  ---------------  ----------
    Maru             Scottish Fold    mugumogu  
    Hana             Tabby            mugumogu  
    Nona             Tortoiseshell    Sophie 
    Lil Bub          perma-kitten 
                                      Penny