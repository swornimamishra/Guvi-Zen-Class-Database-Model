(A).Create a New Diagram:

(1).Click on the "Create New Diagram" button.
Give your diagram a name, such as "Guvi Zen Class Database Model."
Add Tables:

(2).Click the "Table" icon to add tables to your diagram.
Name your tables to reflect the entities in your database model.
(3).Add Columns:

Inside each table, add columns to define the attributes of your entities.
Specify the data type for each column (e.g., INT, VARCHAR, DATE).
Indicate primary keys, foreign keys, and unique constraints.
Establish Relationships:

(4).Use lines to connect tables and define relationships (one-to-one, one-to-many, many-to-many).
Label the relationships to clarify their nature.
Example Tables and Relationships for Zen Class Database

(a).Students Table
studentid (Primary Key, INT, AUTO_INCREMENT)
studentname (VARCHAR(255))
mobilenumber (VARCHAR(255), UNIQUE)
email (VARCHAR(255), UNIQUE)
mentorname (VARCHAR(255))
batchid (INT)
batchname (VARCHAR(255))
(b).Tasks Table
taskid (Primary Key, INT, AUTO_INCREMENT)
taskname (VARCHAR(255), UNIQUE)
studentid (INT)
mentorid (INT)
mentorname (VARCHAR(25))
batchname (VARCHAR(50))
(c).Mentors Table
mentorid (Primary Key, INT, AUTO_INCREMENT)
email (VARCHAR(50), UNIQUE)
contactno (VARCHAR(15), UNIQUE)
assignedbatch (VARCHAR(100))
(d).Batches Table
batchid (Primary Key, INT, AUTO_INCREMENT)
batchname (VARCHAR(255))
totalstudents (INT)
mentorid (INT)
(e).Queries Table
queryid (Primary Key, INT, AUTO_INCREMENT)
querytext (TEXT)
studentid (INT)
mentorid (INT)
(f).Dashboards Table
dashboardid (Primary Key, INT, AUTO_INCREMENT)
studentid (INT)
mentorid (INT)
batchid (INT)
(g).Mock Interviews Table
mockinterviewid (Primary Key, INT, AUTO_INCREMENT)
studentid (INT)
mentorid (INT)
batchid (INT)
(5).Foreign Key Relationships
The studentinfo table references the batchinfo table via batchid.
The taskinfo table references the studentinfo table via studentid.
The taskinfo table references the mentorinfo table via mentorid.
The batchinfo table references the mentorinfo table via mentorid.
The queryinfo table references the studentinfo table via studentid.
The queryinfo table references the mentorinfo table via mentorid.
The dashboardinfo table references the studentinfo table via studentid.
The dashboardinfo table references the mentorinfo table via mentorid.
The dashboardinfo table references the batchinfo table via batchid.
The mockinterviewinfo table references the studentinfo table via studentid.
The mockinterviewinfo table references the mentorinfo table via mentorid.
The mockinterviewinfo table references the batchinfo table via batchid.
(6).Exporting Your Model
(7).Export as SQL or Image:
(A).Once your model is complete, export it as SQL code and as an image.
(B).You can use the generated SQL code to create your database schema.
