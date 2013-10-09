source = ARGV[0]

prev = ARGV[1].split(" ")
curr = ARGV[2].split(" ")

ran = Set.new ActiveRecord::Base.connection.select_values("SELECT version FROM schema_migrations").map { |ver| Integer(ver, 10) }

(prev - curr).sort.reverse.each do |name|
  version = Integer(name.match(/^\d+/)[0])

  if ran.include?(version)
    puts `git checkout #{source} -- db/migrate/#{name}`

    begin
      STDERR.puts "Rolling back #{name}"
      ActiveRecord::Migrator.run(:down, 'db/migrate', version)
    rescue ActiveRecord::IrreversibleMigration
      puts "Irreversible migration, skipping it"
    ensure
      `git rm -f db/migrate/#{name}`
    end
  end
end

(curr - prev).sort.each do |name|
  version = Integer(name.match(/^\d+/)[0])

  begin
    STDERR.puts "Running #{name}"
    ActiveRecord::Migrator.run(:up, 'db/migrate', version) unless ran.include?(version)
  rescue ActiveRecord::IrreversibleMigration
    puts "Irreversible migration, skipping it"
  end
end
