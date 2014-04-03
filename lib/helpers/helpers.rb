class Routes < Urns::Base
  
  helpers do

    # def authenticate(role)
    # 
    #   case role
    # 
    #   when :distributor
    #     unless session[role]
    #       flash[:alert] = 'You must sign in to see that page.'
    #       redirect '/distributor/signin'
    #     end
    #   end
    # 
    # end
  
    def auth_distributor
      unless session[:distributor] == true || session[:admin] == true
        flash[:alert] = 'You must sign in to see that page.'
        redirect '/index'
      end
    end

    def auth_admin
      unless session[:admin] == true
        flash[:alert] = 'You must be an admin to see that page.'
        redirect '/index'
      end
    end
  
    def truncate x, options = {}
      options[:word_count]     ||= 100
      options[:end_string]     ||= '...'
      options[:decimal]        ||= 2
      options[:trailing_zeros] ||= false
      options[:round]          ||= true

      if x.kind_of? String
        return if x == nil
        words = x.split()
        return words[0..(options[:word_count]-1)].join(' ') + (words.length > options[:word_count] ? options[:end_string] : '')
      elsif numeric? x
        if options[:round] == true
          number = "%.#{options[:decimal]}f" % x.round(options[:decimal])
        else
          number = "%.#{options[:decimal]}f" % x.to_f
        end
        number = number.to_f unless options[:trailing_zeros]
        return number
      end
    end
    
    def active path
      path = Array[path] unless path.kind_of? Array
      match = false
      path.each { |p| match = true if request.path_info.include?(p) }
      'active' if match
    end
    
    def hidden
      'display: none;'
    end
    
    def numeric? x
      true if Float(x) rescue false
    end

  end
  
end