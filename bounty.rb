require('pg')

class Bounty
  attr_accessor :name, :species, :bounty_value, :collected_by
  attr_reader :id

  def initialize(bounty)
    @name = bounty['name']
    @species = bounty['species']
    @bounty_value = bounty['bounty_value'].to_i
    @collected_by = bounty['collected_by']
    @id = bounty['id']
  end

  def save()
    db = PG.connect( { dbname: 'bounty_hunter', host: 'localhost' } )
    sql = "
    INSERT INTO bounties (name, species, bounty_value, collected_by)
    VALUES
    ($1, $2, $3, $4);
    "
    values = [@name, @species, @bounty_value, @collected_by]

    db.prepare("save_it", sql)
    db.exec_prepared("save_it", values)
    db.close()
  end

  def update()
    db = PG.connect( { dbname: 'bounty_hunter', host: 'localhost' } )
    sql = "
    UPDATE bounties
    SET (name, species, bounty_value, collected_by)
     = ($1, $2, $3, $4)
     WHERE id = $5;
    "
    values = [@name, @species, @bounty_value, @collected_by, @id]

    db.prepare("update", sql)
    db.exec_prepared("update", values)
    db.close()
  end

  def Bounty.get_all()
    db = PG.connect( { dbname: 'bounty_hunter', host: 'localhost' } )
    sql = "
    SELECT * FROM bounties;
    "

    db.prepare("get_all", sql)
    bounty_list = db.exec_prepared("get_all")
    db.close()

    bounty_list_objects = []
    for bounty in bounty_list
      bounty_list_objects << Bounty.new(bounty)
    end
     return bounty_list_objects
  end

  def Bounty.delete_all()
    db = PG.connect( { dbname: 'bounty_hunter', host: 'localhost' } )
    sql = "
    DELETE FROM bounties;
    "

    db.prepare("delete_all", sql)
    db.exec_prepared("delete_all")
    db.close()
  end

end
