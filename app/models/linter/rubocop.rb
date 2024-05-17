module Linter
  class Rubocop < Base
    FILE_REGEXP = /.+(\.rb|\.rake|\.jbuilder)|(Gemfile|Rakefile|Podfile)\z/

    def enqueue_job(attributes)
      RubocopJob.perform_async(attributes)
    end
  end
end
