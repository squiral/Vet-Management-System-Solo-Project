DROP TABLE animals;
DROP TABLE vets;


CREATE TABLE vets
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null
);

CREATE TABLE animals
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  date_of_birth VARCHAR(255),
  type VARCHAR(255),
  treatment_notes VARCHAR(255),
  vet_id INT8 references vets(id) ON DELETE SET NULL
);
