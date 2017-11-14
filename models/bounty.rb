require('pg')
class Bounty

attr_accessor :name, :species, :bounty, :danger_level
attr_reader :id

  def initialize(input)
    @id = input['id'].to_i if input['id']
    @name = input['name']
    @species = input['species']
    @bounty = input['bounty'].to_i
    @danger_level = input['danger_level']
  end

  def save
    db = PG.connect({dbname: 'bounty_tracker', host: 'localhost'})
    sql = "INSERT INTO bounty_tracker
    (
      name,
      species,
      bounty,
      danger_level
    )
    VALUES (
      $1, $2, $3, $4
    )
    RETURNING *
  "
  values = [@name, @species, @bounty, @danger_level]
  db.prepare('save', sql)
  @id = db.exec_prepared("save", values)[0]["id"].to_i
  db.close
  end

  def update
    db = PG.connect({dbname: 'bounty_tracker', host: 'localhost'})
    sql = "UPDATE bounty_tracker
    SET (name, species, bounty, danger_level) = ($1, $2, $3, $4)
    WHERE id = $5"
    values = [@name, @species, @bounty, @danger_level, @id]
    db.prepare("update", sql)
    db.exec_prepared("update", values)
    db.close
  end

  def delete
    db = PG.connect({dbname: 'bounty_tracker', host: 'localhost'})
    sql = "DELETE FROM bounty_tracker WHERE id = $1"
    values = [@id]
    db.prepare("delete", sql)
    db.exec_prepared("delete", values)
    db.close
  end

  def self.find_by_id(id)
    db = PG.connect({dbname: 'bounty_tracker', host: 'localhost'})
    sql = "SELECT * FROM bounty_tracker WHERE id = $1"
    values = [id]
    db.prepare("find", sql)
    bounty = db.exec_prepared("find", values)
    db.close
    return bounty.map{|alien| Bounty.new(alien)}

  end

end
