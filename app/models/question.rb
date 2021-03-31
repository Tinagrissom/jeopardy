require 'pp'

class Question
  DB = PG.connect({:host => "localhost", :port => 5432, :dbname => 'jeopardy_development'})
    def self.all
      results = DB.exec("SELECT * FROM questions;")
      return results.map do |result|
       {
          "id" => result["id"].to_i,
          "question" => result["question"],
          "points" => result["points"].to_i,
          "category" => result["category"],
          "answer" => result["answer"]
        }
      end
      # results.each do |result|
      #   puts result
      # end
      # [
      #   { name: 'Darth Vader', age:45 },
      #   { name: 'Darth', age:65 },
      #   { name: 'Vader', age:25 }
      # ]
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
end
