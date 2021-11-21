# Problems of no webpacker
  sudo npm install --global --force yarn
  
  rails webpacker:install
  
  rails server
  
# ActiveRecord::StatementInvalid: PG::UndefinedTable:ERROR: relation "xxx" does not exist
heroku run rake db:migrate   

# PG::InsufficientPrivilege: ERROR: permission denied
  sudo -u postgres -i;

  psql;

  ALTER USER [your OS username] CREATEDB;

# Admin username/password:
  admin/123
  
  **run heroku run db:seed** to generate default admin
  
# Start local PostgreSQL:
  pg_lsclusters  ##check status
  
  sudo service postgresql restart  ##restart
  
# update controller after adding column:
You must add the author column which you've added to the table now to the book_params method, something like this:

def book_params

  params.require(:book).permit(:title, :author)
  
end
