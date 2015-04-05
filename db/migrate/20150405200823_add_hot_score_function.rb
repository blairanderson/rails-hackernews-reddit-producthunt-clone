class AddHotScoreFunction < ActiveRecord::Migration
  # This is some sql borrowed from reddit:
  # https://github.com/reddit/reddit/blob/master/sql/functions.sql
  def up
    execute <<-SQL
      create or replace function
        hot_score(ups integer, downs integer, date timestamp with time zone)
        returns numeric as $$
        select round(cast(log(greatest(abs($1 - $2), 1)) * sign($1 - $2) +
          (date_part('epoch', $3) - 1134028003) / 45000.0 as numeric), 7)
      $$ language sql immutable;
    SQL
  end

  def down
    execute "DROP FUNCTION IF EXISTS hot_score(integer, integer, timestamp);"
  end
end
