-- 1
-- Write a query that returns a list of reservations that end in July 2023, including the name of the guest, the room number(s), and the reservation dates.
SELECT g.forename, g.surname, res.room_num, res.start, res.end
FROM reservation AS res
JOIN guest AS g
ON res.guest_id = g.id
WHERE res.`END` LIKE "2023-07-%";

-- 2
-- Write a query that returns a list of all reservations for rooms with a jacuzzi, displaying the guest's name, the room number, and the dates of the reservation.
SELECT g.forename, g.surname, res.room_num, res.start, res.end
FROM reservation AS res
JOIN guest AS g
ON res.guest_id = g.id
JOIN room_amenity AS ra
WHERE ra.room_num = res.room_num AND ra.amenity_id = 2;

-- 3
-- Write a query that returns all the rooms reserved for a specific guest, including the guest's name, the room(s) reserved, the starting date of the reservation, and how many people were included in the reservation
SELECT g.forename, g.surname, res.room_num, (res.n_adults + res.n_child) AS `total_res`, res.start
FROM reservation AS res
JOIN guest AS g
ON res.guest_id = g.id AND g.forename = "Bettyann";

-- 4
-- Write a query that returns a list of rooms, reservation ID, and per-room cost for each reservation. The results should include all rooms, whether or not there is a reservation associated with the room.
SELECT r.num, res.id, r.base_price
FROM reservation AS res
RIGHT JOIN room AS r
ON r.num = res.room_num;

-- 5
-- Write a query that returns all rooms with a capacity of three or more and that are reserved on any date in April 2023.
SELECT num FROM room
JOIN reservation AS res
ON room.num = res.room_num AND res.start LIKE "2023-03-%"
WHERE room.max_occ >= 3;
 
-- 6
-- Write a query that returns a list of all guest names and the number of reservations per guest, sorted starting with the guest with the most reservations and then by the guest's last name.
SELECT g.forename, g.surname, COUNT(*) AS c
FROM guest AS g
JOIN reservation AS r
ON r.guest_id = g.id
GROUP BY g.id
ORDER BY c DESC, g.surname DESC;

-- 7
--  Write a query that displays the name, address, and phone number of a guest based on their phone number.
SELECT forename, surname, address, city, state, zip, phone FROM guest WHERE phone="(377) 507-0974";