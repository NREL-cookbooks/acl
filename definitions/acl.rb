define :acl do
  default = if(params[:default]) then "default:" else "" end
  recursive = if(params[:recursive]) then "-R" else "" end

  if(params[:user])
    acl = "#{default}user:#{params[:user]}:#{params[:modify]}"
    execute "setfacl #{recursive} -m '#{acl}' #{params[:name]}" do
      not_if "getfacl #{params[:name]} | grep -x '^#{acl}$'"
    end
  end

  if(params[:group])
    acl = "#{default}group:#{params[:group]}:#{params[:modify]}"
    execute "setfacl #{recursive} -m '#{acl}' #{params[:name]}" do
      not_if "getfacl #{params[:name]} | grep -x '^#{acl}$'"
    end
  end
end
