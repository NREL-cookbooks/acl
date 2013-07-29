define :acl do
  if(params[:user])
    acl = "user:#{params[:user]}:#{params[:modify]}"
    execute "setfacl -m '#{acl}' #{params[:name]}" do
      not_if "getfacl #{params[:name]} | grep -x '^#{acl}$'"
    end
  end

  if(params[:group])
    acl = "group:#{params[:group]}:#{params[:modify]}"
    execute "setfacl -m '#{acl}' #{params[:name]}" do
      not_if "getfacl #{params[:name]} | grep -x '^#{acl}$'"
    end
  end
end
