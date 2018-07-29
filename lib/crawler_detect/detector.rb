module CrawlerDetect
  class Detector
    def initialize(user_agent)
      @user_agent = user_agent
    end

    def is_crawler?
      @is_crawler ||= begin
        !completely_exlusion? && matches_crawler_list?
      end
    end

    def crawler_name
      return unless is_crawler?
      @crawler_name
    end

    private

    def completely_exlusion?
      @user_agent.gsub!(exclusions_matcher, "")
      @user_agent.strip.length == 0
    end

    def matches_crawler_list?
      @crawler_name = crawlers_matcher.match(@user_agent).to_s
      !@crawler_name.empty?
    end

    def exclusions_matcher
      CrawlerDetect::Library.get("exclusions")
    end

    def crawlers_matcher
      CrawlerDetect::Library.get("crawlers")
    end
  end
end