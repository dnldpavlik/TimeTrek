class State
    def to_s 
        name
    end

    def name
        self.class.name.split('::').last
    end
end
