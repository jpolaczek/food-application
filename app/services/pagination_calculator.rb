class PaginationCalculator
    def initialize(current_page)
        @current_page = current_page
    end

    def calculate_from
        number_already_fetched - TastyApi::Client::SIZE
    end

    def next?(total_count)
        number_already_fetched < total_count
    end

    def previous?
        current_page > 1
    end

    private

    def number_already_fetched
        (current_page * TastyApi::Client::SIZE)
    end
    
    attr_reader :current_page
end