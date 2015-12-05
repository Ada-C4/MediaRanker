module ApplicationHelper

    def list(media)
      a=[]
      count = 0
      media.each do |medium|
        if count < 10
          a.push(medium)
        end
        count += 1
      end
      return a
    end
end
