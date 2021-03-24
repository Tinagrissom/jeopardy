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
        return results
    end
end
