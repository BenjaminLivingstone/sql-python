USE db_friendship;

-- Usando el siguiente ERD como referencia, escribe una consulta SQL que devuelva una lista de usuarios junto con los nombres de sus amigos.
SELECT users.first_name, users.last_name, users2.first_name, users2.last_name 
FROM users 
JOIN friendships ON users.id = friendships.user_id 
JOIN users AS users2 ON friendships.friend_id = users2.id;

-- Devuelva a todos los usuarios que son amigos de Kermit, asegúrese de que sus nombres se muestren en los resultados.
SELECT * FROM users;
SELECT * FROM friendships;
SELECT users.first_name, users.last_name, users2.first_name, users2.last_name 
FROM users 
JOIN friendships ON friendships.friend_id = users.id 
JOIN users AS users2 ON friendships.friend_id = users2.id
WHERE friendships.friend_id= 4;

-- Devuelve el recuento de todas las amistades.
-- Descubre quién tiene más amigos y devuelve el recuento de sus amigos.
-- Crea un nuevo usuario y hazlos amigos de Eli Byers, Kermit The Frog y Marky Mark.
-- Devuelve a los amigos de Eli en orden alfabético.
-- Eliminar a Marky Mark de los amigos de Eli.
-- Devuelve todas las amistades, mostrando solo el nombre y apellido de ambos amigos