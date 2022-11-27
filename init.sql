CREATE TABLE node (
  node_id INT GENERATED ALWAYS AS IDENTITY,
  node_type VARCHAR(30),	
  content jsonb,
  created_at timestamp without time zone DEFAULT now(),
  PRIMARY KEY(node_id)
);

CREATE TABLE relation (
  relation_id INT GENERATED ALWAYS AS IDENTITY,
  relation_type VARCHAR(30),
  source_id INT,
  dest_id INT,
  content jsonb,
  created_at timestamp without time zone DEFAULT now(),
  PRIMARY KEY(relation_id),
  CONSTRAINT fk_source_node
    FOREIGN KEY(source_id) 
      REFERENCES node(node_id),
  CONSTRAINT fk_destination_node
    FOREIGN KEY(dest_id) 
      REFERENCES node(node_id)
);

CREATE TABLE account (
  account_id INT GENERATED ALWAYS AS IDENTITY,
  username VARCHAR(60),	
  password VARCHAR(120),
  profile_node_id INT,
  PRIMARY KEY(account_id),
  CONSTRAINT fk_profilenode
    FOREIGN KEY(profile_node_id) 
      REFERENCES node(node_id)
);