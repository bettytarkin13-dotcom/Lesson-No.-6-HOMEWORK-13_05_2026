--1_The TABLE violates Firs Normal From (1NF) un two ways:
--A.The email column contains multiple values in a single cell,which violates atomicity.
--B. The columns tag1,tag2 and tag3 represent repeating groups instead of storing a single attribute in a single column.--

--2.Design a normalized schema with separate tables for contacts, emails, and tags.--

CREATE TABLE contacts (
    id INTEGER PRIMARY KEY,
	full_name TEXT NOT NULL
);

CREATE TABLE contact_emails(
      id INTEGER PRIMARY KEY,
	  contact_id INTEGER NOT NULL,
	  email TEXT NOT NULL,
	  FOREIGN KEY (contact_id) REFERENCES contacts(id)
);

CREATE TABLE contact_tags(
       id INTEGER PRIMARY KEY,
	   contact_id INTEGER NOT NULL,
	   tag TEXT NOT NULL,
	   FOREIGN KEY (contact_id) REFERENCES contacts(id)
);

--3.Write CREATE TABLE statements for all tables with proper PKs and FKs.
DROP TABLE IF EXISTS contact_tags;
DROP TABLE IF EXISTS contact_emails;
DROP TABLE IF EXISTS contacts;
CREATE TABLE contacts (
    id INTEGER PRIMARY KEY,
	full_name TEXT NOT NULL
);

CREATE TABLE contact_emails(
      id INTEGER PRIMARY KEY,
	  contact_id INTEGER NOT NULL,
	  email TEXT NOT NULL,
	  FOREIGN KEY (contact_id) REFERENCES contacts(id) ON DELETE CASCADE
);

CREATE TABLE contact_tags(
       id INTEGER PRIMARY KEY,
	   contact_id INTEGER NOT NULL,
	   tag TEXT NOT NULL,
	   FOREIGN KEY (contact_id) REFERENCES contacts(id) ON DELETE CASCADE
);

--4.Insert the data from the original table into your new schema.

INSERT INTO contacts (id,full_name) VALUES
(1, 'Ana Silva'),
(2,'Joao Souza');

INSERT INTO contact_emails (contact_id, email) VALUES
(1,'ana@a.com'),
(1,'ana@b.com'),
(2,'joao@c.com');

INSERT INTO contact_tags (contact_id, tag) VALUES
(1,'VIP'),
(1,'Newsletter'),
(2,'Newsletter');


--5.Write a query to find all contacts that have the tag 'Newsletter'.--

SELECT DISTINCT c.id, c.full_name
FROM contacts c
JOIN contact_tags t ON c.id = t.contact_id
WHERE t.tag = 'Newsletter';

--6.Write a query to find all emails for contact id 1.--

SELECT email
FROM contact_emails
WHERE contact_id = 1;
