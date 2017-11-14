DROP TABLE IF EXISTS 'bounty_tracker';

CREATE TABLE bounty_tracker(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  species VARCHAR(255),
  bounty INT2,
  danger_level VARCHAR(255)
);
