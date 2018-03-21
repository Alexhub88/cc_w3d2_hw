DROP TABLE bounties;

CREATE TABLE bounties(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  species VARCHAR(255),
  bounty_value INT,
  collected_by VARCHAR(255)
)
