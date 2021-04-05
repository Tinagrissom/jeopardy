require 'pp'

class Question
  DB = PG.connect({:host => "localhost", :port => 5432, :dbname => 'jeopardy_development'})
    def self.all
      results = DB.exec("SELECT * FROM questions ORDER BY id ASC;")
      return results.map do |result|
       {
          "id" => result["id"].to_i,
          "question" => result["question"],
          "points" => result["points"].to_i,
          "category" => result["category"],
          "answer" => result["answer"]
        }
      end
    end

    def self.find(id)
        results = DB.exec("SELECT * FROM questions WHERE id=#{id};")
        return {
            "id" => results.first["id"].to_i,
            "question" => results.first["question"],
            "points" => results.first["points"].to_i,
            "category" => results.first["category"],
            "answer" => results.first["answer"],
        }
    end

    def self.create(opts)
      pp opts
      results = DB.exec(
      <<-SQL
          INSERT INTO questions (question, points, category, answer)
          VALUES ( '#{opts["question"]}', #{opts["points"]}, '#{opts["category"]}', '#{opts["answer"]}' )
          RETURNING id, question, points, category, answer;
      SQL
  )
        return {
          "id" => results.first["id"].to_i,
          "question" => results.first["question"],
          "points" => results.first["points"].to_i,
          "category" => results.first["category"],
          "answer" => results.first["answer"],
        }
    end

    def self.delete(id)
      results = DB.exec("DELETE FROM questions WHERE id = #{id};")
      return { "deleted" => true }
    end

    def self.update(id, opts)
      results = DB.exec(
        <<-SQL
              UPDATE questions
              SET question='#{opts["question"]}', points=#{opts["points"]}, category='#{opts["category"]}', answer='#{opts["answer"]}'
              WHERE id=#{id}
              RETURNING id, question, points, category, answer;
        SQL
      )
          return {
            "id" => results.first["id"].to_i,
            "question" => results.first["question"],
            "points" => results.first["points"].to_i,
            "category" => results.first["category"],
            "answer" => results.first["answer"],
          }
    end
end
