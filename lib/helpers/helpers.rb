class Routes < Urns::Base
  
  helpers do
    sample_helper()

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
      sample_helper()
      unless session[:distributor] == true || session[:admin] == true
        flash[:alert] = 'You must sign in to see that page.'
        redirect '/index'
      end
    end

    def auth_admin
      sample_helper()
      unless session[:admin] == true
        flash[:alert] = 'You must be an admin to see that page.'
        redirect '/index'
      end
    end
  
    def truncate x, options = {}
      sample_helper()
      options[:word_count]     ||= 100
      options[:end_string]     ||= '...'
      options[:decimal]        ||= 2
      options[:trailing_zeros] ||= false
    
      if x.kind_of? String
        return if x == nil
        words = x.split()
        return words[0..(options[:word_count]-1)].join(' ') + (words.length > options[:word_count] ? options[:end_string] : '')
      elsif numeric? x
        number = "%.#{options[:decimal]}f" % x.to_f
        number = number.to_f unless options[:trailing_zeros]
        return number
      end
    end

  end
  
end