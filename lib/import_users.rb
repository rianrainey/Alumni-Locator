module ImportUsers
  def self.import(uploaded_file)
    require 'pry'
    require 'roo'

    fu = FileUtility.new
    extension = fu.get_extension(uploaded_file.original_filename)
    spreadsheet = fu.get_spreadsheet(uploaded_file.path, extension)

    2.upto(spreadsheet.last_row) do |row|
      email  = spreadsheet.cell(row, 11)

      @user = User.find_by_email(email)
      @user ? @contact_info = @user.contact_info : @contact_info = ContactInfo.new

      if @user
        info = fu.get_user_info(spreadsheet, row, @contact_info)

        @user.update_attributes(contact_info: @contact_info)

      else
        info = fu.get_user_info(spreadsheet, row, @contact_info)

        User.create(email: email,
                    password: "{info.first_name.to_s.downcase}-{info.last_name.to_s.downcase}",
                    password_confirmation: "{info.first_name.to_s.downcase}-{info.last_name.to_s.downcase}",
                    contact_info: @contact_info )
      end
    end
 

  end

  class FileUtility
    def get_extension(filename) 
      /\.[a-zA-Z]{3,}$/.match(filename).to_s[1..-1]
    end

    def get_spreadsheet(filepath, extension="xls")
      binding.pry
      case extension
      when "xlsx"
        spreadsheet = Roo::Excelx.new(filepath, nil, :ignore)
      when "xls"
        spreadsheet = Roo::Excel.new(filepath, nil, :ignore)
      when "csv"
        spreadsheet = Roo::CSV.new(filepath, nil, :ignore)
      when "ods"
        spreadsheet = Roo::OpenOffice.new(filepath, nil, :ignore)
      else raise 'Unknown file type: #{filename.original_filename}'
      end
    end

    def get_user_info(spreadsheet, row, info)
      info.first_name           = spreadsheet.cell(row, 1)
      info.last_name            = spreadsheet.cell(row, 2)
      info.undergrad_school     = spreadsheet.cell(row, 3)
      info.undergrad_grad_year  = spreadsheet.cell(row, 4)
      info.home_address         = spreadsheet.cell(row, 5)
      info.home_address_2       = spreadsheet.cell(row, 6)
      info.home_city            = spreadsheet.cell(row, 7)
      info.home_state           = spreadsheet.cell(row, 8)
      info.home_zip_code        = spreadsheet.cell(row, 9)
      info.phone_main           = spreadsheet.cell(row, 10)
      info
    end
  end
end


#namespace :import do
#
  #task :scholars, [:filepath] => [:environment] do |s, args|

    #spreadsheet = Roo::Spreadsheet.open(args[:filepath])
    #column_count = spreadsheet.last_column

    #2.upto(spreadsheet.last_row) do |row|

      #email  = spreadsheet.cell(row, 11)

      #@user = User.find_by_email(email)
      #@user ? @contact_info = @user.contact_info : @contact_info = ContactInfo.new

      #if @user
        #info = get_user_info(spreadsheet, row, @contact_info)

        #@user.update_attributes(contact_info: @contact_info)

      #else
        #info = get_user_info(spreadsheet, row, @contact_info)

        #User.create(email: email,
                    #password: "#{info.first_name.to_s.downcase}-#{info.last_name.to_s.downcase}",
                    #password_confirmation: "#{info.first_name.to_s.downcase}-#{info.last_name.to_s.downcase}",
                    #contact_info: @contact_info )
      #end




    #end

  #end
#end

#def get_user_info(spreadsheet, row, info)
  #info.first_name           = spreadsheet.cell(row, 1)
  #info.last_name            = spreadsheet.cell(row, 2)
  #info.undergrad_school     = spreadsheet.cell(row, 3)
  #info.undergrad_grad_year  = spreadsheet.cell(row, 4)
  #info.home_address         = spreadsheet.cell(row, 5)
  #info.home_address_2       = spreadsheet.cell(row, 6)
  #info.home_city            = spreadsheet.cell(row, 7)
  #info.home_state           = spreadsheet.cell(row, 8)
  #info.home_zip_code        = spreadsheet.cell(row, 9)
  #info.phone_main           = spreadsheet.cell(row, 10)
  #info
#end




